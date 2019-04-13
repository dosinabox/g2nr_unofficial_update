
instance MENU_STATUS(C_MENU_DEF)
{
	items[0] = "MENU_ITEM_STATUS_HEADING";
	items[1] = "MENU_ITEM_PLAYERGUILD";
	items[2] = "MENU_ITEM_LEVEL_TITLE";
	items[3] = "MENU_ITEM_LEVEL";
	items[4] = "MENU_ITEM_TALENT_7_TITLE";
	items[5] = "MENU_ITEM_TALENT_7_CIRCLE";
	items[6] = "MENU_ITEM_TALENT_7_SKILL";
	items[7] = "MENU_ITEM_EXP_TITLE";
	items[8] = "MENU_ITEM_EXP";
	items[9] = "MENU_ITEM_LEVEL_NEXT_TITLE";
	items[10] = "MENU_ITEM_LEVEL_NEXT";
	items[11] = "MENU_ITEM_LEARN_TITLE";
	items[12] = "MENU_ITEM_LEARN";
	items[13] = "MENU_ITEM_ATTRIBUTE_HEADING";
	items[14] = "MENU_ITEM_ATTRIBUTE_1_TITLE";
	items[15] = "MENU_ITEM_ATTRIBUTE_2_TITLE";
	items[16] = "MENU_ITEM_ATTRIBUTE_3_TITLE";
	items[17] = "MENU_ITEM_ATTRIBUTE_4_TITLE";
	items[18] = "MENU_ITEM_ATTRIBUTE_1";
	items[19] = "MENU_ITEM_ATTRIBUTE_2";
	items[20] = "MENU_ITEM_ATTRIBUTE_3";
	items[21] = "MENU_ITEM_ATTRIBUTE_4";
	items[22] = "MENU_ITEM_ARMOR_HEADING";
	items[23] = "MENU_ITEM_ARMOR_1_TITLE";
	items[24] = "MENU_ITEM_ARMOR_2_TITLE";
	items[25] = "MENU_ITEM_ARMOR_3_TITLE";
	items[26] = "MENU_ITEM_ARMOR_4_TITLE";
	items[27] = "MENU_ITEM_ARMOR_1";
	items[28] = "MENU_ITEM_ARMOR_2";
	items[29] = "MENU_ITEM_ARMOR_3";
	items[30] = "MENU_ITEM_ARMOR_4";
	items[31] = "MENU_ITEM_TALENTS_HEADING";
	items[32] = "MENU_ITEM_TALENT_1_TITLE";
	items[33] = "MENU_ITEM_TALENT_1_SKILL";
	items[34] = "MENU_ITEM_TALENT_1";
	items[35] = "MENU_ITEM_TALENT_2_TITLE";
	items[36] = "MENU_ITEM_TALENT_2_SKILL";
	items[37] = "MENU_ITEM_TALENT_2";
	items[38] = "MENU_ITEM_TALENT_3_TITLE";
	items[39] = "MENU_ITEM_TALENT_3_SKILL";
	items[40] = "MENU_ITEM_TALENT_3";
	items[41] = "MENU_ITEM_TALENT_4_TITLE";
	items[42] = "MENU_ITEM_TALENT_4_SKILL";
	items[43] = "MENU_ITEM_TALENT_4";
	items[44] = "MENU_ITEM_TALENT_8_TITLE";
	items[45] = "MENU_ITEM_TALENT_8_SKILL";
	items[46] = "MENU_ITEM_TALENT_5_TITLE";
	items[47] = "MENU_ITEM_TALENT_5_SKILL";
	items[48] = "MENU_ITEM_TALENT_12_TITLE";
	items[49] = "MENU_ITEM_TALENT_12_SKILL";
	items[50] = "MENU_ITEM_TALENT_14_TITLE";
	items[51] = "MENU_ITEM_TALENT_14_SKILL";
	items[52] = "MENU_ITEM_TALENT_15_TITLE";
	items[53] = "MENU_ITEM_TALENT_15_SKILL";
	items[54] = "MENU_ITEM_TALENT_13_TITLE";
	items[55] = "MENU_ITEM_TALENT_13_SKILL";
	items[56] = "MENU_ITEM_TALENT_16_TITLE";
	items[57] = "MENU_ITEM_TALENT_16_SKILL";
	items[58] = "MENU_ITEM_TALENT_11_TITLE";
	items[59] = "MENU_ITEM_TALENT_11_SKILL";
	items[60] = "MENU_ITEM_TALENT_17_TITLE";
	items[61] = "MENU_ITEM_TALENT_17_SKILL";
	dimx = 8192;
	dimy = 8192;
	flags = flags | MENU_OVERTOP | MENU_NOANI;
	backpic = STAT_BACK_PIC;
};


const int STAT_A_X1 = 500;
const int STAT_A_X2 = 2575;
const int STAT_A_X3 = 3000;
const int STAT_A_X4 = 3400;
const int STAT_B_X1 = 3900;
const int STAT_B_X2 = 6000;
const int STAT_B_X3 = 7300;
const int STAT_B_X4 = 7700;
const int STAT_PLYHEAD_Y = 1000;
const int STAT_PLY_Y = 1450;
const int STAT_ATRHEAD_Y = 3250;
const int STAT_ATR_Y = 3700;
const int STAT_ARMHEAD_Y = 5200;
const int STAT_ARM_Y = 5650;
const int STAT_TALHEAD_Y = 1000;
const int STAT_TAL_Y = 1450;
const int STAT_DY = 300;

