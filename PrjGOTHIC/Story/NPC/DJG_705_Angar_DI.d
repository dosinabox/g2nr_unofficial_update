
instance DJG_705_Angar_DI(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_DJG;
	id = 70500;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Zweihaender2);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,47,ItMi_Gold,45);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_CorAngar,BodyTex_Tattoo_B,ITAR_CorAngar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_70500;
};


func void Rtn_Start_70500()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_03");
	TA_Sit_Chair(23,0,8,0,"SHIP_IN_02");
};

func void Rtn_FollowDI_70500()
{
	TA_Follow_Player(8,0,23,0,"SHIP_CREW_03");
	TA_Follow_Player(23,0,8,0,"SHIP_CREW_03");
};

func void Rtn_FireDragonIsland_70500()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"DI_DRACONIANAREA_16");
	TA_Stand_ArmsCrossed(23,0,8,0,"DI_DRACONIANAREA_16");
};

func void Rtn_ORKOBERST_DI_70500()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"DI_ORKOBERST");
	TA_Stand_ArmsCrossed(23,0,8,0,"DI_ORKOBERST");
};

func void Rtn_Troll_DI_70500()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"DI_ORKAREA_TROLL");
	TA_Stand_ArmsCrossed(23,0,8,0,"DI_ORKAREA_TROLL");
};

