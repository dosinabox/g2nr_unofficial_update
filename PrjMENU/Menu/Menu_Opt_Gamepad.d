
instance MENU_OPT_GAMEPAD(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GAMEPAD_BACK";
	items[1] = "MENU_ITEM_GAMEPAD_MOVE_HERO";
	items[2] = "MENU_ITEM_GAMEPAD_MOVE_CAMERA";
	items[3] = "MENU_ITEM_INP_GAMEPAD_MOVE_HERO";
	items[4] = "MENU_ITEM_INP_GAMEPAD_MOVE_CAMERA";
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
	text[0] = "Перемещение";
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

