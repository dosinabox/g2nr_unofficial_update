
instance DJG_709_Rethon(Npc_Default)
{
	name[0] = "Ретон";
	guild = GIL_DJG;
	id = 709;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_CoolPock,BodyTex_N,itar_djg_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_709;
};


func void Rtn_Start_709()
{
	TA_Smith_Sharp(8,0,8,30,"OC_SMITH_SHARP");
	TA_Stand_Guarding(8,30,9,0,"OC_CENTER_04");
	TA_Practice_Sword(9,0,9,30,"OC_CENTER_04");
	TA_Smith_Sharp(9,30,10,0,"OC_SMITH_SHARP");
	TA_Stand_Guarding(10,0,10,30,"OC_CENTER_04");
	TA_Practice_Sword(10,30,11,0,"OC_CENTER_04");
	TA_Smith_Sharp(11,0,11,30,"OC_SMITH_SHARP");
	TA_Stand_Guarding(11,30,12,0,"OC_CENTER_04");
	TA_Practice_Sword(12,0,12,30,"OC_CENTER_04");
	TA_Smith_Sharp(12,30,13,0,"OC_SMITH_SHARP");
	TA_Stand_Guarding(13,0,13,30,"OC_CENTER_04");
	TA_Practice_Sword(13,30,14,0,"OC_CENTER_04");
	TA_Smith_Sharp(14,0,14,30,"OC_SMITH_SHARP");
	TA_Stand_Guarding(14,30,15,0,"OC_CENTER_04");
	TA_Practice_Sword(15,0,15,30,"OC_CENTER_04");
	TA_Smith_Sharp(15,30,16,0,"OC_SMITH_SHARP");
	TA_Stand_Guarding(16,0,16,30,"OC_CENTER_04");
	TA_Practice_Sword(16,30,17,0,"OC_CENTER_04");
	TA_Smith_Sharp(17,0,17,30,"OC_SMITH_SHARP");
	TA_Stand_Guarding(17,30,18,0,"OC_CENTER_04");
	TA_Practice_Sword(18,0,18,30,"OC_CENTER_04");
	TA_Smith_Sharp(18,30,19,0,"OC_SMITH_SHARP");
	TA_Stand_Guarding(19,0,19,30,"OC_CENTER_04");
	TA_Practice_Sword(19,30,20,0,"OC_CENTER_04");
	TA_Sit_Campfire(20,0,8,0,"OC_CAMPFIRE_OUT_03");
};

