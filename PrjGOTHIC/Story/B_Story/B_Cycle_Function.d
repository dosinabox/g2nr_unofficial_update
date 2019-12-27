
func void b_cycle_function()
{
	if((CurrentLevel == NEWWORLD_ZEN) && (UNDEADSWORD == FALSE) && Npc_HasItems(hero,ItMw_Drachenschneide))
	{
		if(C_WorldIsFixed(NEWWORLD_ZEN))
		{
			Wld_SendTrigger("EVT_TROLL_GRAVE_TRIGGERLIST_01");
		};
		UNDEADSWORD = TRUE;
	};
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if((BloodwynIsHeadless == FALSE) && Npc_HasItems(hero,ItMi_Addon_Bloodwyn_Kopf))
		{
			Snd_Play("CS_IAM_ME_FL_A3");
			Mdl_SetVisualBody(BDT_1085_Addon_Bloodwyn,"hum_body_Bloodwyn_Headless",1,0,"Hum_Headless",0,DEFAULT,NO_ARMOR);
			AI_UnequipArmor(BDT_1085_Addon_Bloodwyn);
			B_StartOtherRoutine(Thorus,"TALK");
			BloodwynIsHeadless = TRUE;
		};
	};
	if(FIX_VERSION_SAVE < LEAST_SUPPORTED)
	{
		PrintScreen(PRINT_OldSave1,50,50,FONT_ScreenSmall,3);
		PrintScreen(PRINT_OldSave2,50,53,FONT_ScreenSmall,3);
	};
//	Print(B_Check_Dist(hero,"NW_CITY_BARRACK02_BED_PECK"));
	Wld_SendTrigger("CYCLE_TRIGGER");
};

