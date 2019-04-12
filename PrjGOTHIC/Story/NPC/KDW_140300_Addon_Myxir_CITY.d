
instance KDW_140300_Addon_Myxir_CITY(Npc_Default)
{
	name[0] = "Миксир";
	guild = GIL_KDW;
	id = 140300;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_NormalBart_Cronos,BodyTex_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_140300;
};


func void Rtn_Start_140300()
{
	TA_Pray_Innos_FP(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Stand_WP(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_FRONT");
};

