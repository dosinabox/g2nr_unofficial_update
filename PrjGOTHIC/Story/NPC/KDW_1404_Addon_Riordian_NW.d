
instance KDW_1404_Addon_Riordian_NW(Npc_Default)
{
	name[0] = "Риордиан";
	guild = GIL_KDW;
	id = 1404;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Riordian,BodyTex_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1404;
};


func void Rtn_Start_1404()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_34");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_34");
};

func void Rtn_Saturas_1404()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
};

func void Rtn_Ringritual_1404()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
};

func void Rtn_PreRingritual_1404()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
};

func void Rtn_OpenPortal_1404()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_05");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_05");
};

func void Rtn_TOT_1404()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

