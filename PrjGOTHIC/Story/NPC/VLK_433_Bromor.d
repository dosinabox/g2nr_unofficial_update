
instance VLK_433_Bromor(Npc_Default)
{
	name[0] = "Бромор";
	guild = GIL_VLK;
	id = 433;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,50,ItKe_Bromor,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_433;
};


func void Rtn_Start_433()
{
	TA_Sit_Throne(5,0,8,0,"NW_CITY_PUFF_THRONE");
	TA_Stand_ArmsCrossed(8,0,5,0,"NW_CITY_PUFF_COUNTER");
};

