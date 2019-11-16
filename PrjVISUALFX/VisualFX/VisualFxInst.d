
instance STARGATE_SCREENBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "10";
	userstring[1] = "0 0 0 255";
	userstring[2] = "3";
	userstring[3] = "STARGATE_BLEND.TGA";
	visalphablendfunc_s = "ADD";
	emfxlifespan = 10;
};

instance SPELLFX_THUNDERSTORM(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderstorm_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "FX_EarthQuake";
};

instance SPELLFX_THUNDERSTORM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Thunderstorm_RAIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_THUNDERSTORM_RAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderstorm_Rain";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "CATACLYSM";
	emfxcreatedowntrj = 1;
	emfxcreate_s = "spellFX_ThunderStorm_Flash";
	sfxid = "MFX_Thunderstorm_IceRain";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERSTORM_INVESTGLOW(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderstorm_InvestGlow";
	emtrjoriginnode = "BIP01";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "FX_EarthQuake";
};

instance SPELLFX_THUNDERSTORM_FLASH(CFX_BASE_PROTO)
{
	emfxcreatedowntrj = 1;
	visname_s = "MFX_Thunderstorm_Flashes";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxcreate_s = "spellFX_ThunderStorm_Screenblend";
	sfxid = "MFX_Thunderstorm_Thunder";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERSTORM_SCREENBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "10";
	userstring[1] = "0 0 0 120";
	userstring[2] = "3";
	visalphablendfunc_s = "BLEND";
	emfxlifespan = 10;
};

instance SPELLFX_SKULL(CFX_BASE_PROTO)
{
	visname_s = "MFX_SKULL_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetrange = 20;
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 0;
	emtrjangleheadvar = 0;
	emtrjeasefunc_s = "LINEAR";
	emtrjeasevel = 100;
	emtrjdynupdatedelay = 20000;
	emfxcreatedowntrj = 1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
};

instance SPELLFX_SKULL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_SKULL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Skull_Skull";
	pfx_ppsisloopingchg = 1;
	sfxid = "MFX_Skull_Cast";
	sfxisambient = 1;
};

instance SPELLFX_SKULL_SKULL(CFX_BASE_PROTO)
{
	visname_s = "MFX_SKULL_CAST";
	emtrjmode_s = "TARGET SPLINE RANDOM";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetrange = 20;
	emtrjangleelevvar = 15;
	emtrjangleheadvar = 25;
	emtrjnumkeys = 2;
	emtrjnumkeysvar = 1;
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emtrjdynupdatetargetonly = 1;
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Skull_COLLIDEFX";
	emfxcolldyn_s = "spellFX_Skull_SPREAD";
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emtrjeasevel = 700;
};

instance SPELLFX_SKULL_SKULL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 1;
	sfxid = "MFX_Skull_Fly";
};

instance SPELLFX_SKULL_SPREAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_SKULL_SPREAD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "CREATE CREATEQUAD";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_Skull_COLLIDEFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 1;
	sfxid = "MFX_FIrestorm_Collide";
	sfxisambient = 1;
};

instance SPELLFX_SKULL_COLLIDEFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Skull_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Skull_Collide";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUCKENERGY(CFX_BASE_PROTO)
{
	visname_s = "MFX_SUCKENERGY_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "PINGPONG_ONCE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldynperc_s = "spellFX_SuckEnergy_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	lightpresetname = "REDAMBIENCE";
	emfxinvestorigin_s = "spellFX_SuckEnergy_Invest";
};

instance SPELLFX_SUCKENERGY_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_SUCKENERGY_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SUCKENERGY_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	lightrange = 100;
	emcheckcollision = 1;
	sfxid = "MFX_SuckEnergy_Cast";
};

instance SPELLFX_SUCKENERGY_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUCKENERGY_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_SUCKENERGY_INVEST";
	emtrjmode_s = "FIXED";
};

instance SPELLFX_SUCKENERGY_SLOWTIME(CFX_BASE_PROTO)
{
	emfxtriggerdelay = 6;
	emfxlifespan = 30;
	visname_s = "morph.fov";
	userstring[0] = "0.8";
	userstring[1] = "1.0";
	userstring[2] = "120";
	userstring[3] = "90";
};

instance SPELLFX_SUCKENERGY_BLOODFLY(CFX_BASE_PROTO)
{
	visname_s = "MFX_SUCKENERGY_FLYTOPLAYER";
	emtrjeasevel = 0.01;
	emtrjmode_s = "TARGET LINE";
	emtrjoriginnode = "Bip01 Spine2";
	emtrjtargetnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0.01;
};

instance SPELLFX_SUCKENERGY_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_SUCKENERGY_TARGET";
	sendassessmagic = 1;
	sfxid = "MFX_SuckEnergy_Target";
};

instance SPELLFX_ENERGYBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Energyball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcolldyn_s = "spellFX_Energyball_TARGET";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_ENERGYBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_ENERGYBALL_KEY_INVEST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_ENERGYBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_ENERGYBALL_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 900;
	sfxid = "MFX_Thunderball_Collide3";
	lightrange = 100;
	emcheckcollision = 1;
};

instance SPELLFX_ENERGYBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_ENERGYBALL_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_ENERGYBALL_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sendassessmagic = 1;
	sfxid = "MFX_Lightning_ORIGIN";
	sfxisambient = 1;
};

instance SPELLFX_ICELANCE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icelance_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Icelance_COLLIDEFX";
	emfxcolldyn_s = "spellFX_Icelance_COLLIDEFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emfxcreatedowntrj = 0;
	lightpresetname = "AURA";
};

instance SPELLFX_ICELANCE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_ICELANCE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_ICELANCE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icelance_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	lightrange = 100;
	emcheckcollision = 1;
	sfxid = "MFX_Icelance_Cast";
};

instance SPELLFX_ICELANCE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	visname_s = "";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_ICELANCE_COLLIDEFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icelance_Collide";
	visalpha = 1;
	emtrjmode_s = "FOLLOW TARGET";
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Icelance_Collide";
};

instance SPELLFX_WATERFIST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WATERFIST_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetrange = 50;
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 0;
	emtrjangleheadvar = 0;
	emtrjeasefunc_s = "LINEAR";
	emtrjeasevel = 100;
	emtrjdynupdatedelay = 20000;
	emfxcreatedowntrj = 1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
};

instance SPELLFX_WATERFIST_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_WATERFIST_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Waterfist_INIT";
	lightrange = 0.001;
};

instance SPELLFX_WATERFIST_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellfx_waterfist_Abyss";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_WATERFIST_COLLIDEFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_waterfist_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Waterfist_Collide";
	sfxisambient = 1;
};

instance SPELLFX_WATERFIST_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_waterfist_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Waterfist_Collide";
	sfxisambient = 1;
};

instance SPELLFX_WATERFIST_ABYSS(CFX_BASE_PROTO)
{
	visname_s = "MFX_WATERFIST_CAST";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "TARGET SPLINE RANDOM";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 2;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjeasevel = 900;
	emtrjdynupdatedelay = 0.1;
	emtrjdynupdatetargetonly = 1;
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emactioncollstat_s = "COLLIDE CREATE";
	emfxcollstat_s = "SPELLFX_WATERFIST_COLLIDEFX";
	emfxcolldyn_s = "SPELLFX_WATERFIST_COLLIDEDYNFX";
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
};

instance SPELLFX_WATERFIST_ABYSS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 1;
	sfxid = "MFX_Waterfist_Cast";
};

instance SPELLFX_WATERFIST_ABYSS_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	visname_s = "";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_SWARM(CFX_BASE_PROTO)
{
	visname_s = "MFX_SWARM_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjangleelevvar = 15;
	emtrjangleheadvar = 25;
	emtrjnumkeys = 2;
	emtrjnumkeysvar = 1;
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldynperc_s = "spellFX_Whirlwind_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
};

