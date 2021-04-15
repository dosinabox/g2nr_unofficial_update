
instance MENU_OPT_UNION(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_UNION_REMOVEKEYS";
	items[1] = "MENUITEM_UNION_REMOVEKEYS_CHOICE";
	items[2] = "MENUITEM_UNION_FASTFOOD";
	items[3] = "MENUITEM_UNION_FASTFOOD_CHOICE";
	items[4] = "MENUITEM_UNION_MOVELOG";
	items[5] = "MENUITEM_UNION_MOVELOG_CHOICE";
	items[6] = "MENUITEM_UNION_COLLIDEFIX";
	items[7] = "MENUITEM_UNION_COLLIDEFIX_CHOICE";
	items[8] = "MENUITEM_UNION_JUMPBACKNOTURN";
	items[9] = "MENUITEM_UNION_JUMPBACKNOTURN_CHOICE";
	items[10] = "MENUITEM_UNION_STRAFENOTURN";
	items[11] = "MENUITEM_UNION_STRAFENOTURN_CHOICE";
	items[12] = "MENUITEM_UNION_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_UNION_REMOVEKEYS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Удалять ключи";
	text[1] = "Удалять использованные ключи из инвентаря";
	posx = 700;
	posy = MENU_START_Y;
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
	posy = MENU_START_Y + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "RemoveKeys";
	onchgsetoptionsection = "ZMISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_FASTFOOD(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Быстрая еда";
	text[1] = "SHIFT + ДЕЙСТВИЕ для ускоренной анимации еды и питья";
	posx = 700;
	posy = MENU_START_Y + MENU_STEP_Y;
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
	posy = MENU_START_Y + MENU_STEP_Y + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "FastFood";
	onchgsetoptionsection = "ZMISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_MOVELOG(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Обратный дневник";
	text[1] = "Новые записи в дневнике выше старых";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 2);
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
	posy = MENU_START_Y + (MENU_STEP_Y * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "MoveLogEntry";
	onchgsetoptionsection = "ZMISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_COLLIDEFIX(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Проверка целей магии";
	text[1] = "Правильный расчет траектории и цели заклинаний";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
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
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "CollideTargetFix";
	onchgsetoptionsection = "UNION_SPELLFIX";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_JUMPBACKNOTURN(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Фокус при отскоке";
	text[1] = "Переключение камеры на ближайшую цель при отскоке";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_JUMPBACKNOTURN_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "JumpBackNoTurn";
	onchgsetoptionsection = "ZMISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_STRAFENOTURN(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Фокус при стрейфе";
	text[1] = "Стрейф только вокруг ближайшей цели";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_STRAFENOTURN_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "StrafeNoTurn";
	onchgsetoptionsection = "ZMISCUTILS";
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

