
instance PIR_1350_Addon_Francis(Npc_Default)
{
	name[0] = "Френсис";
	guild = GIL_PIR;
	id = 1350;
	voice = 13;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert1);
	CreateInvItems(self,ITKE_Greg_ADDON_MIS,1);
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
	TA_Saw(5,0,20,0,"ADW_PIRATECAMP_BEACH_19");
	TA_Saw(20,0,5,0,"ADW_PIRATECAMP_BEACH_19");
};

