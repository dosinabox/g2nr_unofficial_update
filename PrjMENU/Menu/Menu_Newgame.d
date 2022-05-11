
instance MENU_NEW_GAME(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_NEW_GAME_HEADLINE";
	items[1] = "MENUITEM_NEW_GAME_YES";
	items[2] = "MENUITEM_NEW_GAME_NO";
	defaultoutgame = 1;
	defaultingame = 2;
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_NEW_GAME_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Начать новую игру?";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3000;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_TXT_CENTER;
};

instance MENUITEM_NEW_GAME_YES(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Да";
	text[1] = "Да, вперед!";
	posx = 0;
	posy = 4000;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};

instance MENUITEM_NEW_GAME_NO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Нет";
	text[1] = "Нет, не сейчас";
	posx = 0;
	posy = 4600;
	dimx = MENU_MAIN_DX;
	dimy = MENU_MAIN_DY;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};

