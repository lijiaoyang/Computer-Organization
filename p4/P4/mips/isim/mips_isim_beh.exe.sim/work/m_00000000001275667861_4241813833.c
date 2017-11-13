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
static const char *ng0 = "E:/project/P4/mips/datapath/ext.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {16, 0};
static int ng4[] = {15, 0};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {4294967295U, 4294967295U};



static void Always_26_0(char *t0)
{
    char t7[8];
    char t11[16];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t15;

LAB0:    t1 = (t0 + 1444U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1640);
    *((int *)t2) = 1;
    t3 = (t0 + 1472);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(29, ng0);
    t8 = (t0 + 600U);
    t9 = *((char **)t8);
    t8 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 32, 32, 2U, t8, 16, t9, 16);
    t10 = (t0 + 920);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 32);
    goto LAB15;

LAB9:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    t8 = (t0 + 600U);
    t9 = *((char **)t8);
    t8 = (t0 + 576U);
    t10 = (t8 + 44U);
    t12 = *((char **)t10);
    t13 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t7, 32, t9, t12, 2, t13, 32, 1);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_multiply(t14, 32, t3, 32, t7, 32);
    xsi_vlogtype_concat(t11, 48, 48, 2U, t14, 32, t4, 16);
    t15 = (t0 + 920);
    xsi_vlogvar_assign_value(t15, t11, 0, 0, 32);
    goto LAB15;

LAB11:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_lshift(t7, 32, t4, 16, t3, 32);
    t8 = (t0 + 920);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 32);
    goto LAB15;

}


extern void work_m_00000000001275667861_4241813833_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000001275667861_4241813833", "isim/mips_isim_beh.exe.sim/work/m_00000000001275667861_4241813833.didat");
	xsi_register_executes(pe);
}
