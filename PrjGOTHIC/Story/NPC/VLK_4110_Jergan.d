
instance VLK_4110_Jergan(Npc_Default)
{
	name[0] = "Джерган";
	guild = GIL_NONE;
	id = 4110;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Whistler,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_4110;
};


func void Rtn_Start_4110()
{
	TA_Sit_Campfire(8,0,23,0,"OW_STAND_JERGAN");
	TA_Sit_Campfire(23,0,8,0,"OW_STAND_JERGAN");
};

func void Rtn_Fajeth_4110()
{
	TA_Sit_Campfire(8,0,23,0,"OW_NEWMINE_04");
	TA_Sit_Campfire(23,0,8,0,"OW_NEWMINE_04");
};

