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
static const char *ng0 = "C:/Users/asus5/Desktop/P4/mips/control/ctrl.v";
static unsigned int ng1[] = {33U, 0U};
static unsigned int ng2[] = {456U, 192U};
static unsigned int ng3[] = {35U, 0U};
static unsigned int ng4[] = {968U, 192U};
static unsigned int ng5[] = {832U, 63U};
static unsigned int ng6[] = {1796U, 0U};
static unsigned int ng7[] = {2240U, 63U};
static unsigned int ng8[] = {325U, 0U};
static unsigned int ng9[] = {2752U, 63U};
static unsigned int ng10[] = {127U, 27U};
static unsigned int ng11[] = {256U, 63U};
static unsigned int ng12[] = {2779U, 219U};
static unsigned int ng13[] = {960U, 63U};
static unsigned int ng14[] = {388U, 0U};
static unsigned int ng15[] = {192U, 63U};
static unsigned int ng16[] = {6102U, 1732U};
static unsigned int ng17[] = {8U, 0U};
static unsigned int ng18[] = {7903U, 1759U};



static void Always_33_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2284);
    *((int *)t2) = 1;
    t3 = (t0 + 2116);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(34, ng0);

LAB5:    xsi_set_current_line(35, ng0);
    t5 = (t0 + 692U);
    t6 = *((char **)t5);
    t5 = (t0 + 600U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 12, 12, 2U, t7, 6, t6, 6);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t5, 12);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_xcompare(t4, 12, t2, 12);
    if (t8 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(36, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 1564);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 2);
    t11 = (t0 + 1472);
    xsi_vlogvar_assign_value(t11, t9, 2, 0, 1);
    t12 = (t0 + 1380);
    xsi_vlogvar_assign_value(t12, t9, 3, 0, 2);
    t13 = (t0 + 1288);
    xsi_vlogvar_assign_value(t13, t9, 5, 0, 1);
    t14 = (t0 + 1196);
    xsi_vlogvar_assign_value(t14, t9, 6, 0, 2);
    t15 = (t0 + 1104);
    xsi_vlogvar_assign_value(t15, t9, 8, 0, 1);
    t16 = (t0 + 1012);
    xsi_vlogvar_assign_value(t16, t9, 9, 0, 2);
    t17 = (t0 + 920);
    xsi_vlogvar_assign_value(t17, t9, 11, 0, 2);
    goto LAB25;

LAB9:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB11:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB13:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng8)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB15:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB17:    xsi_set_current_line(41, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB19:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng14)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB21:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng16)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

LAB23:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng18)));
    t5 = (t0 + 1564);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    t6 = (t0 + 1472);
    xsi_vlogvar_assign_value(t6, t3, 2, 0, 1);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t3, 3, 0, 2);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t3, 5, 0, 1);
    t10 = (t0 + 1196);
    xsi_vlogvar_assign_value(t10, t3, 6, 0, 2);
    t11 = (t0 + 1104);
    xsi_vlogvar_assign_value(t11, t3, 8, 0, 1);
    t12 = (t0 + 1012);
    xsi_vlogvar_assign_value(t12, t3, 9, 0, 2);
    t13 = (t0 + 920);
    xsi_vlogvar_assign_value(t13, t3, 11, 0, 2);
    goto LAB25;

}


extern void work_m_00000000003854778364_2885957937_init()
{
	static char *pe[] = {(void *)Always_33_0};
	xsi_register_didat("work_m_00000000003854778364_2885957937", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000003854778364_2885957937.didat");
	xsi_register_executes(pe);
}
