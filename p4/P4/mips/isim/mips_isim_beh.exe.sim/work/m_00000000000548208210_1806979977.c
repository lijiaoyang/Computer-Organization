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
static const char *ng0 = "E:/project/P4/mips/datapath/dm.v";



static void Always_29_0(char *t0)
{
    char t13[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;

LAB0:    t1 = (t0 + 1720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 2060);
    *((int *)t2) = 1;
    t3 = (t0 + 1748);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(32, ng0);
    t11 = (t0 + 692U);
    t12 = *((char **)t11);
    t11 = (t0 + 1196);
    t15 = (t0 + 1196);
    t16 = (t15 + 44U);
    t17 = *((char **)t16);
    t18 = (t0 + 1196);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    t21 = (t0 + 600U);
    t22 = *((char **)t21);
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t22, 10, 2);
    t21 = (t13 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (!(t23));
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB9;

LAB10:    goto LAB8;

LAB9:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t14);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_assign_value(t11, t12, 0, *((unsigned int *)t14), t32);
    goto LAB10;

}

static void Cont_34_1(char *t0)
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

LAB0:    t1 = (t0 + 1864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1196);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 600U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 10, 2);
    t12 = (t0 + 2112);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 2068);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000000548208210_1806979977_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Cont_34_1};
	xsi_register_didat("work_m_00000000000548208210_1806979977", "isim/mips_isim_beh.exe.sim/work/m_00000000000548208210_1806979977.didat");
	xsi_register_executes(pe);
}