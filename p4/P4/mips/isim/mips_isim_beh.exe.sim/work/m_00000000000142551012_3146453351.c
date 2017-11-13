/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/project/P4/mips/datapath/npc.v";
static int ng1[] = {2, 0};
static int ng2[] = {3, 0};
static int ng3[] = {1, 0};



static void Cont_38_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t33[8];
    char t34[8];
    char t44[8];
    char t58[8];
    char t59[8];
    char t62[8];
    char t89[8];
    char t103[8];
    char t104[8];
    char t107[8];
    char t134[8];
    char t135[8];
    char t138[8];
    char t167[8];
    char t176[8];
    char t178[8];
    char t185[8];
    char t192[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t60;
    char *t61;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t136;
    char *t137;
    char *t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    char *t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    char *t165;
    char *t166;
    char *t168;
    char *t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    char *t177;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    char *t190;
    char *t191;
    char *t193;
    char *t194;
    char *t195;
    char *t196;
    char *t197;
    unsigned int t198;
    unsigned int t199;
    char *t200;
    unsigned int t201;
    unsigned int t202;
    char *t203;
    unsigned int t204;
    unsigned int t205;
    char *t206;

LAB0:    t1 = (t0 + 1812U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 784U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t54 = *((unsigned int *)t4);
    t55 = (~(t54));
    t56 = *((unsigned int *)t29);
    t57 = (t55 || t56);
    if (t57 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t58, 8);

LAB20:    t193 = (t0 + 2204);
    t194 = (t193 + 32U);
    t195 = *((char **)t194);
    t196 = (t195 + 40U);
    t197 = *((char **)t196);
    memset(t197, 0, 8);
    t198 = 1073741823U;
    t199 = t198;
    t200 = (t3 + 4);
    t201 = *((unsigned int *)t3);
    t198 = (t198 & t201);
    t202 = *((unsigned int *)t200);
    t199 = (t199 & t202);
    t203 = (t197 + 4);
    t204 = *((unsigned int *)t197);
    *((unsigned int *)t197) = (t204 | t198);
    t205 = *((unsigned int *)t203);
    *((unsigned int *)t203) = (t205 | t199);
    xsi_driver_vfirst_trans(t193, 0, 29);
    t206 = (t0 + 2152);
    *((int *)t206) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t35 = (t0 + 692U);
    t36 = *((char **)t35);
    memset(t34, 0, 8);
    t35 = (t34 + 4);
    t37 = (t36 + 4);
    t38 = *((unsigned int *)t36);
    t39 = (t38 >> 0);
    *((unsigned int *)t34) = t39;
    t40 = *((unsigned int *)t37);
    t41 = (t40 >> 0);
    *((unsigned int *)t35) = t41;
    t42 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t42 & 67108863U);
    t43 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t43 & 67108863U);
    t45 = (t0 + 600U);
    t46 = *((char **)t45);
    memset(t44, 0, 8);
    t45 = (t44 + 4);
    t47 = (t46 + 4);
    t48 = *((unsigned int *)t46);
    t49 = (t48 >> 26);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t47);
    t51 = (t50 >> 26);
    *((unsigned int *)t45) = t51;
    t52 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t52 & 15U);
    t53 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t53 & 15U);
    xsi_vlogtype_concat(t33, 32, 30, 2U, t44, 4, t34, 26);
    goto LAB13;

LAB14:    t60 = (t0 + 784U);
    t61 = *((char **)t60);
    t60 = ((char*)((ng2)));
    memset(t62, 0, 8);
    t63 = (t61 + 4);
    t64 = (t60 + 4);
    t65 = *((unsigned int *)t61);
    t66 = *((unsigned int *)t60);
    t67 = (t65 ^ t66);
    t68 = *((unsigned int *)t63);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = (t67 | t70);
    t72 = *((unsigned int *)t63);
    t73 = *((unsigned int *)t64);
    t74 = (t72 | t73);
    t75 = (~(t74));
    t76 = (t71 & t75);
    if (t76 != 0)
        goto LAB24;

