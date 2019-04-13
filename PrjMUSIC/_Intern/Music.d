
const string MOTIF_DEATH = "J_DEATH";
const string MOTIF_RESURRECTION = "J_RESURRECT";
const string MOTIF_FOUNDITEM = "J_FOUNDITEM";
const string MOTIF_SOLVEDMISSION = "J_MISSOLVED";
const string MOTIF_FAILEDMISSION = "J_MISFAILED";
const string MOTIF_KILLEDENEMY = "J_KILLEDENEMY";
const string MOTIF_KILLEDBIGENEMY = "J_KILLEDBIGENEMY";
const string MOTIF_LEVEL_GAIN = "J_LEVELGAIN";
const string MOTIF_ATTITUDE_INCREASE = "J_INC_AT";
const string MOTIF_ATTITUDE_DECREASE = "J_DEC_AT";
const string MOTIF_TRAP_ACTIVATE = "J_TRAP_ACTIVATE";
const string MOTIF_STEAL_FAIL = "J_STEAL_FAIL";
const string MOTIF_REFRESH_MANA = "J_MANA_REFRESH";
const string MOTIF_REFRESH_HEALTH = "J_HEALTH_REFRESH";
const string MOTIF_REFRESH_PSI = "J_PSI_REFRESH";
const string MOTIF_HEALTHLOW = "J_HEALTH_LOW";

const int TRANSITION_TYPE_NONE = 1;
const int TRANSITION_TYPE_GROOVE = 2;
const int TRANSITION_TYPE_FILL = 3;
const int TRANSITION_TYPE_BREAK = 4;
const int TRANSITION_TYPE_INTRO = 5;
const int TRANSITION_TYPE_END = 6;
const int TRANSITION_TYPE_ENDANDINTRO = 7;
const int TRANSITION_SUB_TYPE_IMMEDIATE = 1;
const int TRANSITION_SUB_TYPE_BEAT = 2;
const int TRANSITION_SUB_TYPE_MEASURE = 3;

class C_MUSICSYS_CFG
{
	var float volume;
	var int bitresolution;
	var int globalreverbenabled;
	var int samplerate;
	var int numchannels;
	var int reverbbuffersize;
};

class C_MUSICTHEME
{
	var string file;
	var float vol;
	var int loop;
	var float reverbmix;
	var float reverbtime;
	var int transtype;
	var int transsubtype;
};

class C_MUSICJINGLE
{
	var string name;
	var int loop;
	var float vol;
	var int transsubtype;
};

prototype C_MUSICTHEME_DEF(C_MUSICTHEME)
{
	vol = 1;
	loop = 1;
	transtype = TRANSITION_TYPE_NONE;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
	reverbmix = -80;
	reverbtime = 9000;
};

prototype C_MUSICJINGLE_DEF(C_MUSICJINGLE)
{
	name = "";
	vol = 1;
	loop = 0;
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

