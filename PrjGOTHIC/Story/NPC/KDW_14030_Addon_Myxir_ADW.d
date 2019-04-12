
instance KDW_14030_Addon_Myxir_ADW(Npc_Default)
{
	name[0] = "Миксир";
	guild = GIL_KDW;
	id = 14030;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_NormalBart_Cronos,BodyTex_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_14030;
};


func void Rtn_Start_14030()
{
	TA_Study_WP(6,50,7,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP(7,15,8,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP(8,40,9,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP(9,50,10,45,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP(11,55,12,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP(12,50,13,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP(13,15,14,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP(14,40,15,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP(15,50,16,45,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP(17,55,18,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP(18,50,19,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP(19,15,20,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP(20,40,21,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP(21,50,22,0,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Smalltalk(22,0,6,50,"ADW_ENTRANCE_BUILDING2_03");
};

func void Rtn_TOT_14030()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"TOT");
	TA_Stand_ArmsCrossed(23,0,8,0,"TOT");
};

