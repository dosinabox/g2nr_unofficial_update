
instance BDT_1075_Addon_Fortuno(Npc_Default)
{
	name[0] = "Фортуно";
	guild = GIL_BDT;
	id = 1075;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1H_Sword_L_03);
	CreateInvItems(self,ItMi_Joint,5);
	CreateInvItems(self,ItPl_SwampHerb,3);
	CreateInvItems(self,ItPl_Mushroom_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Fortuno,BodyTex_T,ITAR_Lester);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_PreStart_1075;
};


func void Rtn_PreStart_1075()
{
	TA_Stand_ArmsCrossed(8,0,18,0,"BL_DOWN_SIDE_HERB");
	TA_Stand_ArmsCrossed(18,0,8,0,"BL_DOWN_SIDE_HERB");
};

func void Rtn_Start_1075()
{
	TA_Smoke_Joint(8,0,8,10,"BL_DOWN_SIDE_HERB");
	TA_Stomp_Herb(8,10,12,0,"BL_DOWN_SIDE_HERB");
	TA_Smalltalk(12,0,15,0,"BL_DOWN_RING_02");
	TA_Sit_Bench(15,0,17,0,"BL_DOWN_04_BENCH");
	TA_Smoke_Waterpipe(17,0,19,0,"BL_DOWN_SIDE_03");
	TA_Smalltalk(19,0,22,0,"BL_DOWN_RING_02");
	TA_Smoke_Joint(22,0,0,0,"BL_DOWN_RING_04");
	TA_Sleep(0,0,8,0,"BL_DOWN_SIDE_HERB");
};

