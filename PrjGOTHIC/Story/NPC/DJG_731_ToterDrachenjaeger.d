
instance DJG_731_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_ToterDrachenjaeger;
	guild = GIL_DJG;
	id = 731;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_731;
};


func void Rtn_Start_731()
{
	TA_Sit_Bench(8,0,23,0,"OW_PATH_064");
	TA_Sit_Bench(23,0,8,0,"OW_PATH_064");
};

