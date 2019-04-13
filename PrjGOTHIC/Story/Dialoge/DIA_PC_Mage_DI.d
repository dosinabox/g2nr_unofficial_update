
instance DIA_Milten_DI_EXIT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 999;
	condition = DIA_Milten_DI_EXIT_Condition;
	information = DIA_Milten_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Milten_DI_Hello(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Hello_Condition;
	information = DIA_Milten_DI_Hello_Info;
	description = "Прямо как в старые времена.";
};


func int DIA_Milten_DI_Hello_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Прямо как в старые времена.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//Ты сам сказал это. Мне даже интересно, сможешь ли ты выкарабкаться на этот раз.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Ты о чем?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//Удастся ли тебе спасти свою задницу, когда на тебя опять обрушится весь этот ад.
};


instance DIA_Milten_DI_TRADE(C_Info)
{
	npc = PC_Mage_DI;
	nr = 12;
	condition = DIA_Milten_DI_TRADE_Condition;
	information = DIA_Milten_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Есть несколько лишних зелий?";
};


func int DIA_Milten_DI_TRADE_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Есть несколько лишних зелий?
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
	CreateInvItems(self,ItPo_Health_02,15);
	Npc_RemoveInvItems(self,ItPo_Mana_02,Npc_HasItems(self,ItPo_Mana_02));
	CreateInvItems(self,ItPo_Mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Пока есть запас.
};


instance DIA_Milten_DI_Rat(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = "Какой совет ты можешь дать мне?";
};


func int DIA_Milten_DI_Rat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Milten_DI_Hello) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//Можешь дать мне какой-нибудь совет?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Ммм. Это большая честь, что ты спрашиваешь у меня совета. Но у меня в голове все это время вертится только одно.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//У тебя есть Глаз Инноса?
	Info_ClearChoices(DIA_Milten_DI_Rat);
	if(SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Нет.",DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Конечно.",DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Нет.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(возмущенно) Ты такой...Что ты будешь делать, если ты встретишься с драконами здесь, на острове?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Ты так и не поумнел? Здесь у нас есть даже алхимический стол, мы могли бы спокойно перезарядить Глаз.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//А ты о чем думаешь? Мне остается только надеяться, что твоя непредусмотрительность не будет стоить нам жизней.
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//Извини, что я задаю такой глупый вопрос. Я немного нервничаю.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};


instance DIA_Milten_DI_PEDROTOT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_PEDROTOT_Condition;
	information = DIA_Milten_DI_PEDROTOT_Info;
	description = "Я нашел Педро.";
};


func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//Я нашел Педро.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(удивленно) Что? Где? Здесь, на острове? Черт, но это абсолютно невероятно.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//Я понятия не имел, что он такой подонок.
	B_GivePlayerXP(XP_Ambient);
	if(Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//Он мертв.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//Да? Хорошо. Да упокоится его прах с миром. Хотя я не могу сказать, что мне жаль его, я все же был бы не прочь задать ему парочку вопросов.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//У меня с ним давние счеты.
	};
};


instance DIA_Milten_DI_TeachMagic(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_TeachMagic_Condition;
	information = DIA_Milten_DI_TeachMagic_Info;
	permanent = TRUE;
	description = "Я хочу повысить свои магические способности.";
};


func int DIA_Milten_DI_TeachMagic_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_TeachMagic_OneTime;

func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Я хочу повысить свои магические способности.
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//Я сделаю все, что смогу.
	}
	else if(DIA_Milten_DI_TeachMagic_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//Я помогу тебе, но только при условии, что ты позаботишься, чтобы орки оставались там, где они есть сейчас.
		DIA_Milten_DI_TeachMagic_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Хорошо. Что ты хочешь?
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создание рун",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Да ведет тебя рука Инноса.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создание рун",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Да осветит Иннос твой путь.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создание рун",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ох, нет! Я не большой специалист в этом, но мы как-нибудь справимся.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Руны паладинов",DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," Четвертый круг",DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," Пятый круг",DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," Шестой круг",DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//Ох. Ты еще не вполне готов. Сначала ты должен изучить высшие круги, а затем я смогу помочь тебе.
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Свет",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLight)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Малое исцеление",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLightHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Святая стрела",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalHolyBolt)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Среднее исцеление",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalMediumHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Изгнание зла",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalRepelEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Большое исцеление",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalFullHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("Уничтожение зла",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalDestroyEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLight);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLightHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalHolyBolt);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalMediumHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalRepelEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalFullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalDestroyEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};


instance DIA_Milten_DI_DementorObsessionBook(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DementorObsessionBook_Condition;
	information = DIA_Milten_DI_DementorObsessionBook_Info;
	description = "Эта книга, Альманах Одержимых, говорит тебе о чем-то?";
};


func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Эта книга, Альманах Одержимых, говорит тебе о чем-то?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//Пирокар эксперт по таким книгам.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Извини. Я знаю слишком мало, чтобы сказать что-либо умное об этом.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_DragonEgg(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DragonEgg_Condition;
	information = DIA_Milten_DI_DragonEgg_Info;
	description = "Ты имел дело с драконьими яйцами?";
};


func int DIA_Milten_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//Ты имел дело с драконьими яйцами?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//Нет, не совсем. Я слышал, что искусный алхимик как-то смог сварить зелье из них.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//Но, пожалуйста, не спрашивай меня о рецепте. Я понятия не имею, как оно готовится.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Хорошо. Дело сделано!";
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_UndeadDragonDead_OneTime;

func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//Хорошо. Дело сделано! Храм теперь лишен своей силы.
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//Как тебе всегда удается выходись сухим из воды?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Черт меня побери, если я знаю.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(смеется) Мы, когда-нибудь сможем пожить спокойно? Мы, определенно, заслужили это.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//Что ты собираешься делать сейчас?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//Я думаю об основании собственной академии, чтобы проповедовать нашу веру. Но из этого может ничего не получиться.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//Я никогда не жалел о том, что стал Магом Огня. А как тебе это?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//Я даже не знаю.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(смеется) Сухо, как всегда. Эй, парень. Ты только что спас мир. Разве это недостаточная причина для радости?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Ммм. Может быть.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//Да ладно, дружище, я думаю, что главное, что тебе сейчас нужно, - немного поспать.
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//Тебе нужно пойти к капитану и сказать ему, чтобы он поднимал якорь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mage_DI_PICKPOCKET(C_Info)
{
	npc = PC_Mage_DI;
	nr = 900;
	condition = DIA_Mage_DI_PICKPOCKET_Condition;
	information = DIA_Mage_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(45,120);
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,Dialog_Back,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

