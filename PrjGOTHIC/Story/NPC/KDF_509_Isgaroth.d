
instance KDF_509_Isgaroth(Npc_Default)
{
	name[0] = "ָסדאנמע";
	guild = GIL_KDF;
	id = 509;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Okyl,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_509;
};


func void Rtn_Start_509()
{
	TA_Pray_Innos_FP(6,0,21,0,"NW_MONASTERY_SHRINE_04");
	TA_Sit_Bench(21,0,6,0,"NW_MONASTERY_SHRINE_05");
};

