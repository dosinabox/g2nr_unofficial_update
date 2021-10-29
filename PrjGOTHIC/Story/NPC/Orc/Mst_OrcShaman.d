
prototype Mst_Default_OrcShaman(C_Npc)
{
	name[0] = "Орк-шаман";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 35;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 130;	//65;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 65;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_OrcShaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,NO_ARMOR);
};

func void B_SetVisuals_Hosh_Pak()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Hosh_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,NO_ARMOR);
};

instance OrcShaman_Sit(Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Hosh_Pak(Mst_Default_OrcShaman)
{
	name[0] = "Хош-Пак";
	level = 40;
	attribute[ATR_STRENGTH] = 105;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	damagetype = DAM_BLUNT;
//	EquipItem(self,ItMw_2H_OrcAxe_01);
	B_SetVisuals_Hosh_Pak();
	EquipItem(self,ItMw_2H_OrcMace_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Sit_CanyonLibraryKey(Mst_Default_OrcShaman)
{
	name[0] = "Главарь орды";
	level = 40;
	attribute[ATR_STRENGTH] = 105;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
//	EquipItem(self,ItMw_2H_OrcAxe_01);
	B_SetVisuals_Hosh_Pak();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	CreateInvItems(self,ItKe_CanyonLibrary_Hierarchy_Books_Addon,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

