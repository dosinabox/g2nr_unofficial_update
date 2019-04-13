
instance PAL_268_Udar(Npc_Default)
{
	name[0] = "Удар";
	guild = GIL_PAL;
	id = 268;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Crossbow_H_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Stone,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_268;
};


func void Rtn_Start_268()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_03");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_GUARD_03");
};

