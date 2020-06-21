
instance DJG_712_Hokurn(Npc_Default)
{
	name[0] = "Хокарн";
	guild = GIL_DJG;
	id = 712;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,ITAR_DJG_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,60);
	B_SetTeacherFightSkills(self,100,100,60,60);
	daily_routine = Rtn_PreStart_712;
};


func void Rtn_PreStart_712()
{
	TA_Smalltalk(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Smalltalk(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Start_712()
{
//	TA_Smalltalk(8,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	TA_Stand_Drinking(8,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	TA_Smalltalk(23,0,8,0,"SPAWN_OW_BLACKGOBBO_A1");
};

