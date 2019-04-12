
instance NONE_100_Xardas(Npc_Default)
{
	name[0] = "Ксардас";
	guild = GIL_NONE;
	id = 100;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Xardas,BodyTex_N,ITAR_Xardas);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_PreStart_100;
};


func void Rtn_PreStart_100()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_XARDAS_START");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_XARDAS_START");
};

func void Rtn_Start_100()
{
	TA_Read_Bookstand(8,0,23,0,"NW_XARDAS_TOWER_IN1_28");
	TA_Read_Bookstand(23,0,8,0,"NW_XARDAS_TOWER_IN1_28");
};

func void Rtn_RitualInnosEyeRepair_100()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_RitualInnosEye_100()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_Tot_100()
{
	TA_Circle(8,0,23,0,"TOT");
	TA_Circle(23,0,8,0,"TOT");
};