instance SPELLFX_SWARM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SWARM_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 500;
	emcheckcollision = 1;
	sfxid = "MFX_Swarm_Cast";
};

instance SPELLFX_SWARM_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_GREENTENTACLE(CFX_BASE_PROTO)
{
	visname_s = "MFX_GREENTENTACLE_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
};

instance SPELLFX_GREENTENTACLE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Greententacle_Bridge";
	emtrjeasevel = 1e-006;
	pfx_ppsisloopingchg = 1;
	emtrjmode_s = "TARGET SPLINE RANDOM";
	emtrjeasevel = 500;
	emcheckcollision = 1;
	sfxid = "MFX_Greententacle_Burst";
};

instance SPELLFX_GREENTENTACLE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_GREENTENTACLE_BRIDGE(CFX_BASE_PROTO)
{
	visname_s = "MFX_GREENTENTACLE_CAST";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "TARGET SPLINE RANDOM";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 2;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjeasevel = 900;
	emtrjdynupdatedelay = 0.1;
	emtrjdynupdatetargetonly = 1;
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emactioncollstat_s = "COLLIDE";
	emfxcolldynperc_s = "SPELLFX_Greententacle_Target";
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
};

instance SPELLFX_GREENTENTACLE_BRIDGE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 1;
};

instance SPELLFX_GREENTENTACLE_BRIDGE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	visname_s = "";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_GREENTENTACLE_TARGET(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_Greententacle_Target";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Greententacle_Grow";
	sendassessmagic = 1;
};

instance SPELLFX_GEYSER(CFX_BASE_PROTO)
{
	visname_s = "MFX_GEYSER_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcolldyn_s = "spellFX_Geyser_FOUNTAIN";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	lightpresetname = "AURA";
};

instance SPELLFX_GEYSER_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_GEYSER_KEY_INVEST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	emcreatefxid = "spellFX_Geyser_Rumble";
};

instance SPELLFX_GEYSER_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_GEYSER_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1000;
	lightrange = 100;
	emcheckcollision = 1;
	sfxid = "MFX_Geyser_Rumble";
	sfxisambient = 1;
};

instance SPELLFX_GEYSER_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_GEYSER_FOUNTAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_GEYSER_FOUNTAIN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_Geyser_Fountain";
	sfxisambient = 1;
};

instance SPELLFX_GEYSER_RUMBLE(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_Geyser_Rumble";
	sfxisambient = 1;
};

instance SPELLFX_WHIRLWIND(CFX_BASE_PROTO)
{
	visname_s = "MFX_WHIRLWIND_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcolldyn_s = "spellFX_Whirlwind_TARGET";
	emfxcolldynperc_s = "spellFX_Whirlwind_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emfxinvestorigin_s = "spellFX_Whirlwind_Invest";
};

instance SPELLFX_WHIRLWIND_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_WHIRLWIND_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_WHIRLWIND_INIT";
	lightrange = 0.01;
	scaleduration = 0.5;
};

instance SPELLFX_WHIRLWIND_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_WHIRLWIND_GROW";
	lightrange = 0.01;
	pfx_visalphastart = 100;
};

instance SPELLFX_WHIRLWIND_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_visalphastart = 150;
	emtrjmode_s = "TARGET";
	emtrjeasevel = 400;
	emcheckcollision = 1;
	lightrange = 100;
	sfxid = "MFX_Windfist_Cast";
	sfxisambient = 1;
};

instance SPELLFX_WHIRLWIND_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_WHIRLWIND_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ICESPELL_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_ICECUBE_COLLIDE";
};

instance SPELLFX_WHIRLWIND_INVEST(CFX_BASE_PROTO)
{
	emtrjmode_s = "FIXED";
	sfxid = "MFX_WHIRLWIND_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_WHIRLWIND_SOUND(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_WHIRLWIND_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_WHIRLWIND_TARGET(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_Whirlwind_Target";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Whirlwind_Target";
	sfxisambient = 1;
};

instance SPELLFX_WHIRLWIND_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "";
	sendassessmagic = 1;
};

instance SPELLFX_INCOVATION_RED(CFX_BASE_PROTO)
{
	visname_s = "INVOCATION_RED";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "REDAMBIENCE";
	sfxid = "SFX_Circle";
	sfxisambient = 1;
};

instance SPELLFX_INCOVATION_GREEN(CFX_BASE_PROTO)
{
	visname_s = "INVOCATION_GREEN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "POISON";
	sfxid = "SFX_Circle";
	sfxisambient = 1;
};

instance SPELLFX_INCOVATION_BLUE(CFX_BASE_PROTO)
{
	visname_s = "INVOCATION_BLUE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "REDAMBIENCE";
	sfxid = "SFX_Circle";
	sfxisambient = 1;
};

instance SPELLFX_INCOVATION_VIOLET(CFX_BASE_PROTO)
{
	visname_s = "INVOCATION_VIOLET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "CATACLYSM";
	sfxid = "SFX_Circle";
	sfxisambient = 1;
};

instance SPELLFX_INCOVATION_WHITE(CFX_BASE_PROTO)
{
	visname_s = "INVOCATION_WHITE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "WHITEBLEND";
	sfxid = "SFX_Circle";
	sfxisambient = 1;
};

instance SPELLFX_LIGHTSTAR_VIOLET(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_VIOLET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_LIGHTSTAR_WHITE(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_WHITE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_LIGHTSTAR_BLUE(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_BLUE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_LIGHTSTAR_RED(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_RED";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_LIGHTSTAR_GREEN(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_GREEN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_LIGHTSTAR_ORANGE(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_ORANGE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_INNOSEYE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Innoseye";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_HEALSHRINE(CFX_BASE_PROTO)
{
	visname_s = "MFX_HealShrine";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "WHITEBLEND";
};

instance SPELLFX_RINGRITUAL1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_SPREAD_SMALL";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "CREATE CREATEQUAD";
	emfxcolldyn_s = "spellFX_ChargeFireball_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 1;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
	emfxcreate_s = "spellFX_Firestorm_COLLIDE";
	sfxid = "MFX_FIrestorm_Collide";
	sfxisambient = 1;
};

instance SPELLFX_RINGRITUAL1_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_RINGRITUAL1_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
};

instance SPELLFX_RINGRITUAL2(CFX_BASE_PROTO)
{
	visname_s = "MFX_RINGRITUAL2";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
};

instance SPELLFX_LIGHTSTAR_RINGRITUAL(CFX_BASE_PROTO)
{
	visname_s = "LIGHTSTAR_ORANGE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_Firerain_Invest";
	sfxisambient = 1;
};

instance SPELLFX_ITEMAUSBUDDELN(CFX_BASE_PROTO)
{
	visname_s = "";
	visalpha = 1;
	emtrjmode_s = "FOLLOW TARGET";
	emtrjeasevel = 0;
	emtrjoriginnode = "BIP01 Head";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.4;
	emtrjtargetrange = 1.2;
	emtrjtargetelev = 89;
	lightpresetname = "JUSTWHITE";
};

instance SPELLFX_ITEMAUSBUDDELN_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ITEMAUSBUDDELN_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ITEMAUSBUDDELN_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Light_ORIGIN";
	lightrange = 1000;
	sfxid = "MFX_Light_CAST";
	sfxisambient = 1;
	emtrjeasevel = 1400;
};

instance SPELLFX_BELIARSWEAPON_UPGRATE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_Origin";
	lightpresetname = "JUSTWHITE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_MAYA_GHOST(CFX_BASE_PROTO)
{
	visname_s = "CS_FOKUS1";
	lightpresetname = "JUSTWHITE";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_BELIARSRAGE(CFX_BASE_PROTO)
{
	visname_s = "MFX_BELIARSRAGE_FLASH";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emfxcreate_s = "spellFX_BELIARSRAGE_target_Cloud";
	lightpresetname = "JUSTWHITE";
	sfxid = "MFX_Barriere_Shoot";
	sfxisambient = 1;
};

instance SPELLFX_BELIARSRAGE_TARGET_CLOUD(CFX_BASE_PROTO)
{
	visname_s = "MFX_BELIARSRAGE_TARGET";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0.01;
};

instance SPELLFX_BELIARSRAGE_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_BeliarWeap";
	sfxisambient = 1;
};

instance SPELLFX_LIGHT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Light_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxcreate_s = "spellFX_Light_ACTIVE";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_LIGHT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_LIGHT_ACTIVE(CFX_BASE_PROTO)
{
	visname_s = "";
	visalpha = 1;
	emtrjmode_s = "FOLLOW TARGET";
	emtrjeasevel = 0;
	emtrjoriginnode = "BIP01 Head";
	emtrjloopmode_s = "HALT";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
	emtrjtargetrange = 1.2;
	emtrjtargetelev = 89;
	lightpresetname = "JUSTWHITE";
};

instance SPELLFX_LIGHT_ACTIVE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_LIGHT_ACTIVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_LIGHT_ACTIVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Light_ORIGIN";
	lightrange = 1000;
	sfxid = "MFX_Light_CAST";
	sfxisambient = 1;
	emtrjeasevel = 1400;
};

