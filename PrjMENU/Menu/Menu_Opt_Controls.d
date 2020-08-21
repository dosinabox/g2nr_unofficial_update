
instance MENU_OPT_CONTROLS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[1] = "MENU_ITEM_KEY_UP";
	items[2] = "MENU_ITEM_KEY_DOWN";
	items[3] = "MENU_ITEM_KEY_LEFT";
	items[4] = "MENU_ITEM_KEY_RIGHT";
	items[5] = "MENU_ITEM_KEY_STRAFE_LEFT";
	items[6] = "MENU_ITEM_KEY_STRAFE_RIGHT";
	items[7] = "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";
	items[8] = "MENU_ITEM_KEY_RUNMODETOGGLE";
	items[9] = "MENU_ITEM_KEY_SNEAK";
	items[10] = "MENU_ITEM_KEY_ACTION";
	items[11] = "MENU_ITEM_KEY_WEAPON";
	items[12] = "MENU_ITEM_KEY_MAP";
	items[13] = "MENU_ITEM_KEY_LOOK";
	items[14] = "MENU_ITEM_KEY_LOOK_FP";
	items[15] = "MENU_ITEM_KEY_INVENTORY";
	items[16] = "MENU_ITEM_KEY_SCREEN_STATUS";
	items[17] = "MENU_ITEM_KEY_SCREEN_LOG";
	items[18] = "MENU_ITEM_KEY_TORCH";
	items[19] = "MENU_ITEM_INP_UP";
	items[20] = "MENU_ITEM_INP_DOWN";
	items[21] = "MENU_ITEM_INP_LEFT";
	items[22] = "MENU_ITEM_INP_RIGHT";
	items[23] = "MENU_ITEM_INP_STRAFE_LEFT";
	items[24] = "MENU_ITEM_INP_STRAFE_RIGHT";
	items[25] = "MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	items[26] = "MENU_ITEM_INP_RUNMODETOGGLE";
	items[27] = "MENU_ITEM_INP_SNEAK";
	items[28] = "MENU_ITEM_INP_ACTION";
	items[29] = "MENU_ITEM_INP_WEAPON";
	items[30] = "MENU_ITEM_INP_MAP";
	items[31] = "MENU_ITEM_INP_LOOK";
	items[32] = "MENU_ITEM_INP_LOOK_FP";
	items[33] = "MENU_ITEM_INP_INVENTORY";
	items[34] = "MENU_ITEM_INP_SCREEN_STATUS";
	items[35] = "MENU_ITEM_INP_SCREEN_LOG";
	items[36] = "MENU_ITEM_INP_TORCH";
	items[37] = "MENU_ITEM_KEY_WEAPON_LEFT";
	items[38] = "MENU_ITEM_KEY_WEAPON_RIGHT";
	items[39] = "MENU_ITEM_KEY_WEAPON_PARADE";
	items[40] = "MENU_ITEM_KEY_LOCKFOCUS";
	items[41] = "MENU_ITEM_KEY_QUICKMANA";
	items[42] = "MENU_ITEM_KEY_QUICKHEALTH";
	items[43] = "MENU_ITEM_INP_WEAPON_LEFT";
	items[44] = "MENU_ITEM_INP_WEAPON_RIGHT";
	items[45] = "MENU_ITEM_INP_WEAPON_PARADE";
	items[46] = "MENU_ITEM_INP_LOCKFOCUS";
	items[47] = "MENU_ITEM_INP_QUICKMANA";
	items[48] = "MENU_ITEM_INP_QUICKHEALTH";
	items[49] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
	items[50] = "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";
//	items[51] = "MENU_ITEM_GAMEPAD";
	items[51] = "MENUITEM_CHG_KEYS_BACK";
	flags = flags | MENU_SHOW_INFO;
};

const int CTRL_SP1_1 = 1000;
const int CTRL_SP1_2 = 3500;
const int CTRL_DIMX = 4600;
const int CTRL_DIMY = 300;
const int CTRL_Y_STEP = 260;

