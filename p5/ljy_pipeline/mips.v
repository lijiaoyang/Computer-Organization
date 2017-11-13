`timescale 1ns / 1ps
module mips(
	input clk,
	input reset
    );
//IF
	wire [31:0]Instr_IF;
	wire [31:0]MUX_PC_OUT;//PCENǰ��PC
	wire [31:0]PCOut;//PCEN���PC
	wire [31:0]PCPlus4Out;//PCOut+4
	wire [1:0]PC_MUX_Signal;//����PC,01->(J_Type||B_Type),00->����
	
//ID
	wire [31:0] Instr_ID;
	wire [31:0] PCPlus4_ID;
	wire [31:0] PCPlus8_ID;//PCPlus4_ID + 4
	wire [1:0] EXTOP;
	wire [31:0] RD1;
	wire [31:0] RD2;
	wire [31:0] EXTOut;
	wire [31:0] NextPCCalcOut;//�����Ǽ򵥵�PC+4ʱ��pc����һ��ָ���λ��
	wire [31:0] RD1_MUX_OUT;  //GPR[rs]
	wire [31:0] RD2_MUX_OUT;  //GPR[rt]
	wire DM_WriteEnable_D;   //����DM�Ƿ�д�룬��ID�׶ξͿ����ж���
	wire BranchD,JRD;	
	
//CMP
	wire BIG_ZERO;
	wire EQUAL_ZERO;
	wire LESS_ZERO;
	wire EQUAL;

//EX
	 assign IDEX_EN = 1'b1;   //ID-EXǽʼ�տ���ͨ��
	 wire [31:0] Instr_EX;
	 wire [31:0] PCPlus4_EX;
	 wire [31:0] RD1_EX;
	 wire [31:0] RD2_EX;
	 wire [31:0] EXTOUT_EX;
	 wire REG_WEE;//GPR_WriteEnable_E
	 wire [1:0] GPR_WD_MUX_E; //��EX�׶��ж�д�ص��������ĸ�
	 
	 wire	[3:0]ALUOP;
	 wire [31:0]ALU_OUTPUT;
	 wire [1:0] GPR_WA_MUX_Signal;//�ж�д��rt����rd����$31
	 wire [4:0] GPR_WA;           //д�صĵ�ַ
	 
	 wire [31:0] ALU_A_OUT;//ALU_A�˿ڵ������ĸ�
	 wire [31:0] ALU_BH_OUT;//ALU_B��00�˿�
	 wire [31:0] ALU_B_OUT;//ALU_B�˿ڵ������ĸ�
	 wire [1:0] ALU_B_MUX_Signal;//ѡ��ALU_B�������ĸ�
	 
//DM
	 wire [31:0] Instr_DM;
	 wire [31:0] WriteBackM_DM;//������ALUOUT_DM,Ҳ������PCPlus4_DM
	 wire [31:0] PCPlus4_DM;
	 wire [31:0] ALUOUT_DM;
	 wire [4:0] GPR_WA_DM;
	 wire [31:0] RD2_DM;
	 wire REG_WEM;//GPR_WriteEnable_M
	 wire DM_WriteEnable_M;
	 
	 wire [31:0]DM_ReadDataOut;  // ��DM����������
	 wire [1:0]GPR_WD_MUX_M;     // ��MEM�׶��ж�д���ĸ�����
	 
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
		.B(NextPCCalcOut),//01->(J_Type||B_Type)����Ҫ��pc����
		.MUXOP(PC_MUX_Signal),//2λ
		.OUT(MUX_PC_OUT)
	);
	
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCEnable(PCWriteEnable),//PCʹ�ܶ�
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
		.IFID_CLR(1'b0),//IFIDǽ ����˳�ʼ��Ϊ0
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
		.BranchD(BranchD),//B��ָ��
		.JRD(JRD)//J��ָ��
	);
	
	GRF GRF(
		.clk(clk),
		.reset(reset),
		.RS(Instr_ID[25:21]),
		.RT(Instr_ID[20:16]),
		.WriteAdd(GPR_WA_WB),/////////WB_REGW////д�صļĴ���
		.WriteData(GPR_WD_MUX_OUT),//д�ص�����
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
		.JR_READ(RD1_MUX_OUT),//JR��ʵ����RD1����mux�Ľ��
		.BIG_ZERO(BIG_ZERO),
		.EQUAL_ZERO(EQUAL_ZERO),
		.LESS_ZERO(LESS_ZERO),
		.EQUAL(EQUAL),
		.NPC(NextPCCalcOut)	//����ó����¸���PC��ֵ
	);
	
	PCPlus4 PCPlus4_D(//jal
		.PC(PCPlus4_ID),
		.PCPlus4(PCPlus8_ID)
	);
	
	MUX32 RD1_HAZZARD(
		.A(RD1),
		.B(WriteBackM_DM),//ת��
		.C(PCPlus8_ID),//ǰ��ָ����jal
		.MUXOP(MUX_RD1_Comp_Signal),
		.OUT(RD1_MUX_OUT)
	);
	
	MUX32 RD2_HAZZARD(
		.A(RD2),
		.B(WriteBackM_DM),//ת��
		.C(PCPlus8_ID),//ǰ��ָ����jal
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
		.IDEX_CLR(IDEX_CLR),   //����
		.IDEX_EN(IDEX_EN),	  //ʹ�ܶ�
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
		.ALU_B_MUX(ALU_B_MUX_Signal),  //***��չ***����ALU_B�˵�����ɶ,(ORI || LW || SW || LUI || ADDI || ADDIU)->01
		.GPR_WA_MUX(GPR_WA_MUX_Signal),//�ж�д��rt����rd
		.REG_WEE(REG_WEE),             //RegWrite_Enable_EX,����ָ���Ƿ�д��Ĵ���
		.GPR_WD_MUXE(GPR_WD_MUX_E)     //ѡ��д�ص�����
	);
	
	MUX32 ALU_A_Hazzard(
		.A(RD1_EX),//RD1
		.B(GPR_WD_MUX_OUT),//from WB
		.C(WriteBackM_DM),//from MEM
		.MUXOP(MUX_ALU_A_Signal),//ѡ��ALU_A�������ĸ� ----- jrҲ�ǽӵ�����˿ڣ���Ϊjr��rs���Ա��ʸ�RD1һ����
		.OUT(ALU_A_OUT)
	);
	
	MUX32 ALU_B_Hazzard(
		.A(RD2_EX),//RD2
		.B(GPR_WD_MUX_OUT),
		.C(WriteBackM_DM),
		.MUXOP(MUX_ALU_B_Signal),//ѡ��ALU_BH�������ĸ�
		.OUT(ALU_BH_OUT)
	);
	
	MUX32 ALU_B(
		.A(ALU_BH_OUT),
		.B(EXTOUT_EX),
		.MUXOP(ALU_B_MUX_Signal),//��Ҫ��չ->01
		.OUT(ALU_B_OUT)
	);
	
	ALU ALU(
		.ALUOP(ALUOP),
		.Instr(Instr_EX),
		.A(ALU_A_OUT),       //�޷���
		.A_Signed(ALU_A_OUT),//�з���
		.B(ALU_B_OUT),
		.B_Signed(ALU_B_OUT),
		.C(ALU_OUTPUT)	
	);
	
	MUX5 GRF_WA_MUX(
		.A(Instr_EX[20:16]),//rt
		.B(Instr_EX[15:11]),//rd
		.MUXOP(GPR_WA_MUX_Signal),//�ж�д��rt����rd,����$31
		.OUT(GPR_WA)//-------------GPR_WA��EX�׶ε�
	);
	
//-----------------EX-MEM--------------------------------//

	EX_MEM EX_MEM(
		.clk(clk),
		.reset(reset),
		.EXMEM_CLR(reset),
		.Instr_IN(Instr_EX),    //-------------Instr_EX   -> Instr_DM
		.PCPlus4_IN(PCPlus4_EX),//------PCPlus4_EX  ->  PCPlus4_DM
		.ALUResult_IN(ALU_OUTPUT),//------ALU_OUTPUT -> ALUOUT_DM
		.RD2_IN(ALU_BH_OUT),    //--ALU_BH_OUT -> RD2_DM  (WriteDataд��洢��������)
		.GPR_WA_IN(GPR_WA),     //------GPR_WA -> GPR_WA_DM ��д�ؼĴ����ĵ�ַ��
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
		.REG_WEM(REG_WEM),          //RegWrite_MEM,д��Ĵ�����ָ��
		.GPR_WD_MUXM(GPR_WD_MUX_M) //MemtoReg_MEM	lw->01 jal->10	
	);
	
	MUX32 DM_WD(
    .A(RD2_DM),
    .B(GPR_WD_MUX_OUT),  
    .MUXOP(MUX_DM_WD_Signal), 
    .OUT(DM_WD_FanPaoQuan_OUT)///////////����Ȧ��ǰsw��lw��,��������д��DM������
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
		.C(PCPlus4_DM),//10->jal -----����ʱlw��û������ȡ��������lw���01�˿ڣ�
		.MUXOP(GPR_WD_MUX_M),
		.OUT(WriteBackM_DM)//д�ص�����
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
		.B(MEMOUT_WB),//01->LW����ʱlw��������
		.C(PCPlus4_WB),//10->JAL
		.MUXOP(GPR_WD_MUX_W),
		.OUT(GPR_WD_MUX_OUT)//д�ؼĴ���������
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
 