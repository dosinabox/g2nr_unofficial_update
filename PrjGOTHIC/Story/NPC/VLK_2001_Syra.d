
instance Vlk_2001_Syra(Npc_Default)
{
	name[0] = "Сира";
	guild = GIL_VLK;
	id = 2001;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,1);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_PinkHair,BodyTex_N,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_2001;
};


func void Rtn_Start_2001()
{
	TA_Stand_Eating(22,0,6,0,"XXX");
	TA_Sleep(6,0,22,0,"XXX");
};

