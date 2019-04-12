
instance VLK_4106_Dobar(Npc_Default)
{
	name[0] = "Добар";
	guild = GIL_MIL;
	id = 4106;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Nugget,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Snaf,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4106;
};


func void Rtn_Start_4106()
{
	TA_Smith_Fire(8,0,8,30,"OC_SMITH_FIRE");
	TA_Smith_Anvil(8,30,9,0,"OC_SMITH_ANVIL");
	TA_Smith_Cool(9,0,9,30,"OC_SMITH_COOL");
	TA_Smith_Fire(9,30,10,0,"OC_SMITH_FIRE");
	TA_Smith_Anvil(10,0,10,30,"OC_SMITH_ANVIL");
	TA_Smith_Cool(10,30,11,0,"OC_SMITH_COOL");
	TA_Smith_Fire(11,0,11,30,"OC_SMITH_FIRE");
	TA_Smith_Anvil(11,30,12,0,"OC_SMITH_ANVIL");
	TA_Smith_Cool(12,0,12,30,"OC_SMITH_COOL");
	TA_Smith_Fire(12,30,13,0,"OC_SMITH_FIRE");
	TA_Smith_Anvil(13,0,13,30,"OC_SMITH_ANVIL");
	TA_Smith_Cool(13,30,14,0,"OC_SMITH_COOL");
	TA_Smith_Fire(14,0,14,30,"OC_SMITH_FIRE");
	TA_Smith_Anvil(14,30,15,0,"OC_SMITH_ANVIL");
	TA_Smith_Cool(15,0,15,30,"OC_SMITH_COOL");
	TA_Smith_Fire(15,30,16,0,"OC_SMITH_FIRE");
	TA_Smith_Anvil(16,0,16,30,"OC_SMITH_ANVIL");
	TA_Smith_Cool(16,30,17,0,"OC_SMITH_COOL");
	TA_Smith_Fire(17,0,17,30,"OC_SMITH_FIRE");
	TA_Smith_Anvil(17,30,18,0,"OC_SMITH_ANVIL");
	TA_Smith_Cool(18,0,18,30,"OC_SMITH_COOL");
	TA_Smith_Fire(18,30,19,0,"OC_SMITH_FIRE");
	TA_Smith_Anvil(19,0,19,30,"OC_SMITH_ANVIL");
	TA_Smith_Cool(19,30,20,0,"OC_SMITH_COOL");
	TA_Sleep(20,0,8,0,"OC_GUARD_ROOM_01_SLEEP_01");
};

func void Rtn_Tot_4106()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

