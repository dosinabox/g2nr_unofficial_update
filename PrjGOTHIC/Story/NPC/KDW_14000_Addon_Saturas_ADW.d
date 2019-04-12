
instance KDW_14000_Addon_Saturas_ADW(Npc_Default)
{
	name[0] = "Сатурас";
	guild = GIL_KDW;
	id = 14000;
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
	daily_routine = Rtn_PreStart_14000;
};


func void Rtn_PreStart_14000()
{
	TA_Study_WP(8,25,21,35,"ADW_SATURAS_START");
	TA_Study_WP(21,35,8,25,"ADW_SATURAS_START");
};

func void Rtn_Start_14000()
{
	TA_Study_WP(8,25,9,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(9,35,10,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(11,55,12,5,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(12,5,13,15,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(13,15,14,25,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(14,25,15,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(15,35,16,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(17,55,18,5,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Sit_Bench(18,5,19,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(19,15,20,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(20,25,21,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(21,35,22,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(22,45,1,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(1,15,3,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(3,25,5,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(5,35,7,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(7,45,8,25,"ADW_ENTRANCE_BUILDING2_02A");
};

