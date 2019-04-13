
instance PAL_257_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 257;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_257;
};


func void Rtn_Start_257()
{
	TA_Practice_Sword(8,0,19,0,"OC_TRAIN_03");
	TA_Sit_Campfire(19,0,8,0,"OC_CAMPFIRE_OUT_03");
};

func void Rtn_Marcos_257()
{
	TA_Stand_Guarding(8,0,19,0,"OW_STAND_GUARDS");
	TA_Stand_Guarding(19,0,8,0,"OW_STAND_GUARDS");
};