instance MENU_ITEM_STATUS_HEADING(C_MENU_ITEM_DEF)
{
	text[0] = "œ≈–—ŒÕ¿∆";
	posx = STAT_A_X1;
	posy = STAT_PLYHEAD_Y;
	dimx = STAT_A_X4 - STAT_A_X1;
	dimy = STAT_DY;
	fontname = STAT_FONT_DEFAULT;
	flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;
};

instance MENU_ITEM_PLAYERGUILD(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_PLY_Y + (STAT_DY * 0);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEVEL_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_PLY_Y + (STAT_DY * 1);
	text[0] = "”Ó‚ÂÌ¸";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEVEL(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_PLY_Y + (STAT_DY * 1);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_7_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (5 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_7_CIRCLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (5 * STAT_DY);
	text[0] = "";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_7_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (5 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_EXP_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_PLY_Y + (STAT_DY * 2);
	text[0] = "ŒÔ˚Ú";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_EXP(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_PLY_Y + (STAT_DY * 2);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEVEL_NEXT_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_PLY_Y + (STAT_DY * 3);
	text[0] = "—ÎÂ‰. ÛÓ‚ÂÌ¸";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEVEL_NEXT(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_PLY_Y + (STAT_DY * 3);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEARN_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_PLY_Y + (STAT_DY * 4);
	text[0] = "Œ˜ÍË Ó·Û˜ÂÌËˇ";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEARN(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_PLY_Y + (STAT_DY * 4);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_HEADING(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ATRHEAD_Y;
	dimx = STAT_A_X4 - STAT_A_X1;
	dimy = STAT_DY;
	text[0] = "’¿–¿ “≈–»—“» »";
	fontname = STAT_FONT_DEFAULT;
	flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;
};

instance MENU_ITEM_ATTRIBUTE_1_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ATR_Y + (STAT_DY * 0);
	text[0] = "—ËÎ‡";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_1(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ATR_Y + (STAT_DY * 0);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_2_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ATR_Y + (STAT_DY * 1);
	text[0] = "ÀÓ‚ÍÓÒÚ¸";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_2(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ATR_Y + (STAT_DY * 1);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_3_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ATR_Y + (STAT_DY * 2);
	text[0] = "Ã‡Ì‡";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_3(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ATR_Y + (STAT_DY * 2);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_4_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ATR_Y + (STAT_DY * 3);
	text[0] = "∆ËÁÌ¸";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ATTRIBUTE_4(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ATR_Y + (STAT_DY * 3);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_HEADING(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ARMHEAD_Y;
	dimx = STAT_A_X4 - STAT_A_X1;
	dimy = STAT_DY;
	text[0] = "«¿Ÿ»“¿";
	fontname = STAT_FONT_DEFAULT;
	flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;
};

instance MENU_ITEM_ARMOR_1_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ARM_Y + (STAT_DY * 0);
	text[0] = "ŒÛÊËÂ";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_1(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ARM_Y + (STAT_DY * 0);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_2_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ARM_Y + (STAT_DY * 1);
	text[0] = "—ÚÂÎ˚";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_2(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ARM_Y + (STAT_DY * 1);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_3_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ARM_Y + (STAT_DY * 2);
	text[0] = "Œ„ÓÌ¸";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_3(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ARM_Y + (STAT_DY * 2);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_4_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;
	posy = STAT_ARM_Y + (STAT_DY * 3);
	text[0] = "Ã‡„Ëˇ";
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_ARMOR_4(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X2;
	posy = STAT_ARM_Y + (STAT_DY * 3);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENTS_HEADING(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TALHEAD_Y;
	dimx = STAT_B_X4 - STAT_B_X1;
	dimy = STAT_DY;
	text[0] = "Õ¿¬€ »";
	fontname = STAT_FONT_DEFAULT;
	flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;
};

instance MENU_ITEM_TALENT_1_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (0 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_1_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (0 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_1(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X3;
	posy = STAT_TAL_Y + (0 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_2_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (1 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_2_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (1 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_2(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X3;
	posy = STAT_TAL_Y + (1 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_3_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (2 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_3_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (2 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_3(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X3;
	posy = STAT_TAL_Y + (2 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_4_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (3 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_4_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (3 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_4(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X3;
	posy = STAT_TAL_Y + (3 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_8_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (13 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_8_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (13 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_5_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (14 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_5_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (14 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_12_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (15 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_12_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (15 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_14_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (6 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_14_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (6 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_15_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (7 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_15_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (7 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_13_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (10 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_13_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (10 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_16_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (11 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_16_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (11 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_11_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (16 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_11_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (16 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_17_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X1;
	posy = STAT_TAL_Y + (8 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_TALENT_17_SKILL(C_MENU_ITEM_DEF)
{
	posx = STAT_B_X2;
	posy = STAT_TAL_Y + (8 * STAT_DY);
	fontname = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

