
instance KDW_1402_Addon_Nefarius_NW(Npc_Default)
{
	name[0] = "Нефариус";
	guild = GIL_KDW;
	id = 1402;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_NormalBart_Nefarius,BodyTex_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1402;
};


func void Rtn_Start_1402()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_09");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_09");
};

func void Rtn_Ringritual_1402()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
};

func void Rtn_PreRingritual_1402()
{
	TA_Stand_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_42");
	TA_Stand_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_42");
};

func void Rtn_OpenPortal_1402()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
};

func void Rtn_TOT_1402()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

