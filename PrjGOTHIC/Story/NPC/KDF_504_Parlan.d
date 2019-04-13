
instance KDF_504_Parlan(Npc_Default)
{
	name[0] = "Парлан";
	guild = GIL_KDF;
	id = 504;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Corristo,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_504;
};


func void Rtn_Start_504()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_PLACE_03");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_PLACE_03");
};

