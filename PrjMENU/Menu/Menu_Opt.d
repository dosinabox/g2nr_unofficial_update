
instance MENU_OPTIONS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_OPT_HEADING";
	items[1] = "MENUITEM_OPT_GAME";
	items[2] = "MENUITEM_OPT_GRAPHICS";
	items[3] = "MENUITEM_OPT_VIDEO";
	items[4] = "MENUITEM_OPT_AUDIO";
	items[5] = "MENUITEM_OPT_CONTROLS";
	items[6] = "MENUITEM_OPT_EXT";
	items[7] = "MENUITEM_PERF";
	items[8] = "MENUITEM_PERF_CHOICE";
	items[9] = "MENUITEM_OPT_BACK";
	defaultoutgame = 0;
	defaultingame = 0;
	flags = flags | MENU_SHOW_INFO;
};


const int MENU_OPT_DY = 600;
const int MENU_OPT_START_Y = 2000;

instance MENUITEM_OPT_HEADING(C_MENU_ITEM_DEF)
{
	text[0] = "ОПЦИИ";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GAME(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Игровые опции";
	text[1] = "Игровые опции";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 0);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GRAPHICS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции визуализации";
	text[1] = "Дальность обзора, детализация и эффекты.";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 1);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GRAPHICS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_VIDEO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции графики";
	text[1] = "Опции графики";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 2);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_VIDEO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_AUDIO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Опции звука";
	text[1] = "Опции звука";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 3);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_AUDIO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_CONTROLS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Управление";
	text[1] = "Управление";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 4);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_CONTROLS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_EXT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Расширенная конфигурация";
	text[1] = "Некоторые дополнительные настройки";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 5);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_EXT";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Производительность/качество";
	text[1] = "Оптимизация производительности и качества";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6);
	dimx = 8192;
	dimy = 800;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = update_perfoptions;
	flags = flags | IT_EFFECTS_NEXT;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	text[0] = "Особое#Высокая производительность|Среднее качество|Высокое качество";
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 4100 - 2000;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6) + 650;
	dimx = 4000;
	dimy = 350;
	onchgsetoption = "perfQualityIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Назад";
	posx = 1000;
	posy = MENU_BACK_Y + 300;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};


func int update_perfoptions()
{
	Apply_Options_Performance();
	return 0;
};

