
instance DJG_702_Rod(Npc_Default)
{
	name[0] = "Род";
	guild = GIL_DJG;
	id = 702;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ToughBart01,BodyTex_N,itar_djg_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_702;
};


func void Rtn_Start_702()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_SWAMPCAMP_01");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_SWAMPCAMP_01");
};

func void Rtn_SwampWait1_702()
{
	TA_Guide_Player(8,0,23,0,"OW_DJG_SWAMP_WAIT1_02");
	TA_Guide_Player(23,0,8,0,"OW_DJG_SWAMP_WAIT1_02");
};

func void Rtn_SwampWait2_702()
{
	TA_RunToWP(8,0,23,0,"OW_DJG_SWAMP_WAIT2_02");
	TA_RunToWP(23,0,8,0,"OW_DJG_SWAMP_WAIT2_02");
};

func void Rtn_SwampDragon_702()
{
	TA_RunToWP(8,0,23,0,"OW_SWAMPDRAGON_01");
	TA_RunToWP(23,0,8,0,"OW_SWAMPDRAGON_01");
};

