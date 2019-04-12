
instance DJG_700_Sylvio(Npc_Default)
{
	name[0] = "Сильвио";
	guild = GIL_DJG;
	id = 700;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Scar,BodyTex_N,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_700;
};


func void Rtn_Start_700()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_ICECAMP_01");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_ICECAMP_01");
};

func void Rtn_IceWait1_700()
{
	TA_Stand_Guarding(0,0,23,0,"OW_ICEREGION_ENTRANCE");
	TA_Stand_Guarding(23,0,24,0,"OW_ICEREGION_ENTRANCE");
};

func void Rtn_IceWait2_700()
{
	TA_Stand_Guarding(0,0,23,0,"OW_DJG_ICEREGION_WAIT2_01");
	TA_Stand_Guarding(23,0,24,0,"OW_DJG_ICEREGION_WAIT2_01");
};

func void Rtn_IceDragon_700()
{
	TA_Stand_Guarding(0,0,23,0,"OW_ICEDRAGON_01");
	TA_Stand_Guarding(23,0,24,0,"OW_ICEDRAGON_01");
};

