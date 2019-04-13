
instance PAL_202_Albrecht(Npc_Default)
{
	name[0] = "Альбрехт";
	guild = GIL_PAL;
	id = 202;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_202;
};


func void Rtn_Start_202()
{
	TA_Read_Bookstand(8,0,23,0,"NW_CITY_ALBRECHT");
	TA_Read_Bookstand(23,0,8,0,"NW_CITY_ALBRECHT");
};

