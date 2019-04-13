
instance Vlk_2000_Thorus(Npc_Default)
{
	name[0] = "Торус";
	guild = GIL_NONE;
	id = 2000;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Thorus,BodyTex_B,ItAr_MIL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_2000;
};


func void Rtn_Start_2000()
{
	TA_Sit_Bench(8,0,23,0,"XXX");
	TA_Sit_Bench(23,0,8,0,"XXX");
};

