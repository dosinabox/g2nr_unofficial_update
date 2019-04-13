
func void B_Kapitelwechsel(var int neues_Kapitel,var int aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		IntroduceChapter(KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		Sekob.flags = 0;
		Bengar.flags = 0;
		IntroduceChapter(KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
	}
	else if(neues_Kapitel == 4)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 5)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	};
	B_CheckLog();
	if(aktuelles_Level_Zen == OldWorld_Zen)
	{
		b_enter_oldworld();
	};
	if(aktuelles_Level_Zen == NEWWORLD_ZEN)
	{
		b_enter_newworld();
	};
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

