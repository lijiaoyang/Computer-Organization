`timescale 1ns / 1ps
module mips(
	input clk,
	input reset
    );
//IF
	wire [31:0]Instr_IF;
	wire [31:0]MUX_PC_OUT;//PCEN前的PC
	wire [31:0]PCOut;//PCEN后的PC
	wire [31:0]PCPlus4Out;//PCOut+4
	wire [1:0]PC_MUX_Signal;//控制PC,01->(J_Type||B_Type),00->其他
	
//ID
	wire [31:0] Instr_ID;
	wire [31:0] PCPlus4_ID;
	wire [31:0] PCPlus8_ID;//PCPlus4_ID + 4
	wire [1:0] EXTOP;
	wire [31:0] RD1;
	wire [31:0] RD2;
	wire [31:0] EXTOut;
	wire [31:0] NextPCCalcOut;//当不是简单的PC+4时，pc的下一条指令的位置
	wire [31:0] RD1_MUX_OUT;  //GPR[rs]
	wire [31:0] RD2_MUX_OUT;  //GPR[rt]
	wire DM_WriteEnable_D;   //决定DM是否写入，在ID阶段就可以判断了
	wire BranchD,JRD;	
	
//CMP
	wire BIG_ZERO;
	wire EQUAL_ZERO;
	wire LESS_ZERO;
	wire EQUAL;

//EX
	 assign IDEX_EN = 1'b1;   //ID-EX墙始终可以通过
	 wire [31:0] Instr_EX;
	 wire [31:0] PCPlus4_EX;
	 wire [31:0] RD1_EX;
	 wire [31:0] RD2_EX;
	 wire [31:0] EXTOUT_EX;
	 wire REG_WEE;//GPR_WriteEnable_E
	 wire [1:0] GPR_WD_MUX_E; //在EX阶段判断写回的数据是哪个
	 
	 wire	[3:0]ALUOP;
	 wire [31:0]ALU_OUTPUT;
	 wire [1:0] GPR_WA_MUX_Signal;//判断写回rt还是rd还是$31
	 wire [4:0] GPR_WA;           //写回的地址
	 
	 wire [31:0] ALU_A_OUT;//ALU_A端口到底是哪个
	 wire [31:0] ALU_BH_OUT;//ALU_B的00端口
	 wire [31:0] ALU_B_OUT;//ALU_B端口到底是哪个
	 wire [1:0] ALU_B_MUX_Signal;//选择ALU_B到底是哪个
	 
//DM
	 wire [31:0] Instr_DM;
	 wire [31:0] WriteBackM_DM;//可能是ALUOUT_DM,也可能是PCPlus4_DM
	 wire [31:0] PCPlus4_DM;
	 wire [31:0] ALUOUT_DM;
	 wire [4:0] GPR_WA_DM;
	 wire [31:0] RD2_DM;
	 wire REG_WEM;//GPR_WriteEnable_M
	 wire DM_WriteEnable_M;
	 
	 wire [31:0]DM_ReadDataOut;  // 从DM读出的数据
	 wire [1:0]GPR_WD_MUX_M;     // 在MEM阶段判断写回哪个数据
	 
	 wire [31:0] DM_WD_FanPaoQuan_OUT;  
//WB
	 wire [31:0] Instr_WB;
	 wire [31:0] PCPlus4_WB;
	 wire [31:0] ALUOUT_WB;
	 wire [31:0] MEMOUT_WB;
	 wire [31:0] GPR_WD_MUX_OUT;
	 wire [1:0] GPR_WD_MUX_W;
    wire [4:0] GPR_WA_WB;
	 wire REG_WEW;//GPR_WriteEnable_W

//HHH
	wire PCWriteEnable;
	wire IDEX_CLR;
	wire IFID_EN;
	wire [1:0] MUX_RD1_Comp_Signal;
	wire [1:0] MUX_RD2_Comp_Signal;
	wire [1:0] MUX_ALU_A_Signal;
	wire [1:0] MUX_ALU_B_Signal;
	wire [1:0] MUX_DM_WD_Signal;

//begin	
//-----------------------IF----------------------//
	MUX32 PC_select(
		.A(PCPlus4Out),//00
		.B(NextPCCalcOut),//01->(J_Type||B_Type)，需要做pc运算
		.MUXOP(PC_MUX_Signal),//2位
		.OUT(MUX_PC_OUT)
	);
	
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCEnable(PCWriteEnable),//PC使能端
		.PCIn(MUX_PC_OUT),
		.PCOut(PCOut)
	);
	
	IM IM(
		.Addr(PCOut),
		.Instr(Instr_IF)	
	);
	
	PCPlus4 PCPlus4(
		.PC(PCOut),
		.PCPlus4(PCPlus4Out)//PCOut + 4
	);
	
//-------------------IF-ID-------------------//
	IF_ID IF_ID(
		.clk(clk),
		.reset(reset),
		.IFID_CLR(1'b0),//IFID墙 清零端初始化为0
		.IFID_EN(IFID_EN),
		.Instr_IN(Instr_IF),//-------------Instr_IF   -> Instr_ID
		.PCPlus4_IN(PCPlus4Out),//---------PCPlus4Out -> PCPlus4_ID
		.Instr_OUT(Instr_ID),
		.PCPlus4_OUT(PCPlus4_ID)
	);	
//---------------------ID--------------------//
	CTRL_ID CTRL_ID(
		.Instr(Instr_ID),
		.EXTOP(EXTOP),
		.PCMUX(PC_MUX_Signal),
		.DM_WED(DM_WriteEnable_D),
		.BranchD(BranchD),//B类指令
		.JRD(JRD)//J类指令
	);
	
	GRF GRF(
		.clk(clk),
		.reset(reset),
		.RS(Instr_ID[25:21]),
		.RT(Instr_ID[20:16]),
		.WriteAdd(GPR_WA_WB),/////////WB_REGW////写回的寄存器
		.WriteData(GPR_WD_MUX_OUT),//写回的数据
		.GPR_WriteEnable(REG_WEW),
		.RD1(RD1),/////ReadDataOut1
		.RD2(RD2)
	);
	
	EXT EXT(
		.IMM(Instr_ID[15:0]),
		.OUT(EXTOut),
		.EXTOP(EXTOP)
	);
	
	NPC_CAL NPC_CAL(
		.Instr(Instr_ID),
		.PCPlus4(PCPlus4_ID),
		.JR_READ(RD1_MUX_OUT),//JR其实就是RD1经过mux的结果
		.BIG_ZERO(BIG_ZERO),
		.EQUAL_ZERO(EQUAL_ZERO),
		.LESS_ZERO(LESS_ZERO),
		.EQUAL(EQUAL),
		.NPC(NextPCCalcOut)	//计算得出的下个的PC的值
	);
	
	PCPlus4 PCPlus4_D(//jal
		.PC(PCPlus4_ID),
		.PCPlus4(PCPlus8_ID)
	);
	
	MUX32 RD1_HAZZARD(
		.A(RD1),
		.B(WriteBackM_DM),//转发
		.C(PCPlus8_ID),//前序指令是jal
		.MUXOP(MUX_RD1_Comp_Signal),
		.OUT(RD1_MUX_OUT)
	);
	
	MUX32 RD2_HAZZARD(
		.A(RD2),
		.B(WriteBackM_DM),//转发
		.C(PCPlus8_ID),//前序指令是jal
		.MUXOP(MUX_RD2_Comp_Signal),
		.OUT(RD2_MUX_OUT)
	);
	
	CMP CMP(
		.RD1(RD1_MUX_OUT),
		.RD2(RD2_MUX_OUT),
		.BIG_ZERO(BIG_ZERO),
		.EQUAL_ZERO(EQUAL_ZERO),
		.LESS_ZERO(LESS_ZERO),
		.EQUAL(EQUAL)
	);
//------------------ID-EX------------------//
	ID_EX ID_EX(
		.clk(clk),
		.reset(reset),
		.IDEX_CLR(IDEX_CLR),   //清零
		.IDEX_EN(IDEX_EN),	  //使能端
		.Instr_IN(Instr_ID),//-------------Instr_ID   -> Instr_EX
		.PCPlus4_IN(PCPlus8_ID),
		.RD1_IN(RD1),
		.RD2_IN(RD2),
		.EXT_IN(EXTOut),
		.Instr_OUT(Instr_EX),
		.PCPlus4_OUT(PCPlus4_EX),//------------PCPlus8_ID  ->  PCPlus4_EX
		.RD1_OUT(RD1_EX),
		.RD2_OUT(RD2_EX),
		.EXT_OUT(EXTOUT_EX)		
	);
//EX

	CRTL_EX CRTL_EX(
		.Instr(Instr_EX),
		.ALUOP(ALUOP),
		.ALU_B_MUX(ALU_B_MUX_Signal),  //***扩展***决定ALU_B端到底是啥,(ORI || LW || SW || LUI || ADDI || ADDIU)->01
		.GPR_WA_MUX(GPR_WA_MUX_Signal),//判断写回rt还是rd
		.REG_WEE(REG_WEE),             //RegWrite_Enable_EX,决定指令是否写入寄存器
		.GPR_WD_MUXE(GPR_WD_MUX_E)     //选择写回的数据
	);
	
	MUX32 ALU_A_Hazzard(
		.A(RD1_EX),//RD1
		.B(GPR_WD_MUX_OUT),//from WB
		.C(WriteBackM_DM),//from MEM
		.MUXOP(MUX_ALU_A_Signal),//选择ALU_A到底是哪个 ----- jr也是接的这个端口，因为jr是rs所以本质跟RD1一样的
		.OUT(ALU_A_OUT)
	);
	
	MUX32 ALU_B_Hazzard(
		.A(RD2_EX),//RD2
		.B(GPR_WD_MUX_OUT),
		.C(WriteBackM_DM),
		.MUXOP(MUX_ALU_B_Signal),//选择ALU_BH到底是哪个
		.OUT(ALU_BH_OUT)
	);
	
	MUX32 ALU_B(
		.A(ALU_BH_OUT),
		.B(EXTOUT_EX),
		.MUXOP(ALU_B_MUX_Signal),//需要扩展->01
		.OUT(ALU_B_OUT)
	);
	
	ALU ALU(
		.ALUOP(ALUOP),
		.Instr(Instr_EX),
		.A(ALU_A_OUT),       //无符号
		.A_Signed(ALU_A_OUT),//有符号
		.B(ALU_B_OUT),
		.B_Signed(ALU_B_OUT),
		.C(ALU_OUTPUT)	
	);
	
	MUX5 GRF_WA_MUX(
		.A(Instr_EX[20:16]),//rt
		.B(Instr_EX[15:11]),//rd
		.MUXOP(GPR_WA_MUX_Signal),//判断写回rt还是rd,还是$31
		.OUT(GPR_WA)//-------------GPR_WA是EX阶段的
	);
	
//-----------------EX-MEM--------------------------------//

	EX_MEM EX_MEM(
		.clk(clk),
		.reset(reset),
		.EXMEM_CLR(reset),
		.Instr_IN(Instr_EX),    //-------------Instr_EX   -> Instr_DM
		.PCPlus4_IN(PCPlus4_EX),//------PCPlus4_EX  ->  PCPlus4_DM
		.ALUResult_IN(ALU_OUTPUT),//------ALU_OUTPUT -> ALUOUT_DM
		.RD2_IN(ALU_BH_OUT),    //--ALU_BH_OUT -> RD2_DM  (WriteData写入存储器的数据)
		.GPR_WA_IN(GPR_WA),     //------GPR_WA -> GPR_WA_DM （写回寄存器的地址）
		.Instr_OUT(Instr_DM),
		.PCPlus4_OUT(PCPlus4_DM),
		.ALUResult_OUT(ALUOUT_DM),
		.RD2_OUT(RD2_DM),
		.GPR_WA_OUT(GPR_WA_DM)
	);
	
//MEM
	CRTL_MEM CRTL_MEM(
		.Instr(Instr_DM),
		.DM_WEM(DM_WriteEnable_M),    //LW
		.DM_REM(DM_ReadEnable),      //SW
		.REG_WEM(REG_WEM),          //RegWrite_MEM,写入寄存器的指令
		.GPR_WD_MUXM(GPR_WD_MUX_M) //MemtoReg_MEM	lw->01 jal->10	
	);
	
	MUX32 DM_WD(
    .A(RD2_DM),
    .B(GPR_WD_MUX_OUT),  
    .MUXOP(MUX_DM_WD_Signal), 
    .OUT(DM_WD_FanPaoQuan_OUT)///////////反跑圈（前sw后lw）,他是最终写入DM的数据
	);

	DM DM(
		.DataAdd(ALUOUT_DM),
		.WriteData(DM_WD_FanPaoQuan_OUT),
		.clk(clk),
		.reset(reset),
		.WriteEnable(DM_WriteEnable_M), 
		.ReadEnable(DM_ReadEnable),
		.ReadDataOut(DM_ReadDataOut)		
	);
	
	MUX32 WriteBackM_MUX(
		.A(ALUOUT_DM),//00
		.C(PCPlus4_DM),//10->jal -----（此时lw还没有数据取出，所以lw虚接01端口）
		.MUXOP(GPR_WD_MUX_M),
		.OUT(WriteBackM_DM)//写回的数据
	);
	
//----------------MEM-WB---------------------//
	MEM_WB MEM_WB(
		.clk(clk),
		.reset(reset),
		.MEMWB_CLR(reset),
		.GPR_WA_IN(GPR_WA_DM),  //GPR_WA_DM -> GPR_WA_WB
		.Instr_IN(Instr_DM),    //Instr_DM  -> Instr_WB
		.PCPlus4_IN(PCPlus4_DM),//PCPlus4_DM-> PCPlus4_WB
		.ALUResult_IN(ALUOUT_DM),//ALUOUT_DM -> ALUOUT_WB
		.MEM_IN(DM_ReadDataOut), //DM_ReadDataOut -> MEMOUT_WB
		.GPR_WA_OUT(GPR_WA_WB),
		.Instr_OUT(Instr_WB),
		.PCPlus4_OUT(PCPlus4_WB),
		.ALUResult_OUT(ALUOUT_WB),
		.MEM_OUT(MEMOUT_WB)
	);
	
//WB

	CTRL_WB CTRL_WB(
		.Instr(Instr_WB),
		.REG_WEW(REG_WEW),//RegWrite_WB
		.GPR_WD_MUXW(GPR_WD_MUX_W)	//LW->01  JAL->10
	);
	
	MUX32 GPR_WD_MUX(
		.A(ALUOUT_WB),//00
		.B(MEMOUT_WB),//01->LW（此时lw才有数）
		.C(PCPlus4_WB),//10->JAL
		.MUXOP(GPR_WD_MUX_W),
		.OUT(GPR_WD_MUX_OUT)//写回寄存器的数据
	);
	
//HHH
	SH SH(
		.InstrD(Instr_ID),
		.InstrE(Instr_EX),
		.WB_REGE(GPR_WA),
		.WB_REGM(GPR_WA_DM),
		.REG_WEE(REG_WEE),
		.DM_WED(DM_WriteEnable_D),
		.GPR_WD_MUXE(GPR_WD_MUX_E),
		.GPR_WD_MUXM(GPR_WD_MUX_M),
		.BranchD(BranchD),
		.JRD(JRD),
		.IFID_EN(IFID_EN),
		.IDEX_CLR(IDEX_CLR),
		.PCWriteEnable(PCWriteEnable)
	);
	
	FH FH(
		.REG_WEE(REG_WEE),
		.REG_WEM(REG_WEM),
		.REG_WEW(REG_WEW),
		.DM_WEM(DM_WriteEnable_M),
		.InstrE(Instr_EX),
		.InstrD(Instr_ID),
		.InstrM(Instr_DM),
		.GPR_WD_MUXE(GPR_WD_MUX_E),
		.GPR_WD_MUXW(GPR_WD_MUX_W),
		.WB_REGE(GPR_WA),
		.WB_REGM(GPR_WA_DM),
		.WB_REGW(GPR_WA_WB),
		.MUX_RD1_Comp_Signal(MUX_RD1_Comp_Signal),
		.MUX_RD2_Comp_Signal(MUX_RD2_Comp_Signal),
		.MUX_ALU_A_Signal(MUX_ALU_A_Signal),
		.MUX_ALU_B_Signal(MUX_ALU_B_Signal),
		.MUX_DM_WD_Signal(MUX_DM_WD_Signal)
	);
endmodule
 