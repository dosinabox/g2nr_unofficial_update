
instance MIL_311_Andre(Npc_Default)
{
	name[0] = "Андре";
	guild = GIL_MIL;
	id = 311;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_311;
};


func void Rtn_PreStart_311()
{
	TA_Stand_Guarding(0,0,12,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
	TA_Stand_Guarding(12,0,0,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

func void Rtn_Start_311()
{
	TA_Read_Bookstand(8,0,0,10,"NW_CITY_ANDRE");
	TA_Smalltalk(0,10,5,0,"NW_CITY_ANDRE_SMALLTALK");
	TA_Read_Bookstand(5,0,8,0,"NW_CITY_ANDRE");
};

