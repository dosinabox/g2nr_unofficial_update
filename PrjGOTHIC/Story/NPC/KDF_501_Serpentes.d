
instance KDF_501_Serpentes(Npc_Default)
{
	name[0] = "Серпентес";
	guild = GIL_KDF;
	id = 501;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_PSIONIC",Face_N_ImportantGrey,BodyTex_N,ItAr_KDF_H);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_501;
};


func void Rtn_Start_501()
{
	TA_Sit_Throne(8,0,23,0,"NW_MONASTERY_THRONE_02");
	TA_Sit_Throne(23,0,8,0,"NW_MONASTERY_THRONE_02");
};

