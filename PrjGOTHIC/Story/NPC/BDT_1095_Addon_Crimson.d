
instance BDT_1095_Addon_Crimson(Npc_Default)
{
	name[0] = "Кримсон";
	guild = GIL_BDT;
	id = 1095;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Sense);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart10,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_1095;
};


func void Rtn_Start_1095()
{
	TA_Smith_Fire(11,0,14,0,"ADW_MINE_HOEHLE_03");
	TA_Smith_Fire(14,0,11,0,"ADW_MINE_HOEHLE_03");
};

