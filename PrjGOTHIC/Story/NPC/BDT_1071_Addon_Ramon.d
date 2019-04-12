
instance BDT_1071_Addon_Ramon(Npc_Default)
{
	name[0] = "Рамон";
	guild = GIL_BDT;
	id = 1071;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_ToughBald01,BodyTex_L,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_1071;
};


func void Rtn_Start_1071()
{
	TA_Guard_Passage(9,0,21,0,"BL_ENTRANCE_04");
	TA_Guard_Passage(21,0,9,0,"BL_ENTRANCE_04");
};

