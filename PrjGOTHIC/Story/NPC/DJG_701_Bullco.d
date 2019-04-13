
instance DJG_701_Bullco(Npc_Default)
{
	name[0] = "Булко";
	guild = GIL_DJG;
	id = 701;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Olli_Kahn,BodyTex_N,itar_djg_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_701;
};


func void Rtn_Start_701()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_ICECAMP_02");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_ICECAMP_02");
};

func void Rtn_IceWait1_701()
{
	TA_Stand_ArmsCrossed(0,0,23,0,"OW_ICEREGION_ENTRANCE");
	TA_Stand_ArmsCrossed(23,0,24,0,"OW_ICEREGION_ENTRANCE");
};

func void Rtn_IceWait2_701()
{
	TA_Stand_ArmsCrossed(0,0,23,0,"OW_DJG_ICEREGION_WAIT2_02");
	TA_Stand_ArmsCrossed(23,0,24,0,"OW_DJG_ICEREGION_WAIT2_02");
};

func void Rtn_IceDragon_701()
{
	TA_Stand_ArmsCrossed(0,0,23,0,"OW_ICEDRAGON_02");
	TA_Stand_ArmsCrossed(23,0,24,0,"OW_ICEDRAGON_02");
};

func void Rtn_DJGVorposten_701()
{
	TA_Stand_ArmsCrossed(0,0,23,0,"OW_MOVEMENT_BGOBBO1");
	TA_Stand_ArmsCrossed(23,0,24,0,"OW_MOVEMENT_BGOBBO1");
};

func void Rtn_Follow_701()
{
	TA_Follow_Player(0,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	TA_Follow_Player(23,0,24,0,"SPAWN_OW_BLACKGOBBO_A1");
};

