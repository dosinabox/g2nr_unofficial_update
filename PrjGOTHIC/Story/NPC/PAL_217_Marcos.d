
instance PAL_217_Marcos(Npc_Default)
{
	name[0] = "Маркос";
	guild = GIL_PAL;
	id = 217;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Rodriguez,BodyTex_P,ITAR_PAL_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_217;
};


func void Rtn_Start_217()
{
	TA_Stand_Guarding(8,0,23,0,"OW_SAWHUT_MOLERAT_SPAWN01");
	TA_Stand_Guarding(23,0,8,0,"OW_SAWHUT_MOLERAT_SPAWN01");
};

