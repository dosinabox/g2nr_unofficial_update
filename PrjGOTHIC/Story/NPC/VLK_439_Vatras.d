
instance VLK_439_Vatras(Npc_Default)
{
	name[0] = "Ватрас";
	guild = GIL_VLK;
	id = 439;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItSc_LightHeal,2);
	CreateInvItems(self,ItSc_Zap,2);
	CreateInvItems(self,ItSc_Icebolt,2);
	CreateInvItems(self,ItSc_Light,2);
	CreateInvItems(self,ItSc_TrfScavenger,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_439;
};


func void Rtn_Start_439()
{
	TA_Preach_Vatras(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Pray_Innos_FP(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_IN");
};

func void Rtn_RitualInnosEyeRepair_439()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_RITUAL_04");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void Rtn_RitualInnosEye_439()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_04");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void Rtn_WAITFORSHIP_439()
{
	TA_Sit_Bench(8,0,23,0,"NW_WAITFOR_SHIP_04");
	TA_Sit_Bench(23,0,8,0,"NW_WAITFOR_SHIP_04");
};

func void Rtn_Ship_439()
{
	TA_Read_Bookstand(8,0,23,0,"SHIP_IN_22");
	TA_Sleep(23,0,8,0,"SHIP_IN_04");
};

func void Rtn_PRAY_439()
{
	TA_Pray_Innos_FP(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Pray_Innos_FP(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_IN");
};

