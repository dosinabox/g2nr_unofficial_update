
instance SLD_800_Lee(Npc_Default)
{
	name[0] = "ห่";
	guild = GIL_SLD;
	id = 800;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lee,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_800;
};


func void Rtn_Start_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_05");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void Rtn_WaitForShip_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_WAITFOR_SHIP_01");
	TA_Stand_Guarding(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void Rtn_ShipOff_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_05");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void Rtn_Ship_800()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_CREW_01");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

