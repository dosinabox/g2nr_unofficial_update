
instance MENU_OPT_GAMEPAD(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GAMEPAD_BACK";
	items[1] = "MENU_ITEM_GAMEPAD_MOVE_HERO";
	items[2] = "MENU_ITEM_GAMEPAD_MOVE_CAMERA";
	items[3] = "MENU_ITEM_GAMEPAD_ACTION";
	items[4] = "MENU_ITEM_GAMEPAD_CANCEL";
	items[5] = "MENU_ITEM_GAMEPAD_JUMP";
	items[6] = "MENU_ITEM_GAMEPAD_WEAPON_HIDE";
	items[7] = "MENU_ITEM_INP_GAMEPAD_MOVE_HERO";
	items[8] = "MENU_ITEM_INP_GAMEPAD_MOVE_CAMERA";
	items[9] = "MENU_ITEM_INP_GAMEPAD_ACTION";
	items[10] = "MENU_ITEM_INP_GAMEPAD_CANCEL";
	items[11] = "MENU_ITEM_INP_GAMEPAD_JUMP";
	items[12] = "MENU_ITEM_INP_GAMEPAD_WEAPON_HIDE";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GAMEPAD_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = MENU_TEXT_BACK;
	posx = 0;
	posy = MENU_BACK_Y;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_GAMEPAD_MOVE_HERO(C_MENU_ITEM_DEF)
{
	text[0] = "Передвижение";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_GAMEPAD_MOVE_CAMERA(C_MENU_ITEM_DEF)
{
	text[0] = "Камера";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + CTRL_Y_STEP;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_GAMEPAD_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "Действие";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 2);
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_GAMEPAD_CANCEL(C_MENU_ITEM_DEF)
{
	text[0] = "Отмена";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 3);
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_GAMEPAD_JUMP(C_MENU_ITEM_DEF)
{
	text[0] = "Прыжок";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 4);
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_GAMEPAD_WEAPON_HIDE(C_MENU_ITEM_DEF)
{
	text[0] = "Достать оружие";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 5);
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};








instance MENU_ITEM_INP_GAMEPAD_MOVE_HERO(C_MENU_ITEM_DEF)
{
	text[0] = "Левый джойстик";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y;
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_GAMEPAD_MOVE_CAMERA(C_MENU_ITEM_DEF)
{
	text[0] = "Правый джойстик";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + CTRL_Y_STEP;
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_GAMEPAD_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "A";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 2);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_GAMEPAD_CANCEL(C_MENU_ITEM_DEF)
{
	text[0] = "B";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 3);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_GAMEPAD_JUMP(C_MENU_ITEM_DEF)
{
	text[0] = "X";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 4);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_GAMEPAD_WEAPON_HIDE(C_MENU_ITEM_DEF)
{
	text[0] = "Y";
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 5);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

