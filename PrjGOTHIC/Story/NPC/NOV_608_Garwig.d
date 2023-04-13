
instance NOV_608_Garwig(Npc_Default)
{
	name[0] = "Гарвиг";
	guild = GIL_NOV;
	id = 608;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,52,ItMi_Gold,80);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ITAR_NOV_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_608;
};


func void Rtn_Start_608()
{
	TA_Guard_Hammer(8,0,23,0,"NW_MONASTERY_SANCTUM_02");
	TA_Guard_Hammer(23,0,8,0,"NW_MONASTERY_SANCTUM_01");
};

func void Rtn_Exile_608()
{
	TA_Pray_Innos_FP(5,0,23,0,"NW_SHRINE_01");
	TA_Sit_Chair(23,0,5,0,"NW_TAVERNE_IN_07");
};

