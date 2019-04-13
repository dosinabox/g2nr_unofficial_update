
instance Sld_810_Dar(Npc_Default)
{
	name[0] = "Дар";
	guild = GIL_SLD;
	id = 810;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Joint,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Spassvogel,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_PreStart_810;
};


func void Rtn_PreStart_810()
{
	TA_Smoke_Joint(8,0,22,0,"NW_BIGFARM_KITCHEN_DAR");
	TA_Smoke_Joint(22,0,8,0,"NW_BIGFARM_KITCHEN_DAR");
};

func void Rtn_Start_810()
{
	TA_Smoke_Joint(8,0,22,0,"NW_BIGFARM_KITCHEN_DAR");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

