
instance MENU_OPT_UNION(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_UNION_UNREAD";
	items[1] = "MENUITEM_UNION_UNREAD_CHOICE";
	items[2] = "MENUITEM_UNION_NEW";
	items[3] = "MENUITEM_UNION_NEW_CHOICE";
	items[4] = "MENUITEM_UNION_ADD";
	items[5] = "MENUITEM_UNION_ADD_CHOICE";
	items[6] = "MENUITEM_UNION_REMOVEKEYS";
	items[7] = "MENUITEM_UNION_REMOVEKEYS_CHOICE";
	items[8] = "MENUITEM_UNION_FASTFOOD";
	items[9] = "MENUITEM_UNION_FASTFOOD_CHOICE";
	items[10] = "MENUITEM_UNION_MOVELOG";
	items[11] = "MENUITEM_UNION_MOVELOG_CHOICE";
	items[12] = "MENUITEM_UNION_COLLIDEFIX";
	items[13] = "MENUITEM_UNION_COLLIDEFIX_CHOICE";
	items[14] = "MENUITEM_UNION_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_UNION_UNREAD(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Метка непрочитанного";
	text[1] = "Помечать непрочитанные записки и книги в инвентаре";
	posx = 700;
	posy = MENU_START_Y;
	dimx = 4500;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_UNREAD_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "UnreadDocPrio";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_NEW(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Метка нового";
	text[1] = "Помечать новые предметы в инвентаре";
	posx = 700;
	posy = MENU_START_Y + MENU_STEP_Y;
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_NEW_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_STEP_Y + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "NewItemPrio";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_ADD(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Метка добавленного";
	text[1] = "Помечать увеличение количества предметов в инвентаре";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 2);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_ADD_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 2) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "AddItemPrio";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_REMOVEKEYS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Удалять ключи";
	text[1] = "Удалять использованные ключи из инвентаря";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_REMOVEKEYS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "RemoveKeys";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_FASTFOOD(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Быстрая еда";
	text[1] = "SHIFT + ДЕЙСТВИЕ для ускоренной анимации еды и питья";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_FASTFOOD_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "FastFood";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_MOVELOG(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Обратный дневник";
	text[1] = "Новые записи в дневнике выше старых";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_MOVELOG_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "MoveLogEntry";
	onchgsetoptionsection = "UNION_MISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_COLLIDEFIX(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Проверка целей магии";
	text[1] = "Правильный расчет траектории и цели заклинаний";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 6);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_COLLIDEFIX_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "CollideTargetFix";
	onchgsetoptionsection = "[UNION_SPELLFIX]";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_BACK(C_MENU_ITEM_DEF)
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

