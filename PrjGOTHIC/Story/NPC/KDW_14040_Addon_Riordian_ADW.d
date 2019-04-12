
instance KDW_14040_Addon_Riordian_ADW(Npc_Default)
{
	name[0] = "Риордиан";
	guild = GIL_KDW;
	id = 14040;
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
	daily_routine = Rtn_Start_14040;
};


func void Rtn_Start_14040()
{
	TA_Study_WP(7,5,7,20,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(7,20,8,25,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(8,25,9,5,"ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(9,5,10,45,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(11,55,12,5,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(12,5,13,20,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(13,20,14,25,"ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(14,25,15,5,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(15,5,16,45,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(17,55,18,5,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(18,5,19,20,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(19,20,20,25,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(20,25,21,5,"ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(21,5,22,0,"ADW_ENTRANCE_PLATEAU_10A");
	TA_Sleep(22,0,7,5,"ADW_ENTRANCE_BUILDING2_05");
};

