
const int MAX_USERSTRINGS = 10;
const int MAX_ITEMS = 150;
const int MAX_EVENTS = 10;
const int MAX_SEL_ACTIONS = 5;
const int MAX_USERVARS = 4;
const int SEL_ACTION_UNDEF = 0;
const int SEL_ACTION_BACK = 1;
const int SEL_ACTION_STARTMENU = 2;
const int SEL_ACTION_STARTITEM = 3;
const int SEL_ACTION_CLOSE = 4;
const int SEL_ACTION_CONCOMMANDS = 5;
const int SEL_ACTION_PLAY_SOUND = 6;
const int SEL_ACTION_EXECCOMMANDS = 7;
const int MENU_ITEM_UNDEF = 0;
const int MENU_ITEM_TEXT = 1;
const int MENU_ITEM_SLIDER = 2;
const int MENU_ITEM_INPUT = 3;
const int MENU_ITEM_CURSOR = 4;
const int MENU_ITEM_CHOICEBOX = 5;
const int MENU_ITEM_BUTTON = 6;
const int MENU_ITEM_LISTBOX = 7;
const int IT_CHROMAKEYED = 1;
const int IT_TRANSPARENT = 2;
const int IT_SELECTABLE = 4;
const int IT_MOVEABLE = 8;
const int IT_TXT_CENTER = 16;
const int IT_DISABLED = 32;
const int IT_FADE = 64;
const int IT_EFFECTS_NEXT = 128;
const int IT_ONLY_OUT_GAME = 256;
const int IT_ONLY_IN_GAME = 512;
const int IT_PERF_OPTION = 1 << 10;
const int IT_MULTILINE = 1 << 11;
const int IT_NEEDS_APPLY = 1 << 12;
const int IT_NEEDS_RESTART = 1 << 13;
const int IT_EXTENDED_MENU = 1 << 14;
const int MENU_OVERTOP = 1;
const int MENU_EXCLUSIVE = 2;
const int MENU_NOANI = 4;
const int MENU_DONTSCALE_DIM = 8;
const int MENU_DONTSCALE_POS = 16;
const int MENU_ALIGN_CENTER = 32;
const int MENU_SHOW_INFO = 64;
const int EVENT_UNDEF = 0;
const int EVENT_EXECUTE = 1;
const int EVENT_CHANGED = 2;
const int EVENT_LEAVE = 3;
const int EVENT_TIMER = 4;
const int EVENT_CLOSE = 5;
const int EVENT_INIT = 6;
const int EVENT_SEL_PREV = 7;
const int EVENT_SEL_NEXT = 8;
const int CLOSE_ITEM = 1;

class C_MENU_ITEM
{
	var string fontname;
	var string text[10];
	var string backpic;
	var string alphamode;
	var int alpha;
	var int type;
	var int onselaction[5];
	var string onselaction_s[5];
	var string onchgsetoption;
	var string onchgsetoptionsection;
	var func oneventaction[10];
	var int posx;
	var int posy;
	var int dimx;
	var int dimy;
	var float sizestartscale;
	var int flags;
	var float opendelaytime;
	var float openduration;
	var float userfloat[4];
	var string userstring[4];
	var int framesizex;
	var int framesizey;
	var string hideifoptionsectionset;
	var string hideifoptionset;
	var int hideonvalue;
};

class C_MENU
{
	var string backpic;
	var string backworld;
	var int posx;
	var int posy;
	var int dimx;
	var int dimy;
	var int alpha;
	var string musictheme;
	var int eventtimermsec;
	var string items[150];
	var int flags;
	var int defaultoutgame;
	var int defaultingame;
};

prototype C_MENU_ITEM_DEF(C_MENU_ITEM)
{
	fontname = MENU_FONT_DEFAULT;
	text[0] = "";
	alphamode = "BLEND";
	alpha = 254;
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 0;
	dimx = -1;
	dimy = -1;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_SELECTABLE;
	opendelaytime = 0;
	openduration = -1;
	sizestartscale = 1;
	userfloat[0] = 100;
	userfloat[1] = 200;
	onselaction[0] = SEL_ACTION_BACK;
	onchgsetoption = "";
	onchgsetoptionsection = "INTERNAL";
	hideifoptionsectionset = "";
	hideifoptionset = "";
	hideonvalue = -1;
	framesizex = 0;
	framesizey = 0;
};

prototype C_MENU_DEF(C_MENU)
{
	posx = 0;
	posy = 0;
	dimx = 8192;
	dimy = 8192;
//	dimx = 5120;
//	dimy = 6144;
	alpha = 254;
	flags = MENU_EXCLUSIVE | MENU_DONTSCALE_DIM | MENU_ALIGN_CENTER;
//	flags = MENU_EXCLUSIVE | MENU_ALIGN_CENTER;
	eventtimermsec = 1000;
	musictheme = "";
	defaultoutgame = -1;
	defaultingame = -1;
};

