
instance SLD_808_Jarvis(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_SLD;
	id = 808;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_Teeth] = 1;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,41,ItMi_Gold,55);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Torlof,BodyTex_N,ITAR_SLD_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_808;
};


func void Rtn_Start_808()
{
	TA_Sit_Chair(7,5,0,5,"NW_BIGFARM_KITCHEN_07");
	TA_Sit_Chair(0,5,7,5,"NW_BIGFARM_HOUSE_08");
};

