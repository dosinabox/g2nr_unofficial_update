
instance KDW_1401_Addon_Cronos_NW(Npc_Default)
{
	name[0] = "������";
	guild = GIL_KDW;
	id = 1401;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NPCIsTrader] = TRUE;
	aivar[AIV_Teeth] = 1;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart_Cronos,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_1401;
};


func void Rtn_PreStart_1401()
{
	TA_Smalltalk(8,0,20,0,"PORTAL");
	TA_Smalltalk(20,0,8,0,"PORTAL");
};

func void Rtn_Start_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
};

func void Rtn_Ringritual_1401()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void Rtn_PreRingritual_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void Rtn_OpenPortal_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
};

func void Rtn_TOT_1401()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

