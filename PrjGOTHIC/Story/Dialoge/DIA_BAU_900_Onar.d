
instance DIA_Onar_EXIT(C_Info)
{
	npc = Bau_900_Onar;
	nr = 999;
	condition = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Onar_Hallo(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Onar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Onar_Hallo_Info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Кто пустил тебя сюда?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Что ты делаешь на моей ферме?!
};


instance DIA_Onar_PERM(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent = TRUE;
	description = "Здесь все в порядке, на твоей ферме?";
};


func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DIA_Onar_PERM_Info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Здесь все в порядке, на твоей ферме?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Я не понимаю, какое тебе до этого может быть дело. Ты не работаешь здесь!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Очень надеюсь, что да! В конце концов, именно за это я тебе и плачу!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Тебе лучше пойти, поговорить с Торлофом, может быть, у него есть работа для тебя.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Да, конечно. Ты можешь идти, охотиться на своих драконов.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Вам, лицемерным ублюдкам из монастыря, сюда вход закрыт!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Наше гостеприимство не распространяется на войска короля.
	};
};


instance DIA_Onar_Work(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent = FALSE;
	description = "Я хочу работать на тебя!";
};


func int DIA_Onar_Work_Condition()
{
	if(Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Я хочу работать на тебя!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Мне сейчас не нужны рабочие.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Мои люди прекрасно со всем справляются.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Тебе нечего делать в моем доме, убирайся!
};


instance DIA_Onar_WorkAsSld(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent = FALSE;
	description = "Я хочу поработать здесь в качестве наемника!";
};


func int DIA_Onar_WorkAsSld_Condition()
{
	if((Lee_SendToOnar == FALSE) && (Onar_WegenSldWerden == FALSE) && Npc_KnowsInfo(other,DIA_Onar_Work))
	{
		return TRUE;
	};
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Я хочу поработать здесь в качестве наемника!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ты? Наемника? Не смеши меня! Если бы из тебя мог получиться хороший наемник, Ли наверняка рассказал бы мне о тебе.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//А теперь убирайся отсюда, и поживее!
	Onar_WegenSldWerden = TRUE;
};


instance DIA_Onar_Aufstand(C_Info)
{
	npc = Bau_900_Onar;
	nr = 3;
	condition = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent = FALSE;
	description = "Ты противостоишь городу, как я слышал?";
};


func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Ты противостоишь городу, как я слышал?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//А теперь послушай ты. Я унаследовал эту ферму и эту землю от своего отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//А он унаследовал ее от СВОЕГО отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Я не позволю этому жадному идиоту, называющему себя королем, разорить меня только для того, чтобы накормить свои бесполезные армии.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Война с орками длится уже целую вечность. И к чему мы пришли? Мы стоим на грани поражения.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Нет - я предпочитаю оборонять свою ферму самостоятельно! Деньги, что я сберегу таким образом, пойдут на оплату моей собственной армии.
};


instance DIA_Onar_WegenPepe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 4;
	condition = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent = FALSE;
	description = "Можешь благодарить Булко, у тебя стало на несколько овец меньше.";
};


func int DIA_Onar_WegenPepe_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Можешь благодарить Булко, у тебя стало на несколько овец меньше.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//О чем это ты говоришь? Кто такой Булко?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Один из наемников.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Какое мне до этого дело? Если он притронулся к моим овцам, он будет отвечать перед Ли.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Зачем ты отвлекаешь меня по таким пустякам?
	Onar_WegenPepe = TRUE;
};


instance DIA_Onar_WegenSekob(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent = FALSE;
	description = "Я пришел по поводу ренты Секоба...";
};


func int DIA_Onar_WegenSekob_Condition()
{
	if(MIS_Sekob_RedeMitOnar == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Я пришел по поводу ренты Секоба...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//Что, черт возьми, тебе нужно здесь? Отнеси деньги Торлофу.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Какого дьявола ты лезешь в это дело?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Я хочу стать наемником. Собрать ренту - это мое испытание.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Но у Секоба нет денег. Я даже пытался выбить их из него.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Он сказал, что это из-за плохого урожая...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(вопит) Ты безмозглый кретин! Ты что думаешь, он носит деньги с собой? Он их где-то прячет!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Да ты знаешь, сколько дождей было в этот год? Плохой урожай! Надо же!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Иди, и найди способ выбить из него эти деньги.
	Onar_WegenSekob = TRUE;
};


instance DIA_Onar_LeeSentMe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent = FALSE;
	description = "Меня послал Ли. Я хочу работать в качестве наемника!";
};


