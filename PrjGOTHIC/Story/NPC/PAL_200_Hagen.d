
instance PAL_200_Hagen(Npc_Default)
{
	name[0] = "���� �����";
	guild = GIL_PAL;
	id = 200;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
//	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Okyl,BodyTex_N,ITAR_PALN_H);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,80);
	B_SetTeacherFightSkills(self,80,TeachLimit_2H_Hagen,80,80);
	daily_routine = Rtn_Start_200;
};


func void Rtn_Start_200()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_CITY_HAGEN");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CITY_HAGEN");
};

func void Rtn_ShipFree_200()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_UPTOWNPARADE_HAGEN");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_UPTOWNPARADE_HAGEN");
};

