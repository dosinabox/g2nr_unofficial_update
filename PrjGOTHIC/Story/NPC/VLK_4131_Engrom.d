
instance VLK_4131_Engrom(Npc_Default)
{
	name[0] = "Ёнгром";
	guild = GIL_OUT;
	id = 4131;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart20,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_4131;
};


func void Rtn_Start_4131()
{
	TA_Sit_Campfire(8,0,23,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	TA_Sit_Campfire(23,0,8,0,"SPAWN_TALL_PATH_BANDITOS2_03");
};

func void Rtn_Obsessed_4131()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_SAWHUT_MOLERAT_MOVEMENT");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_SAWHUT_MOLERAT_MOVEMENT");
};

