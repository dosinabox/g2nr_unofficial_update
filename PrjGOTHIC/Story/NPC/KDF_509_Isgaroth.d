
instance KDF_509_Isgaroth(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_KDF;
	id = 509;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateItemToSteal(self,48,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Okyl,BodyTex_N,ITAR_KDF_L);
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