instance SPELLFX_PALLIGHT(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalLight_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxcreate_s = "spellFX_PalLight_ACTIVE";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_PALLIGHT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_PALLIGHT_ACTIVE(CFX_BASE_PROTO)
{
	visname_s = "";
	visalpha = 1;
	emtrjmode_s = "FOLLOW TARGET";
	emtrjeasevel = 0;
	emtrjoriginnode = "BIP01 Head";
	emtrjloopmode_s = "HALT";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
	emtrjtargetrange = 1.2;
	emtrjtargetelev = 89;
	lightpresetname = "JUSTWHITE";
};

instance SPELLFX_PALLIGHT_ACTIVE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_PALLIGHT_ACTIVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_PALLIGHT_ACTIVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_PalLight_ORIGIN_SMALL";
	lightrange = 1000;
	sfxid = "MFX_Light_CAST";
	sfxisambient = 1;
	emtrjeasevel = 1400;
};

instance SPELLFX_FIREBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Firebolt_COLLIDEFX";
	emfxcolldyn_s = "spellFX_Firebolt_COLLIDEDYNFX";
	emfxcolldynperc_s = "VOB_MAGICBURN";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	lightpresetname = "FIRESMALL";
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
};

instance SPELLFX_FIREBOLT_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_FIREBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firebolt_INIT";
	lightrange = 0.001;
};

instance SPELLFX_FIREBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "mfx_firebolt_cast";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "Torch_Enlight";
	lightrange = 100;
	emcheckcollision = 1;
};

instance SPELLFX_FIREBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	visname_s = "";
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	sfxid = "TORCH_ENLIGHT";
};

instance SPELLFX_FIREBOLT_COLLIDEFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIREBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_CHARGEFIREBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_CAST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_ChargeFireball_COLLIDE";
	emfxcolldyn_s = "spellFX_ChargeFireball_COLLIDEDYNFX";
	emfxcolldynperc_s = "vob_magicburn";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 30;
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_CHARGEFIREBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_CHARGEFIREBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_CHARGEFIREBALL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_ChargeFireball_InVEST_BLAST1";
	visname_s = "MFX_ChargeFB_CAST_L2";
	lightrange = 150;
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEFIREBALL_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_ChargeFireball_InVEST_BLAST2";
	visname_s = "MFX_ChargeFB_CAST_L3";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEFIREBALL_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_ChargeFireball_InVEST_BLAST3";
	visname_s = "MFX_ChargeFB_CAST_L4";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEFIREBALL_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_ChargeFireball_InVEST_BLAST4";
	visname_s = "MFX_ChargeFB_CAST_L5";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEFIREBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_CHARGEFIREBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_CHARGEFIREBALL_INVEST_BLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_INVESTBLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
	visalpha = 0.3;
};

instance SPELLFX_CHARGEFIREBALL_INVEST_BLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_INVESTBLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
	visalpha = 0.5;
};

instance SPELLFX_CHARGEFIREBALL_INVEST_BLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_INVESTBLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
	visalpha = 0.8;
};

instance SPELLFX_CHARGEFIREBALL_INVEST_BLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_INVESTBLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
	visalpha = 1;
};

instance SPELLFX_CHARGEFIREBALL_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ChargeFB_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDE_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide";
	sfxid = "MFX_Fireball_Collide2";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDE_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDE_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide";
	sfxid = "MFX_Fireball_Collide4";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDEDYNFX_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDEDYNFX_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide2";
	sfxid = "MFX_Fireball_Collide2";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDEDYNFX_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide3";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_CHARGEFIREBALL_COLLIDEDYNFX_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide4";
	sfxid = "MFX_Fireball_Collide4";
};

instance SPELLFX_INSTANTFIREBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_InstantFireball_COLLIDE";
	emfxcolldyn_s = "spellFX_InstantFireball_COLLIDEDYNFX";
	emfxcolldynperc_s = "VOB_MAGICBURN";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_INSTANTFIREBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_INSTANTFIREBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_INSTANTFIREBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	visname_s = "MFX_IFB_PFXTRAIL";
	emtrjmode_s = "TARGET";
	emselfrotvel_s = "100 100 100";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcreatefxid = "spellFX_InstantFireball_FIRECLOUD";
	emcheckcollision = 1;
};

instance SPELLFX_INSTANTFIREBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_INSTANTFIREBALL_FIRECLOUD(CFX_BASE_PROTO)
{
	emtrjeasevel = 1400;
	visname_s = "MFX_IFB_CAST";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 2;
	emactioncolldyn_s = "COLLIDE";
	emactioncollstat_s = "COLLIDE";
};

instance SPELLFX_INSTANTFIREBALL_FIRECLOUD_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_INSTANTFIREBALL_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_INSTANTFIREBALL_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_INSTANTFIREBALL_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_INSTANTFIREBALL_COLLIDEDYNFX_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_FIRESTORM(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireStorm_Init";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Firestorm_SPREAD";
	emfxcolldyn_s = "spellFX_Firestorm_SPREAD";
	emfxcolldynperc_s = "vob_magicburn";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emfxinvestorigin_s = "spellFX_Firestorm_INVESTSOUND";
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIRESTORM_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_FIRESTORM_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_FIRESTORM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST1";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST2";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST3";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	lightrange = 250;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST4";
};

instance SPELLFX_FIRESTORM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firestorm_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Firestorm_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
	lightrange = 100;
};

instance SPELLFX_FIRESTORM_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_FIRESTORM_INVESTSOUND(CFX_BASE_PROTO)
{
	visname_s = "simpleglow.tga";
	visalpha = 0.01;
	sfxid = "MFX_Firestorm_Invest";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST1";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST2";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST3";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST4";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_SPREAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_SPREAD_SMALL";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "CREATE CREATEQUAD";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_ChargeFireball_COLLIDEDYNFX";
	emfxcolldynperc_s = "vob_magicburn";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 1;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
	emfxcreate_s = "spellFX_Firestorm_COLLIDE";
	sfxid = "MFX_FIrestorm_Collide";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_SPREAD_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_FIRESTORM_SPREAD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
};

