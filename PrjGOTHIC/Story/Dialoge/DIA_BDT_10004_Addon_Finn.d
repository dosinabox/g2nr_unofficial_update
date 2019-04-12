
instance DIA_Addon_Finn_EXIT(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 999;
	condition = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Finn_PICKPOCKET(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 900;
	condition = DIA_Addon_Finn_PICKPOCKET_Condition;
	information = DIA_Addon_Finn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,Dialog_Back,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};


instance DIA_Addon_Finn_Hacker(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent = TRUE;
	description = "Снова за работой?";
};


func int DIA_Addon_Finn_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Снова за работой?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Да, я хочу выбрать из этой шахты все золото до последнего кусочка.
};


instance DIA_Addon_Finn_Hi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 1;
	condition = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Finn_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Привет!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//(сердито) Что тебе нужно?
};


instance DIA_Addon_Finn_Hacke(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 2;
	condition = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent = FALSE;
	description = "Где я могу взять кирку?";
};


func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Где я могу взять кирку?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//Спроси у кузнеца Хуно. Но наличие кирки еще не даст тебе права войти в шахту.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Если ты хочешь войти, тебе нужно поговорить с Эстебаном.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//А с Торусом можешь даже не пытаться говорить - он впустит тебя, только если у тебя будет красный камень.
};


instance DIA_Addon_Finn_Esteban(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 3;
	condition = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent = FALSE;
	description = "Скажи мне, что ты думаешь об Эстебане?";
};


func int DIA_Addon_Finn_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Скажи мне, что ты думаешь об Эстебане?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(осторожно) Он здесь босс... он... по-моему, он свой парень.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(нерешительно) Он всегда отправляет в шахту правильных ребят. Тех, кто знает свое дело, я имею в виду.
};


instance DIA_Addon_Finn_Profi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 4;
	condition = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent = FALSE;
	description = "А ты знаешь это дело?";
};


func int DIA_Addon_Finn_Profi_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//А ты знаешь это дело?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Я в нем лучший!
};


instance DIA_Addon_BDT_10004_Finn_Mine(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 5;
	condition = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Finn_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Конечно, босс. Ты хочешь, чтобы в шахте работали лучшие люди? Тогда я вернусь к делу...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//Да, и кое-что еще. Это один секрет рудокопов.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//От века и поныне хорошая идея - рубить посильнее.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Если ты копнешь пару раз без видимого результата, попробуй провести концом кирки вдоль камня.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//Если тебе повезет, таким образом ты получишь несколько кусков за раз.
	B_Upgrade_Hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Finn_Gold(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 6;
	condition = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Finn_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Ну и еще одно, что следует знать. Золото - это не руда. Есть большая разница.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Я имею в виду, что ни одна женщина не будет носить на шее ожерелье из кусков руды. (смеется)
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Когда будешь копать, иди сверху вниз. Так самородки будет проще вынуть.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//Есть и рудокопы, которые делают все наоборот - но это много сложнее.
	B_Upgrade_Hero_HackChance(10);
};


instance DIA_Addon_Finn_ein(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 7;
	condition = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent = TRUE;
	description = "Можешь ты оценить мои умения рудокопа?";
};


func int DIA_Addon_Finn_ein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};


var int Finn_einmal;
var int Finn_Gratulation;

func void DIA_Addon_Finn_ein_Info()
{
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Можешь ты оценить мои умения рудокопа?
	if(Finn_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Конечно. Я занимаюсь этим больше 35 лет. Нет ничего, чтобы я не мог оценить!
		Finn_einmal = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//Что касается тебя, то ты...
	if(Hero_HackChance < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//совершенный новичок.
	}
	else if(Hero_HackChance < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//вполне сносный работник.
	}
	else if(Hero_HackChance < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//опытный золотоискатель.
	}
	else if(Hero_HackChance < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//настоящий рудокоп.
	}
	else if(Hero_HackChance < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//чертовски хороший рудокоп.
	}
	else if(Hero_HackChance < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//великий рудокоп.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//гуру среди рудокопов.
		if(Finn_Gratulation == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Теперь ты так же хорош, как я. Поздравляю, партнер.
			B_GivePlayerXP(XP_Ambient * 2);
			Snd_Play("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	concatText = ConcatStrings("Goldhacken: ",IntToString(Hero_HackChance));
	concatText = ConcatStrings(concatText," Prozent");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};


instance DIA_Addon_Finn_Attentat(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 8;
	condition = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent = FALSE;
	description = "Насчет попытки покушения на Эстебана...";
};


func int DIA_Addon_Finn_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(осторожно) Да?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//У тебя есть идеи, кто стоит за всем этим?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//А зачем тебе это?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Я хочу поговорить с ним...",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Эстебан больше не хочет видеть его среди живых!",DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(повествуя) Когда произошло нападение, я собирался забрать свою кирку от кузнеца Хуно.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Но его на месте не было.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//И?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//А обычно он ВСЕГДА на месте. ОЧЕНЬ подозрительно - вот что я думаю.
	Finn_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Финн сказал, что Хуно не присутствовал при атаке.");
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Эстебан больше не хочет видеть его среди живых!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//О! Ты работаешь на босса?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Тогда я тебе скажу, что я знаю.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Я хочу поговорить с ним...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(осторожно) Да? И что тебе от него нужно?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Это не твое дело!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"У меня есть для него информация, которая может оказаться интересной!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Я хочу устранить Эстебана, и мне нужен союзник!",DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Я хочу устранить Эстебана, и мне нужен союзник!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Я в это дело ввязываться не буду!
	Finn_Petzt = TRUE;
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//У меня есть для него информация, которая может оказаться интересной!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Ты в сговоре с тем, кто это устроил, правда?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Я хочу устранить Эстебана, и мне нужен союзник!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Это не твое дело!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Конечно, нет!",DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Конечно, нет!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(оценивающе) Хорошо! Я расскажу тебе то, что я знаю.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//Это не твое дело!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//Да? Ну тогда я ничего об этом не знаю.
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};


instance DIA_Addon_Finn_Again(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent = TRUE;
	description = "И снова о нападении...";
};


func int DIA_Addon_Finn_Again_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//И снова о нападении...
	if(Finn_TellAll == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//Я тебе уже сказал все, что я знаю.
		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again,"Хорошо... (назад)",DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again,"Тогда расскажи мне еще раз!",DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//Оставь меня в покое с этой чепухой!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(оценивающе) Ладно...
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Тогда расскажи мне еще раз!
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

