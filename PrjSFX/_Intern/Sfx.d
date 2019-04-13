
const string PROV_DOLBY_SURR = "Dolby Surround";
const string PROV_A3D = "Aureal A3D Interactive(TM)";
const string PROV_D3D_HW = "DirectSound3D Hardware Support";
const string PROV_D3D_SW = "DirectSound3D Software Emulation";
const string PROV_D3D_EAX = "DirectSound3D with Creative Labs EAX(TM)";
const string PROV_D3D7_FULL_HRTF = "DirectSound3D 7+ Software - Full HRTF";
const string PROV_D3D7_LIGHT_HRTF = "DirectSound3D 7+ Software - Light HRTF";
const string PROV_D3D7_PAN = "DirectSound3D 7+ Software - Pan and Volume";
const string PROV_EAX = "Creative Labs EAX (TM)";
const string PROV_EAX2 = "Creative Labs EAX 2 (TM)";
const string PROV_MILES_2D = "Miles Fast 2D Positional Audio";
const string PROV_RSX = "RAD Game Tools RSX 3D Audio";

class C_SNDSYS_CFG
{
	var float volume;
	var int bitresolution;
	var int samplerate;
	var int usestereo;
	var int numsfxchannels;
	var string used3dprovidername;
};

class C_SFX
{
	var string file;
	var int pitchoff;
	var int pitchvar;
	var int vol;
	var int loop;
	var int loopstartoffset;
	var int loopendoffset;
	var float reverblevel;
	var string pfxname;
};

prototype C_SFX_DEF(C_SFX)
{
	file = "";
	pitchoff = 0;
	pitchvar = 0;
	vol = 127;
	loop = 0;
	loopstartoffset = 0;
	loopendoffset = -1;
	reverblevel = 1;
};

instance SNDSYSCONFIG(C_SNDSYS_CFG)
{
	volume = 1;
	bitresolution = 16;
	samplerate = 22100;
	usestereo = 1;
	numsfxchannels = 16;
	used3dprovidername = PROV_MILES_2D;
};

