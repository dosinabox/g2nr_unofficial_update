
instance PAL_281_Fajeth(Npc_Default)
{
	name[0] = "������";
	guild = GIL_PAL;
	id = 281;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,56,ItMi_Gold,95);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Fingers,BodyTex_N,ITAR_PAL_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_281;
};


func void Rtn_Start_281()
{
	TA_Stand_Guarding(8,0,23,0,"OW_NEWMINE_09");
	TA_Stand_Guarding(23,0,8,0,"OW_NEWMINE_09");
};

