
instance KDW_14050_Addon_Merdarion_ADW(Npc_Default)
{
	name[0] = "Мердарион";
	guild = GIL_KDW;
	id = 14050;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart_Nefarius,BodyTex_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_14050;
};


func void Rtn_Start_14050()
{
	TA_Study_WP(6,5,7,15,"ADW_ENTRANCE_01");
	TA_Study_WP(7,15,8,25,"ADW_ENTRANCE_02");
	TA_Study_WP(8,25,9,35,"ADW_ENTRANCE_01");
	TA_Study_WP(9,35,10,45,"ADW_ENTRANCE_02");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_01");
	TA_Study_WP(11,55,12,5,"ADW_ENTRANCE_02");
	TA_Study_WP(12,5,13,15,"ADW_ENTRANCE_01");
	TA_Study_WP(13,15,14,25,"ADW_ENTRANCE_02");
	TA_Study_WP(14,25,15,35,"ADW_ENTRANCE_01");
	TA_Study_WP(15,35,16,45,"ADW_ENTRANCE_02");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_01");
	TA_Study_WP(17,55,18,5,"ADW_ENTRANCE_02");
	TA_Study_WP(18,5,19,15,"ADW_ENTRANCE_01");
	TA_Study_WP(19,15,20,25,"ADW_ENTRANCE_02");
	TA_Study_WP(20,25,21,35,"ADW_ENTRANCE_01");
	TA_Study_WP(21,35,22,45,"ADW_ENTRANCE_02");
	TA_Sleep(22,45,6,5,"ADW_ENTRANCE_BUILDING2_05");
};