instance MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
{
	text[0] = "Вперед";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_UP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_DOWN(C_MENU_ITEM_DEF)
{
	text[0] = "Назад";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + CTRL_Y_STEP;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_DOWN";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Поворот влево";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 2);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Поворот вправо";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 3);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Шаг влево";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 4);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Шаг вправо";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 5);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	text[0] = "Прыжок";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 6);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	text[0] = "Ходьба";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 7);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RUNMODETOGGLE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SNEAK(C_MENU_ITEM_DEF)
{
	text[0] = "Подкрадывание";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 8);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SNEAK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "Действие";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 9);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_ACTION";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON(C_MENU_ITEM_DEF)
{
	text[0] = "Достать оружие";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 10);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_MAP(C_MENU_ITEM_DEF)
{
	text[0] = "Карта";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 11);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_MAP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK(C_MENU_ITEM_DEF)
{
	text[0] = "Обернуться";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 12);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK_FP(C_MENU_ITEM_DEF)
{
	text[0] = "От первого лица";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 13);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK_FP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_INVENTORY(C_MENU_ITEM_DEF)
{
	text[0] = "Инвентарь";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 14);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_INVENTORY";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	text[0] = "Характеристики";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 15);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_STATUS";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	text[0] = "Дневник";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 16);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_LOG";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_TORCH(C_MENU_ITEM_DEF)
{
	text[0] = "Факел";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 17);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_TORCH";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "INTERNAL";
	hideifoptionset = "UnionActivated";
	hideonvalue = 0;
};

instance MENU_ITEM_KEY_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Атака влево";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 18);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Атака вправо";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 19);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	text[0] = "Парирование";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 20);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_PARADE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_LOCKFOCUS(C_MENU_ITEM_DEF)
{
	text[0] = "Захват цели";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 21);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOCKFOCUS";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_QUICKMANA(C_MENU_ITEM_DEF)
{
	text[0] = "Зелье маны";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 22);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_QUICKMANA";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_KEY_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	text[0] = "Лечебное зелье";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 23);
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_QUICKHEALTH";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
{
	backpic = MENU_KBDINPUT_BACK_PIC;
	text[1] = PRESSNOW;
	type = MENU_ITEM_INPUT;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y;
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	onchgsetoption = "keyUp";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_DOWN(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + CTRL_Y_STEP;
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyDown";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 2);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 3);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 4);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 5);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 6);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySMove";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 7);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySlow";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SNEAK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 8);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySneak";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_ACTION(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 9);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyAction";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 10);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyWeapon";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_MAP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 11);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowMap";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 12);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLook";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK_FP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 13);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLookFP";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_INVENTORY(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 14);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyInventory";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 15);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowStatus";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 16);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowLog";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_TORCH(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 17);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyTorch";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "INTERNAL";
	hideifoptionset = "UnionActivated";
	hideonvalue = 0;
};

instance MENU_ITEM_INP_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 18);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionLeft";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 19);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 20);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyParade";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_LOCKFOCUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 21);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLockTarget";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_QUICKMANA(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 22);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyPotion";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_INP_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = MENU_START_Y + (CTRL_Y_STEP * 23);
	dimx = CTRL_DIMX;
	dimy = CTRL_DIMY;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyHeal";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_CHG_KEYS_SET_DEFAULT(C_MENU_ITEM_DEF)
{
	text[0] = "Настройки по умолчанию";
	text[1] = "Восстановление конфигурации по умолчанию";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 24);
	dimy = CTRL_DIMY;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETDEFAULT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE(C_MENU_ITEM_DEF)
{
	text[0] = "Альтернативные настройки";
	text[1] = "Использование альтернативной конфигурации";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 25);
	dimy = CTRL_DIMY;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETALTERNATIVE";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_GAMEPAD(C_MENU_ITEM_DEF)
{
	text[0] = "Раскладка геймпада";
	text[1] = "Показать конфигурацию геймпада";
	posx = CTRL_SP1_1;
	posy = MENU_START_Y + (CTRL_Y_STEP * 26);
	dimy = CTRL_DIMY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GAMEPAD";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
	hideifoptionsectionset = "INTERNAL";
	hideifoptionset = "UnionActivated";
	hideonvalue = 0;
};

instance MENU_OPT_CONTROLS_EXTKEYS(C_MENU_DEF)
{
	
};

instance MENUITEM_CHG_KEYS_BACK(C_MENU_ITEM_DEF)
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

