
instance MENU_OPT_GAMEPAD(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GAMEPAD_ENABLED";
	items[1] = "MENUITEM_GAMEPAD_ENABLED_CHOICE";
	items[2] = "MENUITEM_GAMEPAD_ID";
	items[3] = "MENUITEM_GAMEPAD_ID_CHOICE";
	items[4] = "MENUITEM_GAMEPAD_SENSITIVITY";
	items[5] = "MENUITEM_GAMEPAD_SENSITIVITY_SLIDER";
	items[6] = "MENUITEM_GAMEPAD_HINTS";
	items[7] = "MENUITEM_GAMEPAD_HINTS_CHOICE";
	items[8] = "MENUITEM_GAMEPAD_HINTS_SCHEME";
	items[9] = "MENUITEM_GAMEPAD_HINTS_SCHEME_CHOICE";
	items[10] = "MENUITEM_GAMEPAD_HINTS_SCALE";
	items[11] = "MENUITEM_GAMEPAD_HINTS_SCALE_SLIDER";
	items[12] = "MENUITEM_GAMEPAD_HINTS_TRANSPARENCY";
	items[13] = "MENUITEM_GAMEPAD_HINTS_TRANSPARENCY_SLIDER";
	items[14] = "MENUITEM_GAMEPAD_MOTION_TYPE";
	items[15] = "MENUITEM_GAMEPAD_MOTION_TYPE_CHOICE";
	items[16] = "MENUITEM_GAMEPAD_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GAMEPAD_ENABLED(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Контроллер";
	text[1] = "Управление с помощью контроллера";
	posx = 700;
	posy = MENU_START_Y;
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_ENABLED_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "Enabled";
	onchgsetoptionsection = "ZGAMEPAD";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAMEPAD_ID(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Номер контроллера";
	text[1] = "";
	posx = 700;
	posy = MENU_START_Y + MENU_STEP_Y;
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_ID_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "1|2|3|4";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_STEP_Y + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "ControllerID";
	onchgsetoptionsection = "ZGAMEPAD";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAMEPAD_SENSITIVITY(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Чувствительность";
	text[1] = "Уровень чувствительности джойстиков";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 2);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_SENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 2) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "StickSensitivity";
	onchgsetoptionsection = "ZGAMEPAD";
	userfloat[0] = 25;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_GAMEPAD_HINTS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Подсказки";
	text[1] = "Показывать раскладку управления на экране";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_HINTS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "HintsEnabled";
	onchgsetoptionsection = "ZGAMEPAD";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAMEPAD_HINTS_SCHEME(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Раскладка";
	text[1] = "Тип контроллера";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_HINTS_SCHEME_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "XBOX|PLAYSTATION";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "ControllerScheme";
	onchgsetoptionsection = "ZGAMEPAD";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAMEPAD_HINTS_SCALE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Размер";
	text[1] = "Размер элементов подсказок на экране";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_HINTS_SCALE_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "HintsIconScale";
	onchgsetoptionsection = "ZGAMEPAD";
	userfloat[0] = 25;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_GAMEPAD_HINTS_TRANSPARENCY(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Прозрачность";
	text[1] = "Прозрачность элементов подсказок на экране";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 6);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_HINTS_TRANSPARENCY_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 6) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "HintsTransparency";
	onchgsetoptionsection = "ZGAMEPAD";
	userfloat[0] = 25;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_GAMEPAD_MOTION_TYPE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Тип передвижения";
	text[1] = "";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 7);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAMEPAD_MOTION_TYPE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "стандарт|вектор|альт. вектор";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 7) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "MotionType";
	onchgsetoptionsection = "ZGAMEPAD";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
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

