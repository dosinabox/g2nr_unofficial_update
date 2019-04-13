
instance Nov_608_Garwig(Npc_Default)
{
	name[0] = "Гарвиг";
	guild = GIL_NOV;
	id = 608;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	level = 1;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ItAr_NOV_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_608;
};


func void Rtn_Start_608()
{
	TA_Guard_Hammer(8,0,23,0,"NW_MONASTERY_SANCTUM_02");
	TA_Guard_Hammer(23,0,8,0,"NW_MONASTERY_SNACTUM_02");
};