func int DIA_Onar_LeeSentMe_Condition()
{
	if((Lee_SendToOnar == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Меня послал Ли. Я хочу работать в качестве наемника!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Он уже говорил со мной.
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//При нашей первой встрече у меня сложилось о тебе не самое лучшее мнение.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Но раз Ли полагает, что ты справишься, я, пожалуй, дам тебе шанс.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//В конце концов, он отвечает за тебя. Так что приступай к своим обязанностям.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Но не выводи меня из себя! Оставь фермеров и служанок в покое, и даже не думай стащить что-нибудь, понятно?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//А нам с тобой нужно обсудить только твое жалование.
	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"Онар дал мне свое одобрение. Теперь ничто не препятствует моему вступлению в ряды наемников.");
};


var int Onar_SOLD_Day;
var int Onar_SOLD_XP;

instance DIA_Onar_HowMuch(C_Info)
{
	npc = Bau_900_Onar;
	nr = 7;
	condition = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent = FALSE;
	description = "Так что насчет моего жалования?";
};


func int DIA_Onar_HowMuch_Condition()
{
	if(Onar_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_HowMuch_Info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Так что насчет моего жалования?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Так, посмотрим...
	SOLD = 50;
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Я не самого лучшего мнения о тебе.
	};
	if(Onar_WegenSekob == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Ты не отличаешься особой сообразительностью. Это очевидно после твоих похождений к Секобу.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_Farm > 1) || ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Ты уже неоднократно создавал проблемы здесь, на ферме.
		SOLD = SOLD - 10;
	};
	if((Onar_WegenPepe == TRUE) && ((Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//И ты постоянно допекаешь меня всяким вздором.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Дай мне подумать...
	B_Say_Gold(self,other,SOLD);
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Что скажешь?
	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch,"Хорошо!",DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch,"Здесь не все...",DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch,"В день?",DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//В день?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Кем ты себя возомнил? В неделю! Да и это для тебя много.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Давай, подойди сюда и забери свои деньги.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Я не собираюсь подносить их тебе.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//Здесь не все...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Конечно, но ты можешь поработать на меня совсем бесплатно, если хочешь.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Это все, что ты получишь!
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Хорошо!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Я тоже так думаю. А теперь иди, поговори с Ли.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};


instance DIA_Onar_CollectGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 8;
	condition = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent = TRUE;
	description = "Заплати мне мое жалование!";
};


func int DIA_Onar_CollectGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Onar_HowMuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Заплати мне мое жалование!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//Я плачу наемникам, а не охотникам на драконов.
	}
	else if(Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Ты плохо справляешься со своими поручениями!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Я спросил Торлофа, как у тебя идут дела. И он сказал мне, что на выполнение работы у тебя уходит целая вечность.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Я не собираюсь платить лодырям.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Теперь ты должен отработать несколько недель без оплаты! Может быть, тогда ты усвоишь этот урок.
	}
	else if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Я слышал, что ты устроил заварушку. Сначала пойди к Ли и урегулируй этот вопрос.
	}
	else if(Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Ты что, совсем выжил из ума?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Ты должен поработать у меня хотя бы день. Ты получишь свое жалование завтра.
	}
	else if((Wld_GetDay() - 2) >= Onar_SOLD_Day)
	{
		if((Wld_GetDay() - 2) == Onar_SOLD_Day)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Где ты был вчера?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Где ты был последние пару дней?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Да ты здесь даже не появлялся!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//Кто знает, где ты шлялся.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (Onar_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(сокрушенно) Ох, ладно. Вот твое жалование.
			B_GiveInvItems(self,other,ItMi_Gold,SOLD);
			B_Say_Gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Что? Да ты же ничего не делал, только спал и слонялся из угла в угол!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Я не собираюсь платить за это!
		};
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};


instance DIA_Onar_MariaGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 9;
	condition = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent = FALSE;
	description = "Мария думает, что я получаю недостаточно.";
};


func int DIA_Onar_MariaGold_Condition()
{
	if(Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Мария думает, что я получаю недостаточно.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Что?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Она сказала, что ты должен платить мне больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(ворчливо) Эта баба сует свой нос во все щели.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Она сказала сколько?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Нет.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Хорошо, начиная со следующего жалования, ты будешь получать на 10 монет больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Но ни монетой больше, понятно?
	SOLD = SOLD + 10;
};


var int Onar_SellSheep;

instance DIA_Onar_WannaSheep(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_WannaSheep_Condition;
	information = DIA_Onar_WannaSheep_Info;
	permanent = TRUE;
	description = "Я хочу купить овцу!";
};


func int DIA_Onar_WannaSheep_Condition()
{
	if(Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Я хочу купить овцу!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//А что ты тогда здесь делаешь? Ты где-то видишь здесь овцу?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Я...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Если ты хочешь купить овцу, иди на пастбище. Оно находится справа от моего дома.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Пепе продаст тебе одну.
	if(Npc_IsDead(Pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Боюсь, что Пепе мертв.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Ох! В таком случае... оставь 200 золота мне, и сам выбери себе овцу на пастбище.
		Onar_SellSheep = TRUE;
	};
};


instance DIA_Onar_BuyLiesel(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_BuyLiesel_Condition;
	information = DIA_Onar_BuyLiesel_Info;
	permanent = TRUE;
	description = "Вот, держи, 200 золотых монет. Дай мне овцу.";
};


func int DIA_Onar_BuyLiesel_Condition()
{
	if(Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Вот, держи, 200 золотых монет. Дай мне овцу.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Ты можешь сам выбрать себе овцу на пастбище.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Одна из них обязательно пойдет за тобой. Большинство моих овец отзываются на имя Бетси.
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//У тебя нет столько золота! Не трать понапрасну мое драгоценное время.
	};
};

