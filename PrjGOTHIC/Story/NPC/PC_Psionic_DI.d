
instance PC_Psionic_DI(Npc_Default)
{
	name[0] = "������";
	guild = GIL_NONE;
	id = 24;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_Teeth] = 2;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,56,ItMi_Gold,25);
	EquipItem(self,ItMw_Kriegshammer2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_Tattoo_P,ITAR_PSI_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_24;
};


func void Rtn_Start_24()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smoke_Joint(23,0,8,0,"SHIP_CREW_19");
};

func void Rtn_UNDEADDRAGONDEAD_24()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"DI_DRACONIANAREA_19");
	TA_Stand_ArmsCrossed(23,0,8,0,"DI_DRACONIANAREA_19");
};

func void Rtn_SittingShipDI_24()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_CREW_19");
	TA_Sit_Bench(23,0,8,0,"SHIP_CREW_19");
};

