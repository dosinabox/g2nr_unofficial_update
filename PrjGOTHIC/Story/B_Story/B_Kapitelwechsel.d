
func void B_Kapitelwechsel(var int neues_Kapitel,var int aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		Hero_HackChance = 10;
		Cronos_NW_ItMi_Flask_Count = 5;
		Cronos_NW_ItMi_Sulfur_Count = 2;
		Cronos_NW_ItMi_Pitch_Count = 1;
		Cronos_NW_ItPo_Mana_01_Count = 5;
		Cronos_NW_ItPo_Health_01_Count = 6;
		Cronos_NW_ItSc_Light_Count = 5;
		Cronos_NW_ItSc_Firebolt_Count = 5;
		Cronos_NW_ItSc_Zap_Count = 5;
		Cronos_NW_ItSc_LightHeal_Count = 5;
		Cronos_NW_ItSc_SumGobSkel_Count = 2;
		Cronos_NW_ItSc_Icelance_Count = 5;
		Cronos_NW_ItSc_Whirlwind_Count = 1;
		Bennet_NW_ItMi_Swordraw_Count = 3;
		IntroduceChapter(KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		Sekob.flags = 0;
		Bengar.flags = 0;
		Bennet_NW_ItMi_Swordraw_Count += 3;
		IntroduceChapter(KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count = 1;
	}
	else if(neues_Kapitel == 4)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count += 2;
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 5)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count += 2;
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	};
	if(aktuelles_Level_Zen == OLDWORLD_ZEN)
	{
		b_enter_oldworld();
	};
	if(aktuelles_Level_Zen == NEWWORLD_ZEN)
	{
		b_enter_newworld();
	};
	B_CheckLog();
	if(XP_Static == FALSE)
	{
		if(Kapitel == 1)
		{
			XP_Ambient = XP_AmbientKap1;
		};
		if(Kapitel == 2)
		{
			XP_Ambient = XP_AmbientKap2;
		};
		if(Kapitel == 3)
		{
			XP_Ambient = XP_AmbientKap3;
		};
		if(Kapitel == 4)
		{
			XP_Ambient = XP_AmbientKap4;
		};
		if(Kapitel == 5)
		{
			XP_Ambient = XP_AmbientKap5;
		};
		if(Kapitel == 6)
		{
			XP_Ambient = XP_AmbientKap6;
		};
	};
};

