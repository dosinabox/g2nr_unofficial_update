
func void B_Build_Settings_Diag()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_PatchSettings_BACK);
	Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� �������� �������",StoryHelper_IceDragonSpell);
	if((Tandor_ItemsGiven_Chapter_1 == FALSE) && (Sarah_ItemsGiven_Chapter_1 == FALSE) && (Rethon_ItemsGiven_Chapter_4 == FALSE) && (Orlan_ItemsGiven_Chapter_1 == FALSE) && (Jora_ItemsGiven_Chapter_1 == FALSE) && (Hakon_ItemsGiven_Chapter_1 == FALSE) && (Canthar_ItemsGiven_Chapter_1 == FALSE) && (Scatty_ItemsGiven_Chapter_1 == FALSE) && (Huno_ItemsGiven_Chapter_1 == FALSE) && (Garett_ItemsGiven_Chapter_1 == FALSE) && (Fisk_ItemsGiven_Chapter_1 == FALSE) && (Erol_ItemsGiven_Chapter_1 == FALSE) && (Khaled_ItemsGiven_Chapter_1 == FALSE))
	{
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������ ����������� ������ �������� ��� � �������",StoryHelper_ClassicMeleeWeaponsTraders);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� �������������� ����������� ������ �������� ��� � �������",StoryHelper_ClassicMeleeWeaponsTraders);
		};
	};
	if(FullNPCRemoval == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������ �������� NPC �� ����",StoryHelper_FullNPCRemoval);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������ �������� NPC �� ����",StoryHelper_FullNPCRemoval);
	};
	if(AlternativeSmithing == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� �������������� �������� � �������",StoryHelper_AlternativeSmithing);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� �������������� �������� � �������",StoryHelper_AlternativeSmithing);
	};
	if(EasyLowDexPickpocketDisabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ���������� ��������� ���� ��� ������ ��������",StoryHelper_EasyLowDexPickpocket);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ���������� ��������� ���� ��� ������ ��������",StoryHelper_EasyLowDexPickpocket);
	};
	if(HardModeXPModifier == 0)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ���������� ������� ���������",StoryHelper_HardMode);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ���������� ������� ���������",StoryHelper_HardMode);
	};
	if(ClassicAlchemy == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������� �� ������ 2 ��� ������",StoryHelper_ClassicAlchemy);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������� �� ������ 2 ��� ������",StoryHelper_ClassicAlchemy);
	};
	if(Helmets_Enabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� �� ��������",StoryHelper_Helmets);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� � �������",StoryHelper_Helmets);
	};
	if(IgnoreBonuses == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������� ���������� ������� ��� ��������",StoryHelper_Bonuses);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������������� ���������� ������� ��� ��������",StoryHelper_Bonuses);
	};
	if(AddonDisabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����������� ��� ������",StoryHelper_Addon);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����������� ��� ������",StoryHelper_Addon);
	};
	if(GuildlessMode == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����������� ��� �������",StoryHelper_Guildless);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����������� ��� �������",StoryHelper_Guildless);
	};
	if(!Npc_KnowsInfo(other,DIA_Coragon_GiveBook) && !Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		if(ClassicLehmarBook == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� ��������� � ������� � ��������",StoryHelper_LehmarBook);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� ��������� � ������� � ��������",StoryHelper_LehmarBook);
		};
	};
	if(Dont_Fix_Unlim == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����� � �������� � ���������",StoryHelper_Unlimfix);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����� � �������� � ���������",StoryHelper_Unlimfix);
	};
	if(NpcWantToFlee == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� �������� � ����� � ��������",StoryHelper_Flee);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� �������� � ����� � ��������",StoryHelper_Flee);
	};
	if(RandomGoblinBerries == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ��������� ���������� ����� � ���������",StoryHelper_GoblinBerries);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ��������� ���������� ����� � ���������",StoryHelper_GoblinBerries);
	};
	if(RandomPepper == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ��������� ����� � �������",StoryHelper_Pepper);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ��������� ����� � �������",StoryHelper_Pepper);
	};
	if(InfiniteApples == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ��������� ����������� �����",StoryHelper_Apples);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ��������� ����������� �����",StoryHelper_Apples);
	};
	if(XP_Static == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������� ���� �� ������",StoryHelper_XP);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������������� ���� �� ������",StoryHelper_XP);
	};
	if(LP_Static == 0)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������� ��������� ��������",StoryHelper_LP);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������������� ��������� ��������",StoryHelper_LP);
	};
	if(NoXPFromSummonedSkeletons == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ���� � ���������� ����������� ��������",StoryHelper_Skeletons);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ���� � ���������� ����������� ��������",StoryHelper_Skeletons);
	};
	if(NewLogDisabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� ���������� ��� ���������� ��������",StoryHelper_Log);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� ���������� ��� ���������� ��������",StoryHelper_Log);
	};
	if(UnionActivated == FALSE)
	{
		if(HonestLearnCostEnabled == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ������� ������ ��������� ��������",StoryHelper_HonestLearnCost);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ������� ������ ��������� ��������",StoryHelper_HonestLearnCost);
		};
		if(TradersHaveLimitedAmmo == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� ������ ����� � ������ � ���������",StoryHelper_LimitedAmmo);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� ������ ����� � ������ � ���������",StoryHelper_LimitedAmmo);
		};
		if(PremiumTeachersEnabled == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ������� ��������",StoryHelper_PremiumTeachers);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ������� ��������",StoryHelper_PremiumTeachers);
		};
	};
};