instance SPELLFX_FIRESTORM_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide3";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_PYROKINESIS(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireStorm_Init";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Pyrokinesis_SPREAD";
	emfxcolldyn_s = "spellFX_Pyrokinesis_SPREAD";
	emfxcolldynperc_s = "vob_magicburn";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emfxinvestorigin_s = "spellFX_Pyrokinesis_INVESTSOUND";
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_PYROKINESIS_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_PYROKINESIS_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_PYROKINESIS_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	emcreatefxid = "spellFX_Pyrokinesis_INVESTBLAST1";
};

instance SPELLFX_PYROKINESIS_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
	emcreatefxid = "spellFX_Pyrokinesis_INVESTBLAST2";
};

instance SPELLFX_PYROKINESIS_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "spellFX_Pyrokinesis_INVESTBLAST3";
};

instance SPELLFX_PYROKINESIS_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	lightrange = 250;
	emcreatefxid = "spellFX_Pyrokinesis_INVESTBLAST4";
};

instance SPELLFX_PYROKINESIS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firestorm_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Firestorm_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
	lightrange = 150;
};

instance SPELLFX_PYROKINESIS_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_PYROKINESIS_INVESTSOUND(CFX_BASE_PROTO)
{
	visname_s = "simpleglow.tga";
	visalpha = 0.01;
	sfxid = "MFX_Firestorm_Invest";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_INVESTBLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST1";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_INVESTBLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST2";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_INVESTBLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST3";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_INVESTBLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST4";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_SPREAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_SPREAD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "CREATE CREATEQUAD";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_ChargeFireball_COLLIDEDYNFX";
	emfxcolldynperc_s = "vob_magicburn";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 1;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
	emfxcreate_s = "spellFX_Firestorm_COLLIDE";
	sfxid = "MFX_FIrestorm_Collide";
	sfxisambient = 1;
};

instance SPELLFX_PYROKINESIS_SPREAD_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_PYROKINESIS_SPREAD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
};

instance SPELLFX_FIRERAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firerain_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "spellFX_FireRAin_INVESTGLOW";
};

instance SPELLFX_FIRERAIN_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_FireRain_RAIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_FIRERAIN_RAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireRain_Rain";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_ChargeFireball_COLLIDEDYNFX";
	emfxcolldynperc_s = "vob_magicburn";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "CATACLYSM";
	sfxid = "MFX_Firerain_rain";
	sfxisambient = 1;
};

instance SPELLFX_FIRERAIN_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_FIRERAIN_INVESTGLOW(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireRain_INVESTGLOW";
	emtrjoriginnode = "BIP01";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "REDAMBIENCE";
	sfxid = "MFX_Firerain_INVEST";
	sfxisambient = 1;
	emfxcreate_s = "FX_EarthQuake";
};

instance SPELLFX_TELEPORT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Teleport_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxinvestorigin_s = "spellFX_Teleport_ORIGIN";
	lightpresetname = "AURA";
};

instance SPELLFX_TELEPORT_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.1;
};

instance SPELLFX_TELEPORT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.1;
};

instance SPELLFX_TELEPORT_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_TELEPORT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Teleport_CAST";
	pfx_ppsisloopingchg = 1;
	lightrange = 200;
};

instance SPELLFX_TELEPORT_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_INVEST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emfxcreate_s = "spellFX_Teleport_Ring";
	sfxid = "MFX_teleport_invest";
	sfxisambient = 1;
};

instance SPELLFX_TELEPORT_RING(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_RING";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_TELEPORT_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_CAST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_teleport_Cast";
	sfxisambient = 1;
	emtrjmode_s = "FIXED";
};

instance SPELLFX_PALHEAL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
};

instance SPELLFX_PALHEAL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "spellFX_Heal_ORIGIN";
};

instance SPELLFX_PALHEAL_START(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_Start";
	sfxid = "MFX_Heal_CAST";
	sfxisambient = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 R FOOT";
};

instance SPELLFX_PALHEAL_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_HEAVENLIGHT";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emfxcreate_s = "spellFX_PalHeal_START";
	emtrjmode_s = "FIXED";
	lightpresetname = "AURA";
};

instance SPELLFX_PALHEAL_ORIGIN_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_PALHEAL_ORIGIN_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
};

instance SPELLFX_HEAL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
};

instance SPELLFX_HEAL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_HEAL_CAST";
	emcreatefxid = "spellFX_Heal_LEFTHAND";
};

instance SPELLFX_HEAL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "spellFX_Heal_ORIGIN";
};

instance SPELLFX_HEAL_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_HEAVENLIGHT";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_HEAL_CAST";
	sfxisambient = 1;
};

instance SPELLFX_HEAL_LEFTHAND(CFX_BASE_PROTO)
{
	visname_s = "MFX_HEAL_CAST";
	emtrjoriginnode = "ZS_LEFTHAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "AURA";
};

instance SPELLFX_HEAL_LEFTHAND_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_HEAL_LEFTHAND_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 150;
};

instance SPELLFX_TRANSFORM(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 5000;
};

instance SPELLFX_TRANSFORM_KEY_INVEST_0(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Transform_ORIGIN";
};

instance SPELLFX_TRANSFORM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Transform_ORIGIN";
};

instance SPELLFX_TRANSFORM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "spellFX_Transform_BLEND";
};

instance SPELLFX_TRANSFORM_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_ORIGIN";
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	emselfrotvel_s = "0 0 50";
};

instance SPELLFX_TRANSFORM_BLEND(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_BLEND";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
	sfxid = "MFX_Transform_Cast";
	sfxisambient = 1;
};

instance SPELLFX_LIGHTNING(CFX_BASE_PROTO)
{
	visname_s = "MFX_Lightning_Origin";
	vissize_s = "40 40";
	visalphablendfunc_s = "ADD";
	vistexanifps = 17;
	vistexaniislooping = 1;
	emtrjmode_s = "FIXED";
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 20;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "PINGPONG";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.05;
	emselfrotvel_s = "0 0 50";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjkeydistvar = 2;
	emtrjeasevel = 150;
};

instance SPELLFX_LIGHTNING_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Lightning_Origin";
};

instance SPELLFX_LIGHTNING_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "Lightning_Single.ltn";
	emtrjmode_s = "TARGET LINE RANDOM";
	emtrjeasevel = 3000;
};

instance SPELLFX_LIGHTNING_KEY_CAST(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_LIGHTNINGFLASH(CFX_BASE_PROTO)
{
	visname_s = "MFX_Lightning_Origin";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcolldyn_s = "spellFX_LightningFlash_HEAVENSRAGE";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	lightpresetname = "AURA";
};

instance SPELLFX_LIGHTNINGFLASH_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_LIGHTNINGFLASH_KEY_INVEST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_LIGHTNINGFLASH_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_HEAVENSRAGE_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 2000;
	sfxid = "MFX_Thunderball_Collide3";
	lightrange = 100;
	emcheckcollision = 1;
};

instance SPELLFX_LIGHTNINGFLASH_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_LIGHTNINGFLASH_HEAVENSRAGE(CFX_BASE_PROTO)
{
	visname_s = "MFX_HEAVENSRAGE_FLASH";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sendassessmagic = 1;
	emfxcreate_s = "spellFX_LightningFlash_target_CLOUD";
	sfxid = "MFX_Lightning_ORIGIN";
	sfxisambient = 1;
};

instance SPELLFX_LIGHTNINGFLASH_TARGET_CLOUD(CFX_BASE_PROTO)
{
	visname_s = "MFX_HEAVENSRAGE_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 0.01;
};

