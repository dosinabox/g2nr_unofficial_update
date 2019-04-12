
instance KDW_1400_Addon_Saturas_NW(Npc_Default)
{
	name[0] = "Сатурас";
	guild = GIL_KDW;
	id = 1400;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1400;
};


func void Rtn_Start_1400()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};

func void Rtn_Ringritual_1400()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
};

func void Rtn_PreRingritual_1400()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
};

func void Rtn_OpenPortal_1400()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_01");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_01");
};

func void Rtn_TOT_1400()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