LAB21:    if (t74 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t62) = 1;

LAB24:    memset(t59, 0, 8);
    t78 = (t62 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t62);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t78) != 0)
        goto LAB27;

LAB28:    t85 = (t59 + 4);
    t86 = *((unsigned int *)t59);
    t87 = *((unsigned int *)t85);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB29;

LAB30:    t99 = *((unsigned int *)t59);
    t100 = (~(t99));
    t101 = *((unsigned int *)t85);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t85) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t59) > 0)
        goto LAB35;

LAB36:    memcpy(t58, t103, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t58, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t77 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t77) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t59) = 1;
    goto LAB28;

LAB27:    t84 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB28;

LAB29:    t90 = (t0 + 968U);
    t91 = *((char **)t90);
    memset(t89, 0, 8);
    t90 = (t89 + 4);
    t92 = (t91 + 4);
    t93 = *((unsigned int *)t91);
    t94 = (t93 >> 2);
    *((unsigned int *)t89) = t94;
    t95 = *((unsigned int *)t92);
    t96 = (t95 >> 2);
    *((unsigned int *)t90) = t96;
    t97 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t97 & 1073741823U);
    t98 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t98 & 1073741823U);
    goto LAB30;

LAB31:    t105 = (t0 + 784U);
    t106 = *((char **)t105);
    t105 = ((char*)((ng3)));
    memset(t107, 0, 8);
    t108 = (t106 + 4);
    t109 = (t105 + 4);
    t110 = *((unsigned int *)t106);
    t111 = *((unsigned int *)t105);
    t112 = (t110 ^ t111);
    t113 = *((unsigned int *)t108);
    t114 = *((unsigned int *)t109);
    t115 = (t113 ^ t114);
    t116 = (t112 | t115);
    t117 = *((unsigned int *)t108);
    t118 = *((unsigned int *)t109);
    t119 = (t117 | t118);
    t120 = (~(t119));
    t121 = (t116 & t120);
    if (t121 != 0)
        goto LAB41;

LAB38:    if (t119 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t107) = 1;

LAB41:    memset(t104, 0, 8);
    t123 = (t107 + 4);
    t124 = *((unsigned int *)t123);
    t125 = (~(t124));
    t126 = *((unsigned int *)t107);
    t127 = (t126 & t125);
    t128 = (t127 & 1U);
    if (t128 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t123) != 0)
        goto LAB44;

LAB45:    t130 = (t104 + 4);
    t131 = *((unsigned int *)t104);
    t132 = *((unsigned int *)t130);
    t133 = (t131 || t132);
    if (t133 > 0)
        goto LAB46;

LAB47:    t186 = *((unsigned int *)t104);
    t187 = (~(t186));
    t188 = *((unsigned int *)t130);
    t189 = (t187 || t188);
    if (t189 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t130) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t104) > 0)
        goto LAB52;

LAB53:    memcpy(t103, t192, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t58, 32, t89, 32, t103, 32);
    goto LAB37;

LAB35:    memcpy(t58, t89, 8);
    goto LAB37;

LAB40:    t122 = (t107 + 4);
    *((unsigned int *)t107) = 1;
    *((unsigned int *)t122) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t104) = 1;
    goto LAB45;

LAB44:    t129 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t129) = 1;
    goto LAB45;

LAB46:    t136 = (t0 + 876U);
    t137 = *((char **)t136);
    t136 = ((char*)((ng3)));
    memset(t138, 0, 8);
    t139 = (t137 + 4);
    t140 = (t136 + 4);
    t141 = *((unsigned int *)t137);
    t142 = *((unsigned int *)t136);
    t143 = (t141 ^ t142);
    t144 = *((unsigned int *)t139);
    t145 = *((unsigned int *)t140);
    t146 = (t144 ^ t145);
    t147 = (t143 | t146);
    t148 = *((unsigned int *)t139);
    t149 = *((unsigned int *)t140);
    t150 = (t148 | t149);
    t151 = (~(t150));
    t152 = (t147 & t151);
    if (t152 != 0)
        goto LAB58;

