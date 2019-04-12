
instance VLK_4148_Gestath(Npc_Default)
{
	name[0] = "Гестат";
	guild = GIL_OUT;
	id = 4148;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Thorus,BodyTex_B,ITAR_DJG_Crawler);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_4148;
};


func void Rtn_Start_4148()
{
	TA_Stand_Guarding(8,0,23,0,"OW_DJG_ROCKCAMP_01");
	TA_Sit_Campfire(23,0,8,0,"OW_DJG_ROCKCAMP_01");
};

