
instance DJG_708_Kurgan(Npc_Default)
{
	name[0] = "������";
	guild = GIL_DJG;
	id = 708;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,34,ItMi_Gold,120);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ImportantGrey,BodyTex_N,ITAR_DJG_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_PreStart_708;
};


func void Rtn_PreStart_708()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_5_4");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_5_4");
};

func void Rtn_Start_708()
{
	TA_Stand_Guarding(8,0,23,0,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
	TA_Stand_Eating(23,0,8,0,"VORPOSTEN");
};

