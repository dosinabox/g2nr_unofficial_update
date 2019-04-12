
instance BDT_10025_Addon_Wache(Npc_Default)
{
	name[0] = "Повар";
	guild = GIL_BDT;
	id = 10025;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal_Kharim,BodyTex_B,ITAR_Barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10025;
};


func void Rtn_Start_10025()
{
	TA_Cook_Cauldron(6,0,12,0,"ADW_MINE_CAULDRON");
	TA_Cook_Cauldron(12,0,6,0,"ADW_MINE_CAULDRON");
};

