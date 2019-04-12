
instance KDW_14020_Addon_Nefarius_ADW(Npc_Default)
{
	name[0] = "Нефариус";
	guild = GIL_KDW;
	id = 14020;
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
	daily_routine = Rtn_Start_14020;
};


func void Rtn_Start_14020()
{
	TA_Study_WP(6,50,7,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(7,50,8,35,"PORTALTEMPEL");
	TA_Study_WP(8,35,9,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(9,50,10,45,"PORTALTEMPEL");
	TA_Study_WP(10,45,11,15,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(11,15,12,50,"PORTALTEMPEL");
	TA_Study_WP(12,50,13,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(13,50,14,35,"PORTALTEMPEL");
	TA_Study_WP(14,35,15,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(15,50,16,45,"PORTALTEMPEL");
	TA_Study_WP(16,45,17,15,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(17,15,18,50,"PORTALTEMPEL");
	TA_Study_WP(18,50,19,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(19,50,20,35,"PORTALTEMPEL");
	TA_Study_WP(20,35,21,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP(21,50,22,0,"PORTALTEMPEL");
	TA_Smalltalk(22,0,6,50,"ADW_ENTRANCE_BUILDING2_03");
};