instance SPELLFX_ZAP(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icebolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Zap_COLLIDE";
	emfxcolldyn_s = "spellFX_Zap_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_ZAP_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icebolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_ZAP_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_HEAVENSRAGE_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 2000;
	sfxid = "MFX_Thunderball_Collide3";
	emcheckcollision = 1;
};

instance SPELLFX_ZAP_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_ZAP_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_ZAP_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
	sendassessmagic = 1;
};

instance SPELLFX_PALHOLYBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_PalHolyBolt_COLLIDE";
	emfxcolldyn_s = "spellFX_PalHolyBolt_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_PALHOLYBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_PalHolyBolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_PALHOLYBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_PalHolyBolt_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1600;
	sfxid = "MFX_Thunderbolt_Cast";
	emcheckcollision = 1;
};

instance SPELLFX_PALHOLYBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_PALHOLYBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_PALHOLYBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_ICEBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icebolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Icebolt_COLLIDE";
	emfxcolldyn_s = "spellFX_Icebolt_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_ICEBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icebolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_ICEBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icebolt_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "mfx_thunderbolt_cast";
	emcheckcollision = 1;
};

instance SPELLFX_ICEBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_ICEBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_ICEBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
	sendassessmagic = 1;
};

instance SPELLFX_CHARGEZAP(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_chargezap_COLLIDE";
	emfxcolldyn_s = "spellFX_chargezap_COLLIDE";
	emfxcolldynperc_s = "spellFX_Thunderspell_SENDPERCEPTION";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "AURA";
};

instance SPELLFX_CHARGEZAP_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_CHARGEZAP_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_CHARGEZAP_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST";
	emcreatefxid = "spellFX_chargezap_InVEST_BLAST1";
	lightrange = 50;
	sfxid = "MFX_Thunderball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEZAP_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L2";
	emcreatefxid = "spellFX_chargezap_InVEST_BLAST2";
	sfxid = "MFX_Thunderball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEZAP_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L3";
	emcreatefxid = "spellFX_chargezap_InVEST_BLAST3";
	sfxid = "MFX_Thunderball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEZAP_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L4";
	emcreatefxid = "spellFX_chargezap_InVEST_BLAST4";
	sfxid = "MFX_Thunderball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_CHARGEZAP_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	visname_s = "MFX_Thunderball_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Thunderball_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_CHARGEZAP_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_CHARGEZAP_INVEST_BLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest1";
	sfxisambient = 1;
	visalpha = 0.3;
};

instance SPELLFX_CHARGEZAP_INVEST_BLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest2";
	sfxisambient = 1;
	visalpha = 0.5;
};

instance SPELLFX_CHARGEZAP_INVEST_BLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest3";
	sfxisambient = 1;
	visalpha = 0.8;
};

instance SPELLFX_CHARGEZAP_INVEST_BLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest4";
	sfxisambient = 1;
	visalpha = 1;
};

instance SPELLFX_CHARGEZAP_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_CHARGEZAP_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide1";
	sfxid = "MFX_Thunderball_Collide1";
};

instance SPELLFX_CHARGEZAP_COLLIDE_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide2";
	sfxid = "MFX_Thunderball_Collide2";
};

instance SPELLFX_CHARGEZAP_COLLIDE_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide3";
	sfxid = "MFX_Thunderball_Collide3";
};

instance SPELLFX_CHARGEZAP_COLLIDE_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide4";
	sfxid = "MFX_Thunderball_Collide4";
};

instance SPELLFX_ICECUBE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icecube_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_IceCube_COLLIDE";
	emfxcolldynperc_s = "spellFX_Icespell_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emfxinvestorigin_s = "spellFX_Icespell_Invest";
	lightpresetname = "AURA";
};

instance SPELLFX_ICECUBE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICECUBE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icecube_INIT";
	lightrange = 0.01;
	scaleduration = 0.5;
};

instance SPELLFX_ICECUBE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_ICECUBE_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1000;
	emcheckcollision = 1;
	sfxid = "MFX_Icecube_cast";
	sfxisambient = 1;
	lightrange = 100;
};

instance SPELLFX_ICECUBE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_ICECUBE_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ICESPELL_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_ICECUBE_COLLIDE";
};

instance SPELLFX_ICESPELL_INVEST(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_ICECUBE_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_ICEWAVE(CFX_BASE_PROTO)
{
	visname_s = "MFX_IceCUBE_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "spellFX_Icespell_Invest";
};

instance SPELLFX_ICEWAVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_IceCUBE_INIT";
};

instance SPELLFX_ICEWAVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Icewave_WAVE";
	pfx_ppsisloopingchg = 1;
	sfxid = "MFX_Icewave_Cast";
	sfxisambient = 1;
};

instance SPELLFX_ICEWAVE_WAVE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icewave_WAVE";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldynperc_s = "spellFX_Icespell_SENDPERCEPTION";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "WHITEBLEND";
};

instance SPELLFX_ICEWAVE_WAVE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICEWAVE_WAVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICEWAVE_WAVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_ICEWAVE_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_SUMMONCREATURE_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_Origin";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 0;
	sfxid = "MFX_Spawn_Cast";
	sfxisambient = 1;
	emfxcreate_s = "FX_EarthQuake";
};

instance SPELLFX_SUMMONCREATURE_LEFTHAND(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT2";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "Bip01 L Hand";
};

