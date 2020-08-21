
instance VLK_449_Lares_DI(Npc_Default)
{
	name[0] = "Ларес";
	guild = GIL_VLK;
	id = 4490;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert3);
	B_CreateAmbientInv(self);
//	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_Vlk_L);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_RANGER_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,35);
	B_SetTeacherFightSkills(self,TeachLimit_1H_Lares,35,35,35);
	daily_routine = Rtn_Start_4490;
};


func void Rtn_Start_4490()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void Rtn_SittingShipDI_4490()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_CREW_04");
	TA_Sit_Bench(23,0,8,0,"SHIP_CREW_04");
};

