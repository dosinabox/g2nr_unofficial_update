
instance VLK_4304_Addon_William(Npc_Default)
{
	name[0] = "Вильям";
	guild = GIL_VLK;
	id = 4304;
	voice = 6;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITWr_Addon_William_01,1);
	CreateInvItems(self,ItKe_Lockpick,2);
	CreateInvItems(self,ItFo_Apple,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Homer,BodyTex_N,ITAR_Slave);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4304;
};


func void Rtn_Start_4304()
{
	TA_Smalltalk(5,0,20,0,"ADW_ENTRANCE_RUIN2_02");
	TA_Smalltalk(20,0,5,0,"ADW_ENTRANCE_RUIN2_02");
};


