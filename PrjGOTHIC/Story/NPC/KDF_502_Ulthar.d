
instance KDF_502_Ulthar(Npc_Default)
{
	name[0] = "Ультар";
	guild = GIL_KDF;
	id = 502;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_NormalBart01,BodyTex_L,ItAr_KDF_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_502;
};


func void Rtn_Start_502()
{
	TA_Sit_Throne(8,0,23,0,"NW_MONASTERY_THRONE_03");
	TA_Sit_Throne(23,0,8,0,"NW_MONASTERY_THRONE_03");
};