instance SPELLFX_SUMMONGOLEM(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONGOLEM_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGOLEM_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGOLEM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONGOLEM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONSKELETON(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONSKELETON_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONSKELETON_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONSKELETON_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONSKELETON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONGOBLINSKELETON(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONGOBLINSKELETON_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGOBLINSKELETON_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGOBLINSKELETON_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONGOBLINSKELETON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONWOLF(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONWOLF_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONWOLF_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONWOLF_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONWOLF_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONDEMON(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONDEMON_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONDEMON_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONDEMON_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONDEMON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONGUARDIAN(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONGUARDIAN_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGUARDIAN_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONGUARDIAN_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONGUARDIAN_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONZOMBIE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONZOMBIE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONZOMBIE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONZOMBIE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONZOMBIE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SUMMONMUD(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_SUMMONMUD_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONMUD_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SUMMONMUD_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SUMMONMUD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_ARMYOFDARKNESS(CFX_BASE_PROTO)
{
	visname_s = "MFX_ArmyOfDarkness_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_ARMYOFDARKNESS_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "spellFX_SummonCreature_LEFTHAND";
};

instance SPELLFX_ARMYOFDARKNESS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_SummonCreature_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_MASSDEATH(CFX_BASE_PROTO)
{
	visname_s = "MFX_MassDeath_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxcreatedowntrj = 0;
};

instance SPELLFX_MASSDEATH_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_MassDeath_INIT";
};

instance SPELLFX_MASSDEATH_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_MASSDEATH_RIGHTHAND";
	emcreatefxid = "spellFX_MassDeath_LEFTHAND";
};

instance SPELLFX_MASSDEATH_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_MassDeath_EXPLOSION";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_MASSDEATH_EXPLOSION(CFX_BASE_PROTO)
{
	visname_s = "MFX_MASSDEATH_EXPLOSION";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "Bip01 L Hand";
	emfxcreate_s = "spellFX_MassDeath_GROUND";
};

instance SPELLFX_MASSDEATH_GROUND(CFX_BASE_PROTO)
{
	visname_s = "MFX_MassDeath_CAST";
	emtrjoriginnode = "BIP01 R Foot";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_MassDeath_COLLIDEDYNFX";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "REDAMBIENCE";
	sfxid = "MFX_Massdeath_Cast";
	sfxisambient = 1;
};

instance SPELLFX_MASSDEATH_LEFTHAND(CFX_BASE_PROTO)
{
	visname_s = "MFX_MASSDEATH_LEFTHAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "Bip01 L Hand";
	emfxcreate_s = "FX_EARTHQUAKE";
};

instance SPELLFX_MASSDEATH_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_MASSDEATH_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Massdeath_TARGET";
	emtrjoriginnode = "BIP01";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_MassdeatH_Target";
};

instance SPELLFX_DESTROYUNDEAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_DestroyUndead_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Destroyundead_COLLIDE";
	emfxcolldyn_s = "spellFX_Destroyundead_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_DESTROYUNDEAD_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_DestroyUndead_INIT";
};

instance SPELLFX_DESTROYUNDEAD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_DestroyUndead_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	sfxid = "MFX_DestroyUndead_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_DESTROYUNDEAD_COLLIDE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_DESTROYUNDEAD_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_PALREPELEVIL(CFX_BASE_PROTO)
{
	visname_s = "MFX_REPELEVIL_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_PalRepelEvil_COLLIDE";
	emfxcolldyn_s = "spellFX_PalRepelEvil_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_PALREPELEVIL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_PALREPELEVIL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	sfxid = "MFX_DestroyUndead_Cast";
	emcreatefxid = "spellFX_RepelEvil_TRAIL";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_PALREPELEVIL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.0001;
};

instance SPELLFX_REPELEVIL_TRAIL(CFX_BASE_PROTO)
{
	emtrjeasevel = 800;
	visname_s = "MFX_REPELEVIL_TRAIL";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emcheckcollision = 1;
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "COLLIDE";
};

instance SPELLFX_REPELEVIL_TRAIL_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_PALREPELEVIL_COLLIDE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_RepelEvil_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_PALREPELEVIL_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_RepelEvil_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_MASTEROFDISASTER(CFX_BASE_PROTO)
{
	visname_s = "MFX_MasterOfDisaster_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_MasterOfDisaster_COLLIDE";
	emfxcolldyn_s = "spellFX_MasterOfDisaster_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_MASTEROFDISASTER_KEY_INIT(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_MASTEROFDISASTER_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emtrjmode_s = "TARGET";
	emtrjeasevel = 2500;
	sfxid = "MFX_DestroyUndead_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_MASTEROFDISASTER_TRAIL(CFX_BASE_PROTO)
{
	emtrjeasevel = 800;
	visname_s = "MFX_MasterOfDisaster_TRAIL";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emcheckcollision = 1;
	emactioncollstat_s = "COLLIDE";
	emactioncolldyn_s = "COLLIDE";
};

instance SPELLFX_MASTEROFDISASTER_TRAIL_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_MASTEROFDISASTER_COLLIDE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_MasterOfDisaster_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_MASTEROFDISASTER_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_MasterOfDisaster_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_PALDESTROYEVIL(CFX_BASE_PROTO)
{
	visname_s = "MFX_DestroyUndead_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_PalDestroyEvil_COLLIDE";
	emfxcolldyn_s = "spellFX_PalDestroyEvil_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_PALDESTROYEVIL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_PALDESTROYEVIL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_DestroyUndead_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	sfxid = "MFX_DestroyUndead_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_PALDESTROYEVIL_COLLIDE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_PALDESTROYEVIL_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INIT";
	vissize_s = "1 1";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 7;
	emtrjnumkeysvar = 3;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 200000;
	emtrjtargetrange = 100;
	emtrjtargetelev = 1;
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_Windfist_COLLIDEDYNFX";
	emfxinvestorigin_s = "spellFX_Windfist_Invest";
};

instance SPELLFX_WINDFIST_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 0;
};

instance SPELLFX_WINDFIST_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_WINDFIST_COLLISIONDUMMY";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 2500;
	emcheckcollision = 1;
	emcreatefxid = "spellFX_WINDFIST_CAST";
};

instance SPELLFX_WINDFIST_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INVEST";
	sfxid = "MFX_WINDFIST_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_INVESTBLAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INVEST_BLAST";
	sfxid = "MFX_WINDFIST_INVESTBLAST";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_Cast";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	sfxid = "MFX_Windfist_Cast";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_COLLIDE";
	sendassessmagic = 1;
};

instance SPELLFX_SLEEP(CFX_BASE_PROTO)
{
	visname_s = "MFX_SLEEP_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_SLEEP_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SLEEP_INIT";
};

instance SPELLFX_SLEEP_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SLEEP_ORIGIN";
	emtrjeasevel = 1400;
	sfxid = "MFX_Sleep_Cast";
};

instance SPELLFX_SLEEP_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_SLEEP_ORIGIN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_SLEEP_TARGET(CFX_BASE_PROTO)
{
	lightpresetname = "AURA";
	visname_s = "MFX_SLEEP_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_CHARM(CFX_BASE_PROTO)
{
	visname_s = "MFX_CHARM_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
	emfxinvesttarget_s = "spellFX_Charm_TARGET";
};

instance SPELLFX_CHARM_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_CHARM_INIT";
};

instance SPELLFX_CHARM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_CHARM_ORIGIN";
	sfxid = "MFX_CHARM_CAST";
	sfxisambient = 1;
	emtrjeasevel = 1400;
};

instance SPELLFX_CHARM_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_CHARM_ORIGIN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_CHARM_TARGET(CFX_BASE_PROTO)
{
	lightpresetname = "AURA";
	visname_s = "MFX_CHARM_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_FEAR(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_INIT";
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 10000;
};

instance SPELLFX_FEAR_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0;
};

instance SPELLFX_FEAR_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_FEAR_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Fear_GROUND";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_FEAR_WINGS(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_WINGS";
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 10000;
	emfxcreate_s = "FX_Earthquake";
};

instance SPELLFX_FEAR_WINGS2(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_WINGS2";
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 10000;
	emfxcreate_s = "spellFX_Fear_GROUND";
};

instance SPELLFX_FEAR_GROUND(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_ORIGIN";
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 10000;
	sfxid = "MFX_FEAR_CAST";
	sfxisambient = 1;
};

instance SPELLFX_FEAR_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "";
	sfxid = "HAMMER";
	sendassessmagic = 1;
};

instance SPELLFX_BREATHOFDEATH(CFX_BASE_PROTO)
{
	visname_s = "MFX_BreathOfDeath_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_BreathOfDeath_Target";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 30;
};

instance SPELLFX_BREATHOFDEATH_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_BREATHOFDEATH_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "spellFX_BreathOfDeath_CAST";
};

instance SPELLFX_BREATHOFDEATH_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_INVEST";
	sfxid = "MFX_BREATHOFDEATH_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_BREATHOFDEATH_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_BreathOfDeath_Cast";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_BreathOfDeath_Target";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 30;
	sfxid = "MFX_BreathOfDeath_Cast";
	sfxisambient = 1;
};

instance SPELLFX_BREATHOFDEATH_CAST_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	emcheckcollision = 1;
};

instance SPELLFX_BREATHOFDEATH_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_COLLIDE";
	sfxid = "MFX_BREATHOFDEATH_TARGET";
	sfxisambient = 1;
};

instance SPELLFX_SHRINK(CFX_BASE_PROTO)
{
	visname_s = "MFX_SHRINK_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01";
	emtrjnumkeys = 5;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 15;
	emtrjangleheadvar = 0;
	emtrjeasefunc_s = "LINEAR";
	emtrjloopmode_s = "HALT";
	emtrjdynupdatedelay = 0;
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	lightpresetname = "AURA";
	emfxinvestorigin_s = "spellFX_SHRINK_ORIGIN";
};

instance SPELLFX_SHRINK_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.01;
	lightrange = 0.01;
};

