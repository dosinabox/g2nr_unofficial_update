
instance PIR_1354_Addon_Henry(Npc_Default)
{
	name[0] = "Генри";
	guild = GIL_PIR;
	id = 1354;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DexToSteal] = 40;
	aivar[AIV_GoldToSteal] = 60;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Krummschwert);
	EquipItem(self,ItRw_Crossbow_M_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal01,BodyTex_P,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,90);
	B_SetTeacherFightSkills(self,90,TeachLimit_2H_Henry,90,TeachLimit_Crossbow_Henry);
	daily_routine = Rtn_Start_1354;
};


func void Rtn_Start_1354()
{
	TA_Guard_Passage(5,0,20,0,"ADW_PIRATECAMP_WAY_04");
	TA_Guard_Passage(20,0,5,0,"ADW_PIRATECAMP_WAY_04");
};

