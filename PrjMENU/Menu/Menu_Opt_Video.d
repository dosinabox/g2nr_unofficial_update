
instance MENU_OPT_VIDEO(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_VID_DEVICE";
	items[1] = "MENUITEM_VID_DEVICE_CHOICE";
	items[2] = "MENUITEM_VID_RESOLUTION";
	items[3] = "MENUITEM_VID_RESOLUTION_CHOICE";
	items[4] = "MENUITEM_GRA_TEXQUAL";
	items[5] = "MENUITEM_GRA_TEXQUAL_SLIDER";
	items[6] = "MENUITEM_GRA_MODEL_DETAIL";
	items[7] = "MENUITEM_GRA_MODEL_DETAIL_SLIDER";
	items[8] = "MENUITEM_GRA_SIGHT";
	items[9] = "MENUITEM_GRA_SIGHT_CHOICE";
	items[10] = "MENUITEM_VOB_SIGHT";
	items[11] = "MENUITEM_VOB_SIGHT_CHOICE";
	items[12] = "MENUITEM_VID_BRIGHTNESS";
	items[13] = "MENUITEM_VID_BRIGHTNESS_SLIDER";
	items[14] = "MENUITEM_VID_CONTRAST";
	items[15] = "MENUITEM_VID_CONTRAST_SLIDER";
	items[16] = "MENUITEM_VID_GAMMA";
	items[17] = "MENUITEM_VID_GAMMA_SLIDER";
	items[18] = "MENUITEM_VID_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_VID_DEVICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Видеокарта";
	text[1] = "Не поддерживаются видеокарты некоторых ноутбуков!";
	posx = 1000;
	posy = MENU_START_Y;
	dimx = 3000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_DEVICE_CHOICE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 3700;
	posy = MENU_START_Y + MENU_CHOICE_YPLUS;
	dimx = 3700;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zVidDevice";
	onchgsetoptionsection = "VIDEO";
	oneventaction[6] = update_videooptions;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_VID_RESOLUTION(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Разрешение";
	text[1] = "Выберите разрешение и нажмите Enter";
	posx = 1000;
	posy = MENU_START_Y + MENU_STEP_Y ;
	dimx = 2700;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = apply_videoresolution;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_RESOLUTION_CHOICE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 3700;
	posy = MENU_START_Y + MENU_STEP_Y + MENU_CHOICE_YPLUS;
	dimx = 3700;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "vidResIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_APPLY;
};

instance MENUITEM_GRA_TEXQUAL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Качество текстур";
	text[1] = "Уровень детализации текстур";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 2);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_TEXQUAL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 2) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "texDetailIndex";
	onchgsetoptionsection = "INTERNAL";
	userfloat[0] = 5;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_GRA_MODEL_DETAIL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Качество моделей";
	text[1] = "Уровень детализации моделей";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_MODEL_DETAIL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "modelDetail";
	onchgsetoptionsection = "PERFORMANCE";
	userfloat[0] = 10;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION;
};

instance MENUITEM_GRA_SIGHT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Дистанция обзора";
	text[1] = "Дистанция общей прорисовки";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "sightValue";
	onchgsetoptionsection = "PERFORMANCE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_VOB_SIGHT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Дистанция объектов";
	text[1] = "Дистанция прорисовки объектов";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4200;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VOB_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zVobFarClipZScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_VID_BRIGHTNESS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Яркость";
	text[1] = "Параметр изменяется только в полноэкранном режиме";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 6);
	dimx = 2700;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_BRIGHTNESS_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 6) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidBrightness";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_CONTRAST(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Контраст";
	text[1] = "Параметр изменяется только в полноэкранном режиме";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 7);
	dimx = 2700;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_CONTRAST_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 7) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidContrast";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_GAMMA(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Гамма";
	text[1] = "Параметр изменяется только в полноэкранном режиме";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 8);
	dimx = 2700;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_GAMMA_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 8) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidGamma";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_BACK(C_MENU_ITEM_DEF)
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


func int update_videooptions()
{
	Update_ChoiceBox("MENUITEM_VID_DEVICE_CHOICE");
	Update_ChoiceBox("MENUITEM_VID_RESOLUTION_CHOICE");
	return 1;
};

func int apply_videoresolution()
{
	Apply_Options_Video();
	return 0;
};