instance SPELLFX_SHRINK_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.01;
	lightrange = 0.01;
};

instance SPELLFX_SHRINK_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emtrjmode_s = "TARGET LINE";
	visname_s = "MFX_SHRINK_TARGET";
	emtrjeasevel = 6000;
	lightrange = 100;
	sfxid = "MFX_SHRINK_CAST";
	sfxisambient = 1;
};

instance SPELLFX_SHRINK_ORIGIN(CFX_BASE_PROTO)
{
	emfxcreatedowntrj = 0;
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_SHRINK_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_CONCUSSIONBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Concussionbolt_COLLIDE";
	emfxcolldyn_s = "spellFX_Concussionbolt_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_CONCUSSIONBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_PalHolyBolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_CONCUSSIONBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_PalHolyBolt_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1600;
	sfxid = "MFX_PalHolyBolt_Cast";
	emcheckcollision = 1;
};

instance SPELLFX_CONCUSSIONBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_CONCUSSIONBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_CONCUSSIONBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_PalHolyBolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_DEATHBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Deathbolt_COLLIDE";
	emfxcolldyn_s = "spellFX_Deathbolt_COLLIDEDYNFX";
	emfxcolldynperc_s = "VOB_MAGICBURN";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBOLT_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_DEATHBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_DEATHBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	visname_s = "MFX_IFB_PFXTRAIL";
	emtrjmode_s = "TARGET";
	emselfrotvel_s = "100 100 100";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcreatefxid = "spellFX_InstantFireball_FIRECLOUD";
	emcheckcollision = 1;
};

instance SPELLFX_DEATHBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_DEATHBOLT_FIRECLOUD(CFX_BASE_PROTO)
{
	emtrjeasevel = 1400;
	visname_s = "MFX_IFB_CAST";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 2;
	emactioncolldyn_s = "COLLIDE";
	emactioncollstat_s = "COLLIDE";
};

instance SPELLFX_DEATHBOLT_FIRECLOUD_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_DEATHBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBOLT_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_DEATHBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBOLT_COLLIDEDYNFX_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_DEATHBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Deathball_COLLIDE";
	emfxcolldyn_s = "spellFX_Deathball_COLLIDEDYNFX";
	emfxcolldynperc_s = "VOB_MAGICBURN";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_DEATHBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_DEATHBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	visname_s = "MFX_IFB_PFXTRAIL";
	emtrjmode_s = "TARGET";
	emselfrotvel_s = "100 100 100";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcreatefxid = "spellFX_InstantFireball_FIRECLOUD";
	emcheckcollision = 1;
};

instance SPELLFX_DEATHBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_DEATHBALL_FIRECLOUD(CFX_BASE_PROTO)
{
	emtrjeasevel = 1400;
	visname_s = "MFX_IFB_CAST";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 2;
	emactioncolldyn_s = "COLLIDE";
	emactioncollstat_s = "COLLIDE";
};

instance SPELLFX_DEATHBALL_FIRECLOUD_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_DEATHBALL_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBALL_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_DEATHBALL_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_DEATHBALL_COLLIDEDYNFX_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance VOB_BURN(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD1";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Firespell_Humanburn";
};

