
var int diego_coming;

instance DIA_Gerbrandt_EXIT(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 999;
	condition = DIA_Gerbrandt_EXIT_Condition;
	information = DIA_Gerbrandt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	if(DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc(PC_Thief_NW);
		if(Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"NEWLIFE");
		B_StartOtherRoutine(GerbrandtsFrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerbrandt_PICKPOCKET(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 900;
	condition = DIA_Gerbrandt_PICKPOCKET_Condition;
	information = DIA_Gerbrandt_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть его кошелек будет легко)";
};


func int DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET,Dialog_Back,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
};


instance DIA_Gerbrandt_Hello(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 5;
	condition = DIA_Gerbrandt_Hello_Condition;
	information = DIA_Gerbrandt_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Gerbrandt_Hello_Condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//А ты кто такой? Похоже, ты недавно здесь и понятия не имеешь, с кем имеешь дело.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Меня зовут Гербрандт. А для тебя я мистер Гербрандт. Понял?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Я понял, Гербрандт.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Я понял, мистер Гербрандт.",DIA_Gerbrandt_Hello_Yes);
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Я понял, Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Попридержи язык! Тебе лучше проявлять уважение ко мне, иначе у тебя будут большие проблемы...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Здесь я вершу закон. Тому, кто создает проблемы, придется держать ответ передо мной. И лучше ему сразу бежать из города со всех ног, потому что после того, как я разберусь с ним, он пожалеет, что попался мне на глаза!
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Большинство людей в порту работает на меня. И если ты ищешь работу, тебе лучше побеспокоиться, чтобы мои воспоминания о тебе были приятными.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Я понял, мистер Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Ну, по крайней мере, тебе не потребовалось много времени, чтобы понять, куда здесь ветер дует.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Как только бизнес опять пойдет в гору, у меня наверняка найдется работа для такого смышленого паренька, как ты.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//Из тебя бы получился отличный кладовщик.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Ты умеешь читать?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Нет.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Мне не нужна работа.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Конечно.",DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Ничего, по крайне мере, ты сможешь переложить несколько мешков с места на место.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//И если я буду доволен тобой, возможно, я даже предложу тебе постоянное место. Здесь всегда много работы.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Что ж, тогда я жду тебя у себя, как только к пристани пришвартуется первый торговый корабль.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Мне не нужна работа.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Ты думаешь, ты ужасно крут. Смотри, никто не может получить работу здесь без моего одобрения.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//И если ты продолжишь оскорблять меня, ты можешь сразу искать себе соломенный тюфяк с клопами, потому что это будет все, что ты сможешь себе позволить.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Еще придет время, когда ты будешь умолять меня дать тебе работу.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Отлично. В наши времена тяжело найти обученных работников.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Как насчет твоих рекомендаций?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Рекомендаций?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Хорошо, я запомню твое лицо. Когда торговля возобновится опять, приходи ко мне. Тогда я дам тебе работу.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void B_GErbrandt_PissOff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Что это все значит - ты издеваешься надо мной?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ты и твой приятель Диего уже и так дел натворили.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Оставь меня в покое!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Gerbrandt_Perm(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 800;
	condition = DIA_Gerbrandt_Perm_Condition;
	information = DIA_Gerbrandt_Perm_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};


func int DIA_Gerbrandt_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Есть новости?
	if(Kapitel <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Людям вроде тебя нечего делать здесь. Здесь живут порядочные члены общества, а не какие-нибудь бродяги и проходимцы.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Если тебе когда-нибудь удастся стать богатым и уважаемым, возможно, тебе будут более рады здесь.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Мне не на что жаловаться, о, благородный рыцарь.
		};
	}
	else if(Kapitel >= 3)
	{
		if(MIS_DiegosResidence != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Много я видал таких людей как ты - вы просто не знаете своего места.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Мне стоит поговорить с губернатором об усилении мер безопасности в верхнем квартале.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Это никого не касается кроме меня. Я занят!
			};
		}
		else
		{
			B_GErbrandt_PissOff();
		};
	};
};


instance DIA_Gerbrandt_GreetingsFromDiego(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information = DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent = FALSE;
	description = "Диего передает тебе привет.";
};


func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if((MIS_DiegosResidence == LOG_Running) && (Npc_HasItems(other,ItWr_DiegosLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Диего передает тебе привет.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(испуганно) Что? Кто? Какой Диего?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//Он попросил меня вручить тебе это письмо.
	B_GiveInvItems(other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(возбужденно) Этого не может быть. Нет. Мне конец!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(в страхе) Он что, уже в городе?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Кто?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Диего, конечно же!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Да, я должен скоро встретиться с ним.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(в отчаянии, про себя) Это конец! Все пропало!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//У меня нет времени, мне нужно уходить отсюда. Быстро. Если он найдет меня здесь, мне конец!
	MIS_DiegosResidence = LOG_SUCCESS;
	B_GivePlayerXP(XP_DiegosResidence);
	DIEGO_COMING = TRUE;
};

