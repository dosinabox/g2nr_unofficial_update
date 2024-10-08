
instance MENU_OPT_GAME(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GAME_WINANI";
	items[1] = "MENUITEM_GAME_WINANI_CHOICE";
	items[2] = "MENUITEM_GAME_FIGHTFOCUS";
	items[3] = "MENUITEM_GAME_FIGHTFOCUS_CHOICE";
	items[4] = "MENUITEM_GAME_INTERACTFOCUS";
	items[5] = "MENUITEM_GAME_INTERACTFOCUS_CHOICE";
	items[6] = "MENUITEM_GAME_LOOKAROUND_INVERSE";
	items[7] = "MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE";
	items[8] = "MENUITEM_M";
	items[9] = "MENUITEM_M_CHOICE";
	items[10] = "MENUITEM_MSENSITIVITY";
	items[11] = "MENUITEM_MSENSITIVITY_SLIDER";
	items[12] = "MENUITEM_MROT";
	items[13] = "MENUITEM_MROT_CHOICE";
	items[14] = "MENUITEM_GAME_OLDCONTROLS";
	items[15] = "MENUITEM_GAME_OLDCONTROLS_CHOICE";
	items[16] = "MENUITEM_GAME_LOGOS";
	items[17] = "MENUITEM_GAME_LOGOS_CHOICE";
	items[18] = "MENUITEM_GAME_LOCKS";
	items[19] = "MENUITEM_GAME_LOCKS_CHOICE";
	items[20] = "MENUITEM_GAME_BLOOD";
	items[21] = "MENUITEM_GAME_BLOOD_CHOICE";
	items[22] = "MENUITEM_GAME_INV";
	items[23] = "MENUITEM_GAME_INV_CHOICE";
	items[24] = "MENUITEM_GAME_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GAME_WINANI(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "�������� ����";
	text[1] = "������������� ���� �������� � ���������";
	posx = 1000;
	posy = MENU_START_Y;
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_WINANI_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "animatedWindows";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_FIGHTFOCUS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "��������� �����";
	text[1] = "��������� ��������� ������� ����";
	posx = 1000;
	posy = MENU_START_Y + MENU_STEP_Y;
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "����|�����|���������|���";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + MENU_STEP_Y + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "highlightMeleeFocus";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INTERACTFOCUS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "��������� �������";
	text[1] = "��������� ��������� �������� �������";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 2);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INTERACTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 2) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "highlightInteractFocus";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "�������� ������";
	text[1] = "�������� ������ ���/����";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 3);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "camLookaroundInverse";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_M(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "������� ����";
	text[1] = "����������� ������ ��������";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 4);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_M_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "����|1x|2x|3x|4x|5x|6x|7x|8x|9x|10x|11x|12x|13x|14x";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zSmoothMouse";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_MSENSITIVITY(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "����������������";
	text[1] = "������� ���������������� ����";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 5);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MSENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 5) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "mouseSensitivity";
	onchgsetoptionsection = "GAME";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MROT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "�������� ��������";
	text[1] = "�������� �������� ������ ������, ��������� ����������";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 6);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MROT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "����|��������|��������|������|����� ������";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zMouseRotationScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_OLDCONTROLS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "���������� Gothic I";
	text[1] = "������������ ���������� � ��� �� Gothic I";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 7);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_OLDCONTROLS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 7) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "useGothic1Controls";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_LOGOS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "��������";
	text[1] = "�������� ������������� ��� ������� ����";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 8);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOGOS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = MENU_TEXT_OFFON;
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 8) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "playLogoVideos";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_LOCKS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "��������� �����";
	text[1] = "������ ���������� ��� ������ �������� ����������";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 9);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOCKS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "����|����� �����|�����|������|������|����� ������";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 9) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "pickLockScramble";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_BLOOD(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "����������";
	text[1] = "���������� �����";
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 10);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_BLOOD_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "����|����|��������|�����";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 10) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bloodDetail";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INV(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "������ ���������";
	text[1] = NEEDS_RESTART;
	posx = 1000;
	posy = MENU_START_Y + (MENU_STEP_Y * 11);
	dimx = 4000;
	dimy = MENU_MAIN_DY;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INV_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "��������|1 �������|2 �������|3 �������|4 �������|5 ��������|6 ��������|7 ��������|8 ��������|9 ��������|10 ��������";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_STEP_Y * 11) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "invMaxColumns";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_BACK(C_MENU_ITEM_DEF)
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