LAB55:    if (t150 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t138) = 1;

LAB58:    memset(t135, 0, 8);
    t154 = (t138 + 4);
    t155 = *((unsigned int *)t154);
    t156 = (~(t155));
    t157 = *((unsigned int *)t138);
    t158 = (t157 & t156);
    t159 = (t158 & 1U);
    if (t159 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t154) != 0)
        goto LAB61;

LAB62:    t161 = (t135 + 4);
    t162 = *((unsigned int *)t135);
    t163 = *((unsigned int *)t161);
    t164 = (t162 || t163);
    if (t164 > 0)
        goto LAB63;

LAB64:    t179 = *((unsigned int *)t135);
    t180 = (~(t179));
    t181 = *((unsigned int *)t161);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t161) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t135) > 0)
        goto LAB69;

LAB70:    memcpy(t134, t185, 8);

LAB71:    goto LAB47;

LAB48:    t190 = (t0 + 600U);
    t191 = *((char **)t190);
    t190 = ((char*)((ng3)));
    memset(t192, 0, 8);
    xsi_vlog_unsigned_add(t192, 32, t191, 30, t190, 32);
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t103, 32, t134, 32, t192, 32);
    goto LAB54;

LAB52:    memcpy(t103, t134, 8);
    goto LAB54;

LAB57:    t153 = (t138 + 4);
    *((unsigned int *)t138) = 1;
    *((unsigned int *)t153) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t135) = 1;
    goto LAB62;

LAB61:    t160 = (t135 + 4);
    *((unsigned int *)t135) = 1;
    *((unsigned int *)t160) = 1;
    goto LAB62;

LAB63:    t165 = (t0 + 600U);
    t166 = *((char **)t165);
    t165 = (t0 + 692U);
    t168 = *((char **)t165);
    memset(t167, 0, 8);
    t165 = (t167 + 4);
    t169 = (t168 + 4);
    t170 = *((unsigned int *)t168);
    t171 = (t170 >> 0);
    *((unsigned int *)t167) = t171;
    t172 = *((unsigned int *)t169);
    t173 = (t172 >> 0);
    *((unsigned int *)t165) = t173;
    t174 = *((unsigned int *)t167);
    *((unsigned int *)t167) = (t174 & 65535U);
    t175 = *((unsigned int *)t165);
    *((unsigned int *)t165) = (t175 & 65535U);
    memset(t176, 0, 8);
    xsi_vlog_unsigned_add(t176, 32, t166, 30, t167, 32);
    t177 = ((char*)((ng3)));
    memset(t178, 0, 8);
    xsi_vlog_unsigned_add(t178, 32, t176, 32, t177, 32);
    goto LAB64;

LAB65:    t183 = (t0 + 600U);
    t184 = *((char **)t183);
    t183 = ((char*)((ng3)));
    memset(t185, 0, 8);
    xsi_vlog_unsigned_add(t185, 32, t184, 30, t183, 32);
    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t134, 32, t178, 32, t185, 32);
    goto LAB71;

LAB69:    memcpy(t134, t178, 8);
    goto LAB71;

}

static void Cont_42_1(char *t0)
{
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t3, 30, t2, 32);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_lshift(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 2240);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 8);
    xsi_driver_vfirst_trans(t7, 0, 31);
    t12 = (t0 + 2160);
    *((int *)t12) = 1;

LAB1:    return;
}


extern void work_m_00000000000142551012_3146453351_init()
{
	static char *pe[] = {(void *)Cont_38_0,(void *)Cont_42_1};
	xsi_register_didat("work_m_00000000000142551012_3146453351", "isim/mips_isim_beh.exe.sim/work/m_00000000000142551012_3146453351.didat");
	xsi_register_executes(pe);
}