func void StoryHelper_LimitedAmmo()
{
	if(TradersHaveLimitedAmmo == TRUE)
	{
		TradersHaveLimitedAmmo = FALSE;
		PrintScreen("����� ��������",-1,-1,FONT_Screen,2);
	}
	else
	{
		TradersHaveLimitedAmmo = TRUE;
		PrintScreen("����� �������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Flee()
{
	if(NpcWantToFlee == TRUE)
	{
		NpcWantToFlee = FALSE;
		PrintScreen("����� �������� ��������",-1,-1,FONT_Screen,2);
	}
	else
	{
		NpcWantToFlee = TRUE;
		PrintScreen("����� �������� �������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Unlimfix()
{
	if(Dont_Fix_Unlim == TRUE)
	{
		Dont_Fix_Unlim = FALSE;
		PrintScreen("����� � �������� ����������",-1,-1,FONT_Screen,2);
	}
	else
	{
		Dont_Fix_Unlim = TRUE;
		PrintScreen("����� � �������� ����������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Bonuses()
{
	if(IgnoreBonuses == TRUE)
	{
		IgnoreBonuses = FALSE;
		TAL_TeachLimitFlags_TS_PermBonus = 1;
		TAL_CostFlags_TS_PermBonus = 1;
		PrintScreen("��������: ������ ����� ������",-1,-1,FONT_Screen,2);
	}
	else
	{
		IgnoreBonuses = TRUE;
		TAL_TeachLimitFlags_TS_PermBonus = 0;
		TAL_CostFlags_TS_PermBonus = 0;
		PrintScreen("������ ������ ����� �� ������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_GoblinBerries()
{
	if(RandomGoblinBerries == TRUE)
	{
		RandomGoblinBerries = FALSE;
		PrintScreen("������������� ���������� ���� � ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		RandomGoblinBerries = TRUE;
		PrintScreen("��������� ���������� ���� � ���������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Pepper()
{
	if(RandomPepper == TRUE)
	{
		RandomPepper = FALSE;
		PrintScreen("������������� ���������� ������ � ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		RandomPepper = TRUE;
		PrintScreen("��������� ���������� ������ � �������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Apples()
{
	if(InfiniteApples == TRUE)
	{
		InfiniteApples = FALSE;
		PrintScreen("����������� ������ ����������",-1,-1,FONT_Screen,2);
	}
	else
	{
		InfiniteApples = TRUE;
		PrintScreen("������ ����������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Helmets()
{
	if(Helmets_Enabled == TRUE)
	{
		PrintScreen("����� � ������� ����� ������� (��������)",-1,-1,FONT_Screen,3);
		Npc_RemoveInvItem(hero,ITHE_PAL_M);
		Npc_RemoveInvItem(hero,ITHE_PAL_H);
		Npc_RemoveInvItem(hero,ITHE_DJG_M);
		Npc_RemoveInvItem(hero,ITHE_DJG_H);
		if(Npc_HasItems(hero,ITAR_PALN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_M);
			CreateInvItem(hero,ITAR_PAL_M);
		};
		if(Npc_HasItems(hero,ITAR_PALN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_H);
			CreateInvItem(hero,ITAR_PAL_H);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_M);
			CreateInvItem(hero,ITAR_DJG_M);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_H);
			CreateInvItem(hero,ITAR_DJG_H);
		};
		Helmets_Enabled = FALSE;
	}
	else
	{
		PrintScreen("����� � ������� ���������",-1,-1,FONT_Screen,2);
		if(Npc_HasItems(hero,ITAR_PAL_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_M);
			CreateInvItem(hero,ITAR_PALN_M);
			CreateInvItem(hero,ITHE_PAL_M);
		};
		if(Npc_HasItems(hero,ITAR_PAL_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_H);
			CreateInvItem(hero,ITAR_PALN_H);
			CreateInvItem(hero,ITHE_PAL_H);
		};
		if(Npc_HasItems(hero,ITAR_DJG_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_M);
			CreateInvItem(hero,ITAR_DJGN_M);
			CreateInvItem(hero,ITHE_DJG_M);
		};
		if(Npc_HasItems(hero,ITAR_DJG_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_H);
			CreateInvItem(hero,ITAR_DJGN_H);
			CreateInvItem(hero,ITHE_DJG_H);
		};
		Helmets_Enabled = TRUE;
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_ClassicAlchemy()
{
	if(ClassicAlchemy == TRUE)
	{
		ClassicAlchemy = FALSE;
		PrintScreen("������� �� ������ 2 ��� ������ ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicAlchemy = TRUE;
		PrintScreen("������� �� ������ 2 ��� ������ ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_AlternativeSmithing()
{
	if(AlternativeSmithing == TRUE)
	{
		AlternativeSmithing = FALSE;
		PrintScreen("�������������� �������� � ������� ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		AlternativeSmithing = TRUE;
		PrintScreen("�������������� �������� � ������� ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Log()
{
	if(NewLogDisabled == FALSE)
	{
		NewLogDisabled = TRUE;
		PrintScreen("����� ���������� ��������",-1,-1,FONT_Screen,3);
	}
	else
	{
		NewLogDisabled = FALSE;
		PrintScreen("����� ���������� �������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Skeletons()
{
	if(NoXPFromSummonedSkeletons == TRUE)
	{
		NoXPFromSummonedSkeletons = FALSE;
		PrintScreen("���� �� ����������� �������� �������",-1,-1,FONT_Screen,3);
	}
	else
	{
		NoXPFromSummonedSkeletons = TRUE;
		PrintScreen("���� �� ����������� �������� ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_PremiumTeachers()
{
	if(PremiumTeachersEnabled == TRUE)
	{
		PremiumTeachersEnabled = FALSE;
		PrintScreen("������� �������� ���������",-1,-1,FONT_Screen,2);
	}
	else
	{
		PremiumTeachersEnabled = TRUE;
		PrintScreen("������� �������� ��������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_EasyLowDexPickpocket()
{
	if(EasyLowDexPickpocketDisabled == TRUE)
	{
		EasyLowDexPickpocketDisabled = FALSE;
		PrintScreen("���������� ��������� ���� ��������",-1,-1,FONT_Screen,2);
	}
	else
	{
		EasyLowDexPickpocketDisabled = TRUE;
		PrintScreen("���������� ��������� ���� ���������",-1,-1,FONT_Screen,2);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_HardMode()
{
	if(HardModeXPModifier > 0)
	{
		HardModeXPModifier = 0;
		PrintScreen("���������� ������� ��������� ��������",-1,-1,FONT_Screen,3);
		B_Build_Settings_Diag();
	}
	else
	{
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_HardMode_Back);
		Info_AddChoice(StoryHelper_PatchSettings,"-50% �����",StoryHelper_HardMode_50);
		Info_AddChoice(StoryHelper_PatchSettings,"-40% �����",StoryHelper_HardMode_40);
		Info_AddChoice(StoryHelper_PatchSettings,"-30% �����",StoryHelper_HardMode_30);
		Info_AddChoice(StoryHelper_PatchSettings,"-20% �����",StoryHelper_HardMode_20);
		Info_AddChoice(StoryHelper_PatchSettings,"-10% �����",StoryHelper_HardMode_10);
	};
};

func void B_SetHardMode(var int modifier)
{
	HardModeXPModifier = modifier;
	PrintScreen("���������� ������� ��������� �������",-1,YPOS_LOGENTRY,FONT_Screen,3);
	PrintScreen(ConcatStrings(ConcatStrings("���������� ���� ������ �� ",IntToString(modifier)),"%"),-1,-1,FONT_ScreenSmall,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_HardMode_10()
{
	B_SetHardMode(10);
};

func void StoryHelper_HardMode_20()
{
	B_SetHardMode(20);
};

func void StoryHelper_HardMode_30()
{
	B_SetHardMode(30);
};

func void StoryHelper_HardMode_40()
{
	B_SetHardMode(40);
};

func void StoryHelper_HardMode_50()
{
	B_SetHardMode(50);
};

func void StoryHelper_HardMode_Back()
{
	B_Build_Settings_Diag();
};

func void StoryHelper_LehmarBook()
{
	if(ClassicLehmarBook == TRUE)
	{
		ClassicLehmarBook = FALSE;
		PrintScreen("����� ��������� ��������",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicLehmarBook = TRUE;
		PrintScreen("����� ��������� ��� � ���������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Guildless()
{
	if(GuildlessMode == TRUE)
	{
		GuildlessMode = FALSE;
		PrintScreen("����������� ��� ������� ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		GuildlessMode = TRUE;
		PrintScreen("����������� ��� ������� ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_Addon()
{
	if(AddonDisabled == TRUE)
	{
		AddonDisabled = FALSE;
		PrintScreen("����������� ��� ������ ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		AddonDisabled = TRUE;
		PrintScreen("����������� ��� ������ ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_XP()
{
	if(XP_Static == TRUE)
	{
		B_SetAmbientXP();
		XP_Static = FALSE;
		PrintScreen("��������: ������������ ���� �� ������",-1,-1,FONT_Screen,3);
		B_Build_Settings_Diag();
	}
	else
	{
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_XP_Back);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 300 (����� 6)",StoryHelper_XP_6);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 250 (����� 5)",StoryHelper_XP_5);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 200 (����� 4)",StoryHelper_XP_4);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 150 (����� 3)",StoryHelper_XP_3);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 100 (����� 2)",StoryHelper_XP_2);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 50  (����� 1)",StoryHelper_XP_1);
	};
};

func void StoryHelper_XP_6()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap6;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 300 (����� 6)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_5()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap5;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 250 (����� 5)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_4()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap4;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 200 (����� 4)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_3()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap3;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 150 (����� 3)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_2()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap2;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 100 (����� 2)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_1()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap1;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 50 (����� 1)",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_XP_Back()
{
	B_Build_Settings_Diag();
};

func void StoryHelper_LP()
{
	if(LP_Static > 0)
	{
		LP_Static = 0;
		PrintScreen("��������: ������������ ��������� ��������",-1,-1,FONT_Screen,3);
		B_Build_Settings_Diag();
	}
	else
	{
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_LP_Back);
		Info_AddChoice(StoryHelper_PatchSettings,"5 ����� �������� �� ������� ������",StoryHelper_LP_5);
		Info_AddChoice(StoryHelper_PatchSettings,"4 ���� �������� �� ������� ������",StoryHelper_LP_4);
		Info_AddChoice(StoryHelper_PatchSettings,"3 ���� �������� �� ������� ������",StoryHelper_LP_3);
		Info_AddChoice(StoryHelper_PatchSettings,"2 ���� �������� �� ������� ������",StoryHelper_LP_2);
		Info_AddChoice(StoryHelper_PatchSettings,"1 ���� �������� �� ������� ������",StoryHelper_LP_1);
	};
};

func void StoryHelper_LP_1()
{
	LP_Static = 1;
	PrintScreen("1 ���� �������� �� ������� ������",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_LP_2()
{
	LP_Static = 2;
	PrintScreen("2 ���� �������� �� ������� ������",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_LP_3()
{
	LP_Static = 3;
	PrintScreen("3 ���� �������� �� ������� ������",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_LP_4()
{
	LP_Static = 4;
	PrintScreen("4 ���� �������� �� ������� ������",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_LP_5()
{
	LP_Static = 5;
	PrintScreen("5 ����� �������� �� ������� ������",-1,45,FONT_Screen,3);
	B_Build_Settings_Diag();
};

func void StoryHelper_LP_Back()
{
	B_Build_Settings_Diag();
};

func void StoryHelper_HonestLearnCost()
{
	if(HonestLearnCostEnabled == TRUE)
	{
		HonestLearnCostEnabled = FALSE;
		PrintScreen("������ ��������� �������� ��� � ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		HonestLearnCostEnabled = TRUE;
		PrintScreen("������� ������ ��������� �������� �������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_FullNPCRemoval()
{
	if(FullNPCRemoval == TRUE)
	{
		FullNPCRemoval = FALSE;
		PrintScreen("������ �������� NPC �� ���� ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		FullNPCRemoval = TRUE;
		PrintScreen("������ �������� NPC �� ���� ��������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_ClassicMeleeWeaponsTraders()
{
	if(ClassicMeleeWeaponsTraders == TRUE)
	{
		ClassicMeleeWeaponsTraders = FALSE;
		PrintScreen("�������������� ����������� �������",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicMeleeWeaponsTraders = TRUE;
		PrintScreen("������������ ����������� �������",-1,-1,FONT_Screen,3);
	};
	B_Build_Settings_Diag();
};

func void StoryHelper_IceDragonSpell()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_IceDragonSpell_BACK);
	Info_AddChoice(StoryHelper_PatchSettings,B_BuildOptionString(NAME_SPL_InstantFireball,IceDragonSpell,SPL_InstantFireball),StoryHelper_IceDragonSpell_InstantFireball);
	Info_AddChoice(StoryHelper_PatchSettings,B_BuildOptionString(NAME_SPL_IceLance,IceDragonSpell,SPL_IceLance),StoryHelper_IceDragonSpell_IceLance);
	Info_AddChoice(StoryHelper_PatchSettings,B_BuildOptionString(NAME_SPL_ChargeZap,IceDragonSpell,SPL_ChargeZap),StoryHelper_IceDragonSpell_ChargeZap);
	Info_AddChoice(StoryHelper_PatchSettings,B_BuildOptionString(NAME_SPL_Icebolt,IceDragonSpell,SPL_Icebolt),StoryHelper_IceDragonSpell_Icebolt);
};

func void StoryHelper_IceDragonSpell_InstantFireball()
{
	IceDragonSpell = SPL_InstantFireball;
	PrintScreen(ConcatStrings("����� �������� �������: ",NAME_SPL_InstantFireball),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_IceLance()
{
	IceDragonSpell = SPL_IceLance;
	PrintScreen(ConcatStrings("����� �������� �������: ",NAME_SPL_IceLance),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_ChargeZap()
{
	IceDragonSpell = SPL_ChargeZap;
	PrintScreen(ConcatStrings("����� �������� �������: ",NAME_SPL_ChargeZap),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_Icebolt()
{
	IceDragonSpell = SPL_Icebolt;
	PrintScreen(ConcatStrings("����� �������� �������: ",NAME_SPL_Icebolt),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_BACK()
{
	B_Build_Settings_Diag();
};

func void StoryHelper_PatchSettings_BACK()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
};

