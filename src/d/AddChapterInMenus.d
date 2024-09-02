META
{
	Parser = Menu
};

test(MENU_TEXT_CHAPTER)
{
	instance MENU_ITEM_LOG_CHAPTER_TITLE(C_MENU_ITEM_DEF)
	{
		text[0] = MENU_TEXT_CHAPTER;
		posx = 1400;
		posy = 5700;
		fontname = LOG_FONT_DATETIME;
		flags = flags & ~IT_SELECTABLE;
	};

	instance MENU_ITEM_LOG_CHAPTER(C_MENU_ITEM_DEF)
	{
		text[0] = "";
		posx = 2270;
		posy = 5700;
		fontname = LOG_FONT_DATETIME;
		flags = flags & ~IT_SELECTABLE;
	};

	instance MENU_LOG(C_MENU_DEF)
	{
		MENU_LOG_OLD();
		items[13] = "MENU_ITEM_LOG_CHAPTER_TITLE";
		items[14] = "MENU_ITEM_LOG_CHAPTER";
	};

	instance MENU_ITEM_LOADSAVE_CHAPTER_TITLE(C_MENU_ITEM_DEF)
	{
		text[0] = MENU_TEXT_CHAPTER;
		posx = SAVEGAME_X2;
		posy = 4805;
		fontname = MENU_FONT_SMALL;
		flags = flags & ~IT_SELECTABLE;
	};

	instance MENU_ITEM_LOADSAVE_CHAPTER(C_MENU_ITEM_DEF)
	{
		text[0] = "";
		posx = SAVEGAME_X2;
		posy = 5125;
		fontname = MENU_FONT_SMALL;
		flags = flags & ~IT_SELECTABLE;
	};

	instance MENU_SAVEGAME_LOAD(C_MENU_DEF)
	{
		MENU_SAVEGAME_LOAD_OLD();
		items[31] = "MENU_ITEM_LOADSAVE_CHAPTER_TITLE";
		items[32] = "MENU_ITEM_LOADSAVE_CHAPTER";
	};

	instance MENU_SAVEGAME_SAVE(C_MENU_DEF)
	{
		MENU_SAVEGAME_SAVE_OLD();
		items[31] = "MENU_ITEM_LOADSAVE_CHAPTER_TITLE";
		items[32] = "MENU_ITEM_LOADSAVE_CHAPTER";
	};
};
