
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		B_ClearRuneInv(npc);
		CreateInvItem(npc,ItMi_OldCoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void b_check_version()
{
	if(fix_version_save != fix_version_start)
	{
		PrintScreen("Загруженное сохранение не поддерживается!",-1,50,FONT_ScreenSmall,10);
		PrintScreen("Пожалуйста, начните новую игру.",-1,53,FONT_ScreenSmall,10);
	};
};

func void b_check_armor()
{
	if((MILArmor_Equipped == TRUE) || (NOVArmor_Equipped == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	};
};

func void b_cycle_function()
{
	if((CurrentLevel == NEWWORLD_ZEN) && (UNDEADSWORD == FALSE) && Npc_HasItems(hero,ItMw_Drachenschneide))
	{
		Wld_SendTrigger("EVT_TROLL_GRAVE_TRIGGERLIST_01");
		UNDEADSWORD = TRUE;
	};
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if((MayaScrollRemoved == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 1) && Npc_HasItems(Stoneguardian_NailedValleyShowcase_01,ItSc_Teleport_Maya))
		{
			Npc_RemoveInvItem(Stoneguardian_NailedValleyShowcase_01,ItSc_Teleport_Maya);
			MayaScrollRemoved = TRUE;
		};
		if((BloodwynIsHeadless == FALSE) && Npc_HasItems(hero,ItMi_Addon_Bloodwyn_Kopf))
		{
			Snd_Play("CS_IAM_ME_FL_A3");
			Mdl_SetVisualBody(BDT_1085_Addon_Bloodwyn,"hum_body_Bloodwyn_Headless",1,0,"Hum_Headless",0,DEFAULT,NO_ARMOR);
			AI_UnequipArmor(BDT_1085_Addon_Bloodwyn);
			BloodwynIsHeadless = TRUE;
		};
	};
	if(fix_version_save != fix_version_start)
	{
		PrintScreen("Загруженное сохранение не поддерживается!",-1,50,FONT_ScreenSmall,3);
		PrintScreen("Пожалуйста, начните новую игру.",-1,53,FONT_ScreenSmall,3);
	};
	Wld_SendTrigger("CYCLE_TRIGGER");
};

