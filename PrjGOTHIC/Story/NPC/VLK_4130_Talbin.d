
instance VLK_4130_Talbin(Npc_Default)
{
	name[0] = "Талбин";
	guild = GIL_OUT;
	id = 4130;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Bullit,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4130;
};


func void Rtn_Start_4130()
{
	TA_Sit_Campfire(8,0,23,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	TA_Sit_Campfire(23,0,8,0,"SPAWN_TALL_PATH_BANDITOS2_03");
};

func void Rtn_FleePass_4130()
{
	TA_RunToWP(8,0,23,0,"START");
	TA_RunToWP(23,0,8,0,"START");
};

func void Rtn_IntoPass_4130()
{
	TA_Stand_Eating(8,0,23,0,"TOT");
	TA_Stand_Eating(23,0,8,0,"TOT");
};

