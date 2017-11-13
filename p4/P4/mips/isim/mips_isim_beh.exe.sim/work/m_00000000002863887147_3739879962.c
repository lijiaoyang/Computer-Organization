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
static const char *ng0 = "E:/project/P4/mips/datapath/gpr.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {32, 0};
static int ng4[] = {1, 0};



static void Always_34_0(char *t0)
{
    char t6[8];
    char t7[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    int t17;
    char *t18;
    unsigned int t19;
    int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    int t24;
    int t25;
    unsigned int t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;

LAB0:    t1 = (t0 + 2180U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2664);
    *((int *)t2) = 1;
    t3 = (t0 + 2208);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1656);
    t8 = (t0 + 1656);
    t9 = (t8 + 44U);
    t10 = *((char **)t9);
    t11 = (t0 + 1656);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t10, t13, 2, 1, t14, 32, 1);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t7 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (!(t19));
    t21 = (t17 && t20);
    if (t21 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t16 = *((unsigned int *)t2);
    t19 = (~(t16));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t19);
    t26 = (t23 != 0);
    if (t26 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t16 = *((unsigned int *)t2);
    t19 = (~(t16));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t19);
    t26 = (t23 != 0);
    if (t26 > 0)
        goto LAB18;

LAB19:
LAB20:
LAB10:    goto LAB2;

LAB6:    t22 = *((unsigned int *)t6);
    t23 = *((unsigned int *)t7);
    t24 = (t22 - t23);
    t25 = (t24 + 1);
    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t7), t25);
    goto LAB7;

LAB8:    xsi_set_current_line(38, ng0);

LAB11:    xsi_set_current_line(39, ng0);
    xsi_set_current_line(39, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB12:    t2 = (t0 + 1564);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t8 = (t6 + 4);
    t16 = *((unsigned int *)t8);
    t19 = (~(t16));
    t22 = *((unsigned int *)t6);
    t23 = (t22 & t19);
    t26 = (t23 != 0);
    if (t26 > 0)
        goto LAB13;

LAB14:    goto LAB10;

LAB13:    xsi_set_current_line(40, ng0);

LAB15:    xsi_set_current_line(41, ng0);
    t9 = ((char*)((ng1)));
    t10 = (t0 + 1656);
    t11 = (t0 + 1656);
    t12 = (t11 + 44U);
    t13 = *((char **)t12);
    t14 = (t0 + 1656);
    t15 = (t14 + 40U);
    t18 = *((char **)t15);
    t28 = (t0 + 1564);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    xsi_vlog_generic_convert_array_indices(t7, t27, t13, t18, 2, 1, t30, 32, 1);
    t31 = (t7 + 4);
    t32 = *((unsigned int *)t31);
    t17 = (!(t32));
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t33);
    t20 = (!(t34));
    t21 = (t17 && t20);
    if (t21 == 1)
        goto LAB16;

LAB17:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1564);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t8 = (t0 + 1564);
    xsi_vlogvar_assign_value(t8, t6, 0, 0, 32);
    goto LAB12;

LAB16:    t35 = *((unsigned int *)t7);
    t36 = *((unsigned int *)t27);
    t24 = (t35 - t36);
    t25 = (t24 + 1);
    xsi_vlogvar_assign_value(t10, t9, 0, *((unsigned int *)t27), t25);
    goto LAB17;

LAB18:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t8 = (t5 + 4);
    t9 = (t4 + 4);
    t32 = *((unsigned int *)t5);
    t34 = *((unsigned int *)t4);
    t35 = (t32 ^ t34);
    t36 = *((unsigned int *)t8);
    t37 = *((unsigned int *)t9);
    t38 = (t36 ^ t37);
    t39 = (t35 | t38);
    t40 = *((unsigned int *)t8);
    t41 = *((unsigned int *)t9);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB22;

LAB21:    if (t42 != 0)
        goto LAB23;

LAB24:    t11 = (t6 + 4);
    t45 = *((unsigned int *)t11);
    t46 = (~(t45));
    t47 = *((unsigned int *)t6);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB25;

LAB26:
LAB27:    goto LAB20;

LAB22:    *((unsigned int *)t6) = 1;
    goto LAB24;

LAB23:    t10 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(46, ng0);
    t12 = (t0 + 1152U);
    t13 = *((char **)t12);
    t12 = (t0 + 1656);
    t14 = (t0 + 1656);
    t15 = (t14 + 44U);
    t18 = *((char **)t15);
    t28 = (t0 + 1656);
    t29 = (t28 + 40U);
    t30 = *((char **)t29);
    t31 = (t0 + 968U);
    t33 = *((char **)t31);
    xsi_vlog_generic_convert_array_indices(t7, t27, t18, t30, 2, 1, t33, 5, 2);
    t31 = (t7 + 4);
    t50 = *((unsigned int *)t31);
    t17 = (!(t50));
    t51 = (t27 + 4);
    t52 = *((unsigned int *)t51);
    t20 = (!(t52));
    t21 = (t17 && t20);
    if (t21 == 1)
        goto LAB28;

LAB29:    goto LAB27;

LAB28:    t53 = *((unsigned int *)t7);
    t54 = *((unsigned int *)t27);
    t24 = (t53 - t54);
    t25 = (t24 + 1);
    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t27), t25);
    goto LAB29;

}

static void Cont_48_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2324U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1656);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1656);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1656);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 784U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 2724);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 2672);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_49_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2468U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1656);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1656);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1656);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 876U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 2760);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 2680);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000002863887147_3739879962_init()
{
	static char *pe[] = {(void *)Always_34_0,(void *)Cont_48_1,(void *)Cont_49_2};
	xsi_register_didat("work_m_00000000002863887147_3739879962", "isim/mips_isim_beh.exe.sim/work/m_00000000002863887147_3739879962.didat");
	xsi_register_executes(pe);
}
