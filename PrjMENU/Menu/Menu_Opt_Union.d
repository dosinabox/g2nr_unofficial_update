
instance MENU_OPT_UNION(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_UNION_REMOVEKEYS";
	items[1] = "MENUITEM_UNION_REMOVEKEYS_CHOICE";
	items[2] = "MENUITEM_UNION_FASTFOOD";
	items[3] = "MENUITEM_UNION_FASTFOOD_CHOICE";
	items[4] = "MENUITEM_UNION_MOVELOG";
	items[5] = "MENUITEM_UNION_MOVELOG_CHOICE";
	items[6] = "MENUITEM_UNION_JUMPBACKNOTURN";
	items[7] = "MENUITEM_UNION_JUMPBACKNOTURN_CHOICE";
	items[8] = "MENUITEM_UNION_STRAFENOTURN";
	items[9] = "MENUITEM_UNION_STRAFENOTURN_CHOICE";
	items[10] = "MENUITEM_UNION_PREMIUMTEACHERS";
	items[11] = "MENUITEM_UNION_PREMIUMTEACHERS_CHOICE";
	items[12] = "MENUITEM_UNION_HONESTLEARNCOST";
	items[13] = "MENUITEM_UNION_HONESTLEARNCOST_CHOICE";
	items[14] = "MENUITEM_UNION_LIMITEDAMMO";
	items[15] = "MENUITEM_UNION_LIMITEDAMMO_CHOICE";
	items[16] = "MENUITEM_UNION_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_UNION_REMOVEKEYS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "������� �����";
	text[1] = "������� �������������� ����� �� ���������";
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
	text[0] = MENU_TEXT_OFFON;
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
	text[0] = "������� ���";
	text[1] = "SHIFT + �������� ��� ���������� �������� ��� � �����";
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
	text[0] = MENU_TEXT_OFFON;
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
	text[0] = "�������� �������";
	text[1] = "����� ������ � �������� ���� ������";
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
	text[0] = MENU_TEXT_OFFON;
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

instance MENUITEM_UNION_JUMPBACKNOTURN(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "����� ��� �������";
	text[1] = "������������ ������ �� ��������� ���� ��� �������";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_JUMPBACKNOTURN_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_CHOICE_YPLUS;
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
	text[0] = "����� ��� �������";
	text[1] = "������ ������ ������ ��������� ����";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_STRAFENOTURN_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_ONOFF;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "StrafeNoTurn";
	onchgsetoptionsection = "ZMISCUTILS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_PREMIUMTEACHERS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "������� ��������";
	text[1] = "���������� ������ ��� ���� ��������";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_PREMIUMTEACHERS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "PremiumTeachersEnabled";
	onchgsetoptionsection = "SCRIPTPATCH";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_HONESTLEARNCOST(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "������� ��������";
	text[1] = "���������� ������ ���� �������� ��� ��������� ���������";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 6);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_HONESTLEARNCOST_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "HonestLearnCostEnabled";
	onchgsetoptionsection = "SCRIPTPATCH";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_UNION_LIMITEDAMMO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "����� �����������";
	text[1] = "����� ������ ����� � ������ � ���������";
	posx = 700;
	posy = MENU_START_Y + (MENU_STEP_Y * 7);
	dimx = 4400;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_UNION_LIMITEDAMMO_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 7) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "TradersHaveLimitedAmmo";
	onchgsetoptionsection = "SCRIPTPATCH";
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

