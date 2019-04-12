
instance PIR_1362_Addon_Bones(Npc_Default)
{
	name[0] = "Бонес";
	guild = GIL_PIR;
	id = 1362;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_1362;
};


func void Rtn_PreStart_1362()
{
	TA_Practice_Sword(8,0,20,0,"ADW_PIRATECAMP_TRAIN_01");
	TA_Practice_Sword(20,0,8,0,"ADW_PIRATECAMP_TRAIN_01");
};

func void Rtn_Start_1362()
{
	TA_Practice_Sword(6,55,19,55,"ADW_PIRATECAMP_TRAIN_01");
	TA_Stand_Drinking(19,55,20,55,"WP_PIR_04");
	TA_Sit_Campfire(20,55,0,55,"WP_PIR_04");
	TA_Stand_Drinking(0,55,1,55,"WP_PIR_04");
	TA_Sit_Campfire(1,55,6,55,"WP_PIR_04");
};

