
instance DJG_715_Ferros(Npc_Default)
{
	name[0] = "װוננמס";
	guild = GIL_DJG;
	id = 715;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,56,ItMi_Gold,75);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_DJG_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_715;
};


func void Rtn_Start_715()
{
	TA_Stand_Eating(8,0,23,0,"OC_JAN");
	TA_Stand_Eating(23,0,8,0,"OC_JAN");
};

func void Rtn_Train_715()
{
	TA_Sit_Bench(8,0,23,0,"OC_JAN");
	TA_Practice_Sword(23,0,8,0,"OC_TRAIN_03");
};

