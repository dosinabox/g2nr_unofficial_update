
instance PIR_1350_Addon_Francis(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_PIR;
	id = 1350;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert1);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,40,ItKe_Greg_Addon_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1350;
};


func void Rtn_Start_1350()
{
	TA_Sit_Bench(5,0,20,0,"ADW_PIRATECAMP_HUT4_01");
	TA_Sit_Bench(20,0,5,0,"ADW_PIRATECAMP_HUT4_01");
};

func void Rtn_GregIsBack_1350()
{
	TA_Saw(5,0,23,45,"ADW_PIRATECAMP_BEACH_19");
	TA_Sit_Campfire(23,45,5,0,"WP_PIR_05");
};

func void Rtn_Exile_1350()
{
	TA_Stand_WP(5,0,20,0,"ADW_PIRATECAMP_2_CANYON_02");
	TA_Stand_WP(20,0,5,0,"ADW_PIRATECAMP_2_CANYON_02");
};