instance VOB_BURN_CHILD1(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R UPPERARM";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD2";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD2(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L UPPERARM";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD3";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD3(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L HAND";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD4";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD4(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R HAND";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD5";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD5(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L FOOT";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD6";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD6(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R FOOT";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "spellFX_Firespell_HUMANSMOKE";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD1";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Firespell_Humanburn";
};

instance VOB_MAGICBURN_CHILD1(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R UPPERARM";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD2";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN_CHILD2(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L UPPERARM";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD3";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN_CHILD3(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L HAND";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD4";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN_CHILD4(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R HAND";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD5";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN_CHILD5(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L FOOT";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "VOB_MAGICBURN_CHILD6";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_MAGICBURN_CHILD6(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R FOOT";
	visname_s = "MFX_MagicFire_HUMANBURN";
	emfxcreate_s = "spellFX_MagicFire_HUMANSMOKE";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	sendassessmagic = 1;
};

instance SPELLFX_MAGICFIRE_HUMANSMOKE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_MagicFire_HUMANSMOKE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESPELL_HUMANSMOKE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_Firespell_HUMANSMOKE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	emadjustshptoorigin = 1;
};

instance SPELLFX_LIGHTNING_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 Head";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Lightning_Target";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD1";
};

instance SPELLFX_THUNDERSPELL_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 Head";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sendassessmagic = 1;
	sfxid = "MFX_Lightning_Target";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD1";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_SENDPERCEPTION_CHILD1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R UPPERARM";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD2";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L UPPERARM";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD3";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L HAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD4";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R HAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD5";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD5(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L FOOT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD6";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD6(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R FOOT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD7";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD7(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L THIGH";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD8";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD8(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R THIGH";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD9";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD9(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L CALF";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD10";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD10(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R CALF";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_SENDPERCEPTION_CHILD11";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD11(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_ICESPELL_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_IceSpell_Target";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sendassessmagic = 1;
	emadjustshptoorigin = 1;
	sfxid = "MFX_Icecube_Target";
};

instance FX_EARTHQUAKE(CFX_BASE_PROTO)
{
	visname_s = "earthquake.eqk";
	userstring[0] = "1000";
	userstring[1] = "5";
	userstring[2] = "5 5 5";
	sfxid = "MFX_EarthQuake";
	sfxisambient = 1;
};

instance CONTROL_LEAVERANGEFX(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "1";
	userstring[1] = "0 100 0 100";
	userstring[2] = "0.5";
};

instance CONTROL_CASTBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "0.5";
	userstring[1] = "255 255 255 255";
	userstring[2] = "0.5";
	emfxlifespan = 0.6;
};

instance TRANSFORM_CASTBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "0.5";
	userstring[1] = "255 0 0 255";
	userstring[2] = "0.5";
	emfxlifespan = 0.6;
};

instance TRANSFORM_NOPLACEFX(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "1";
	userstring[1] = "255 0 0 100";
	userstring[2] = "1.5";
	emfxlifespan = 0.6;
};

instance DEMENTOR_FX(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	emfxcreate_s = "FOV_MORPH1";
	userstring[0] = "100000000000";
	userstring[1] = "0 0 0 100";
	userstring[2] = "0.5";
	userstring[3] = "ScreenFX_Dem_a0";
	userstring[4] = "8";
	visalphablendfunc_s = "BLEND";
	sfxid = "Dementhor_Talk";
	sfxisambient = 1;
};

instance FOV_MORPH1(CFX_BASE_PROTO)
{
	visname_s = "morph.fov";
	userstring[0] = "1.0";
	userstring[1] = "1.0";
	userstring[2] = "90";
	userstring[3] = "67";
};

instance FOV_MORPH2(CFX_BASE_PROTO)
{
	visname_s = "morph.fov";
	userstring[0] = "0.8";
	userstring[1] = "1.0";
	userstring[2] = "120";
	userstring[3] = "90";
};

instance SLOW_MOTION(CFX_BASE_PROTO)
{
	visname_s = "time.slw";
	userstring[0] = "0.5";
	userstring[1] = "1.0";
	emfxcreate_s = "FOV_MORPH2";
	emfxlifespan = 15;
	emfxtriggerdelay = 3;
};

instance FOCUS_HIGHLIGHT(CFX_BASE_PROTO)
{
	visname_s = "FOCUS_HIGHLIGHT.TGA";
	vissize_s = "100 100";
	emadjustshptoorigin = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
};

instance SLOW_TIME(CFX_BASE_PROTO)
{
	visname_s = "time.slw";
	userstring[0] = "0.5";
	userstring[1] = "0.5";
	emfxlifespan = 30;
	emfxtriggerdelay = 6;
	emfxcreate_s = "SLOW_TIME_CHILD";
	emtrjoriginnode = "BIP01";
};

instance SLOW_TIME_CHILD(CFX_BASE_PROTO)
{
	visname_s = "SMOKE_JOINT_SLOW_TIME";
	emfxtriggerdelay = 6;
	sfxid = "MFX_Telekinesis_StartInvest";
	sfxisambient = 1;
	emfxcreate_s = "SLOW_TIME_CHILD2";
};

instance SLOW_TIME_CHILD2(CFX_BASE_PROTO)
{
	emfxtriggerdelay = 6;
	emfxlifespan = 30;
	visname_s = "morph.fov";
	userstring[0] = "0.8";
	userstring[1] = "1.0";
	userstring[2] = "120";
	userstring[3] = "90";
};

instance BLACK_SCREEN(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "100000000000";
	userstring[1] = "0 0 0 255";
	userstring[2] = "0";
	visalphablendfunc_s = "BLEND";
	emfxlifespan = 2;
};

instance SLEEP_BLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "100000000000";
	userstring[1] = "0 0 0 255";
	userstring[2] = "0";
	visalphablendfunc_s = "BLEND";
	emfxlifespan = 2;
};

instance SPELLFX_FIREARMOR(CFX_BASE_PROTO)
{
	visname_s = "FIRE_MODEL_KAIRO";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "=";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreate_s = "SPELLFX_FIREARMOR_SMOKE";
};

instance SPELLFX_FIREARMOR_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_FIREARMOR_SMOKE(CFX_BASE_PROTO)
{
	visname_s = "SMOKE_MODEL_KAIRO";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "=";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIREARMOR_SMOKE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_FIRESWORD(CFX_BASE_PROTO)
{
	visname_s = "FIRE_SWORD";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESWORDBLACK(CFX_BASE_PROTO)
{
	visname_s = "FIRE_SWORDBLACK";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESWORDBLACK_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
};

instance SPELLFX_FIRESWORD_ATTACK(CFX_BASE_PROTO)
{
	visname_s = "FIRE_SWORD_ATTACK";
	emtrjoriginnode = "ZS_RIGHTHAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESWORD_HIT(CFX_BASE_PROTO)
{
	visname_s = "FIRE_SWORD_HIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESWORD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_FIRESWORD_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "FIRE_SWORD";
	lightrange = 100;
	pfx_ppsvalue = 100;
};

instance SPELLFX_FIRESWORD_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "FIRE_SWORD";
	lightrange = 300;
	pfx_ppsvalue = 150;
};

instance SPELLFX_FIRESWORD_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "SPELLFX_FIRESWORD_ATTACK";
	lightrange = 400;
};

instance SPELLFX_FIRESWORD_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "SPELLFX_FIRESWORD_HIT";
	lightrange = 600;
	pfx_ppsvalue = 300;
};

instance SPELLFX_FIRESWORD_KEY_INVEST_5(C_PARTICLEFXEMITKEY)
{
	visname_s = "FIRE_SWORD";
	lightrange = 100;
	pfx_ppsvalue = 150;
};

instance SPELLFX_MAGESTAFF1(CFX_BASE_PROTO)
{
	visname_s = "MAGESTAFF1";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_MAGESTAFF2(CFX_BASE_PROTO)
{
	visname_s = "MAGESTAFF2";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_MAGESTAFF3(CFX_BASE_PROTO)
{
	visname_s = "MAGESTAFF3";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_MAGESTAFF4(CFX_BASE_PROTO)
{
	visname_s = "MAGESTAFF4";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_MAGESTAFF5(CFX_BASE_PROTO)
{
	visname_s = "MAGESTAFF5";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emadjustshptoorigin = 1;
};

instance SPELLFX_BOW(CFX_BASE_PROTO)
{
	visname_s = "MAGIC_BOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIREBOW(CFX_BASE_PROTO)
{
	visname_s = "FIRE_BOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_ARROW(CFX_BASE_PROTO)
{
	visname_s = "MAGIC_ARROW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	lightpresetname = "AURA";
};

instance SPELLFX_ARROW_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_ARROW_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	lightrange = 300;
};

instance SPELLFX_ARROW_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_FIREARROW(CFX_BASE_PROTO)
{
	visname_s = "FIRE_ARROW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIREARROW_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_FIREARROW_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	lightrange = 300;
};

instance SPELLFX_FIREARROW_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_CROSSBOW(CFX_BASE_PROTO)
{
	visname_s = "MAGIC_CROSSBOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_BOLT(CFX_BASE_PROTO)
{
	visname_s = "MAGIC_BOLT";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	lightpresetname = "AURA";
};

instance SPELLFX_BOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
};

instance SPELLFX_ITEMGLIMMER(CFX_BASE_PROTO)
{
	visname_s = "ITEM_GLIMMER";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_MANAPOTION(CFX_BASE_PROTO)
{
	visname_s = "MANA_POTION";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_HEALTHPOTION(CFX_BASE_PROTO)
{
	visname_s = "HEALTH_POTION";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_YELLOWPOTION(CFX_BASE_PROTO)
{
	visname_s = "YELLOW_POTION";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_WEAKGLIMMER(CFX_BASE_PROTO)
{
	visname_s = "WEAK_GLIMMER";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_WEAKGLIMMER_RED(CFX_BASE_PROTO)
{
	visname_s = "WEAK_GLIMMER_RED";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_WEAKGLIMMER_BLUE(CFX_BASE_PROTO)
{
	visname_s = "WEAK_GLIMMER_BLUE";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_WEAKGLIMMER_YELLOW(CFX_BASE_PROTO)
{
	visname_s = "WEAK_GLIMMER_YELLOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_ITEMSTARS(CFX_BASE_PROTO)
{
	visname_s = "ITEM_STARS";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_ITEMSTARS_RED(CFX_BASE_PROTO)
{
	visname_s = "ITEM_STARS_RED";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_ITEMSTARS_BLUE(CFX_BASE_PROTO)
{
	visname_s = "ITEM_STARS_BLUE";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_ITEMSTARS_YELLOW(CFX_BASE_PROTO)
{
	visname_s = "ITEM_STARS_YELLOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_GLOW(CFX_BASE_PROTO)
{
	visname_s = "GOLD_GLOW";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	lightpresetname = "JUSTWHITE";
};

instance SPELLFX_GLOW_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
};

instance SPELLFX_UNDEAD_DRAGON(CFX_BASE_PROTO)
{
	visname_s = "UNDEAD_DRAGON";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "=";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "AURA";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreate_s = "SPELLFX_DRAGONEYE_LEFT";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_DRAGONEYE_LEFT(CFX_BASE_PROTO)
{
	visname_s = "DRAGON_EYE_LEFT";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreate_s = "SPELLFX_DRAGONEYE_RIGHT";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_DRAGONEYE_RIGHT(CFX_BASE_PROTO)
{
	visname_s = "DRAGON_EYE_RIGHT";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreatedowntrj = 1;
};

instance SPELLFX_UNDEAD_DRAGON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_WATERFIST_CAST(CFX_BASE)
{
};

instance SPELLFX_INVISIBLEPROJECTILE(CFX_BASE_PROTO)
{
	emtrjeasevel = 1400;
	visname_s = "MFX_INVISIBLEPROJECTILE";
	visalpha = 1;
	emtrjmode_s = "TARGET";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 2;
	emactioncolldyn_s = "COLLIDE";
	emactioncollstat_s = "COLLIDE";
};

instance SPELLFX_INVISIBLEPROJECTILE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

