
instance NOV_600_Pedro_DI(Npc_Default)
{
	name[0] = "Педро";
	guild = GIL_NONE;
	id = 6000;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_PSIONIC",Face_L_Normal_GorNaBar,BodyTex_L,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	daily_routine = Rtn_Start_6000;
};


func void Rtn_Start_6000()
{
	TA_Sit_Bench(8,0,23,0,"DI_ORKAREA_PEDRO");
	TA_Sit_Bench(23,0,8,0,"DI_ORKAREA_PEDRO");
};

func void Rtn_Ship_6000()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_05");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_05");
};

func void Rtn_FollowShip_6000()
{
	TA_Follow_Player(8,0,23,0,"SHIP");
	TA_Follow_Player(23,0,8,0,"SHIP");
};

func void Rtn_SleepShip_6000()
{
	TA_Sleep(8,0,23,0,"SHIP_IN_06");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

