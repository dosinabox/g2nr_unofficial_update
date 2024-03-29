
instance SLD_801_Torlof_DI(Npc_Default)
{
	name[0] = "������";
	guild = GIL_SLD;
	id = 8010;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_Teeth] = 1;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,76,ItMi_Gold,120);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Torlof,BodyTex_N,ITAR_SLD_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_8010;
};


func void Rtn_Start_8010()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void Rtn_OrkSturmDI_8010()
{
	TA_Stand_WP(8,0,23,0,"DI_SHIP_03");
	TA_Stand_WP(23,0,8,0,"DI_SHIP_03");
};

