
instance PAL_258_Keroloth(Npc_Default)
{
	name[0] = "Керолот";
	guild = GIL_PAL;
	id = 258;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,25,ItMi_Gold,45);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal20,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,65);
	B_SetTeacherFightSkills(self,TeachLimit_1H_Keroloth,TeachLimit_2H_Keroloth,65,65);
	daily_routine = Rtn_Start_258;
};


func void Rtn_Start_258()
{
	TA_Stand_Guarding(8,0,19,0,"OC_CENTER_05_B");
	TA_Roast_Scavenger(19,0,8,0,"OC_CAMPFIRE_BARBQ");
};

