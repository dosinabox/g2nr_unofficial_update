
instance MENU_OPTIONS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_OPT_GAME";
	items[1] = "MENUITEM_OPT_GRAPHICS";
	items[2] = "MENUITEM_OPT_VIDEO";
	items[3] = "MENUITEM_OPT_AUDIO";
	items[4] = "MENUITEM_OPT_CONTROLS";
	items[5] = "MENUITEM_OPT_UNION";
	items[6] = "MENUITEM_OPT_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_OPT_GAME(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Игровые опции";
	text[1] = "Настройки игрового процесса";
	posx = 0;
	posy = MENU_MAIN_START_Y - MENU_MAIN_STEP_Y;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GRAPHICS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции визуализации";
	text[1] = "Эффекты, тени, отражения";
	posx = 0;
	posy = MENU_MAIN_START_Y;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GRAPHICS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_VIDEO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции графики";
	text[1] = "Разрешение, дальность видимости, детализация";
	posx = 0;
	posy = MENU_MAIN_START_Y + MENU_MAIN_STEP_Y;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_VIDEO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_AUDIO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции звука";
	text[1] = "Качество и громкость звука и музыки";
	posx = 0;
	posy = MENU_MAIN_START_Y + (MENU_MAIN_STEP_Y * 2);
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_AUDIO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_CONTROLS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Управление";
	text[1] = "Назначение клавиш управления";
	posx = 0;
	posy = MENU_MAIN_START_Y + (MENU_MAIN_STEP_Y * 3);
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_CONTROLS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_UNION(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Плагины";
	text[1] = "Настройки плагинов Union";
	posx = 0;
	posy = MENU_MAIN_START_Y + (MENU_MAIN_STEP_Y * 4);
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_UNION";
	flags = flags | IT_TXT_CENTER;
	hideifoptionsectionset = "INTERNAL";
	hideifoptionset = "UnionActivated";
	hideonvalue = 0;
};

instance MENUITEM_OPT_BACK(C_MENU_ITEM_DEF)
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


func int update_perfoptions()
{
	Apply_Options_Performance();
	return 0;
};

