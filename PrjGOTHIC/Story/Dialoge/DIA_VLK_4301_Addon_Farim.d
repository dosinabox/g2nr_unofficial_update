
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "Ты рыбак?";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ты рыбак?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//Интересно, как же ты догадался?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Не мог бы ты оставить меня в покое?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Не принимай это на свой счет, но в последнее время от ополчения у меня одни неприятности.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Не принимай на свой счет. Просто в последнее время у меня неприятности с ополчением.
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "Неприятности с ополчением?";
};


func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Неприятности с ополчением?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Эти подонки приходят ко мне и забирают все, что им вздумается.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//На прошлой неделе они забрали весь мой улов. Сказали, что он пойдет на благое дело.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Я, конечно, понимаю, что после того, как фермеры прекратили торговать с городом, все выкручиваются, как могут.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Иногда им не хватает еды. Не удивительно, что они забирают мою рыбу.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//Но если они продолжат так поступать, мне самому нечего будет есть.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Отдай мне всю свою рыбу.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Может быть, я смогу помочь.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Ты рассказывал об этом паладинам?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Ты рассказывал об этом паладинам?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//Ты шутишь? Ты действительно думаешь, что их заинтересует, что у какого-то бедняка возникли проблемы с ополчением?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Отдай мне всю свою рыбу.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(сердито) Я так и знал! Ты просто очередной подонок.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Боюсь, ты опоздал. Здесь уже побывали твои друзья, которые все забрали.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Думаю, тебе лучше уйти.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Может быть, я смогу тебе помочь.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Не знаю... Полагаю, тут нужен кто-нибудь, имеющий влияние на ополчение или паладинов.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Хотя вряд ли паладины будут покупать у меня рыбу.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Я посмотрю, что можно сделать.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"У рыбака Фарима проблемы с ополчением. Они забирают у него столько рыбы, что ему не хватает на жизнь. Чтобы помочь ему, я должен поговорить с кем-нибудь, имеющим влияние среди паладинов.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "Я знаю, как решить твои проблемы с ополчением.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Я знаю, как решить твои проблемы с ополчением.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//И как же?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Я бываю здесь слишком редко, чтобы постоянно присматривать за твоей рыбой.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//Но я знаю кое-кого, кто может тебе помочь.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Мартин, интендант паладинов, хочет выслушать твою историю об ополчении и рыбе.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//Думаешь, он сможет сделать так, чтобы люди из ополчения оставили меня в покое?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Он так сказал.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Отлично! Спасибо тебе! Мне нечем тебе заплатить... Хотя постой...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Я нашел этот странный камень на одном из островов у побережья Хориниса.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Не думаю, что он очень ценный, но такой человек, как ты, наверняка найдет ему применение.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
};


instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "Ты знаешь что-нибудь о пропавших людях?";
};


func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Ты знаешь что-нибудь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Мой друг Вильям встречался с какими-то подозрительными типами. И к чему это его привело?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Однажды он просто не пришел на работу. Больше я его не видел.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "Пропал твой приятель Вильям?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Пропал твой приятель Вильям?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Именно так. Он был рыбаком, но на мой взгляд он слишком зазнался.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Ему следовало держаться подальше от этой шайки.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"Но что это были за люди?",DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William,"Думаю, он еще появится.",DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William,"Чем он занимался?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"Когда ты видел Вильяма в последний раз?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Чем он занимался?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//У него были какие-то темные делишки с этими жуликами.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Думаю, он продавал им контрабанду.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//Но что это были за люди?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Я не знаю ни кто они, ни что им было нужно в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Могу только сказать тебе, где они встречались с Вильямом.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Я один раз увидел его, когда рыбачил в заливе.
	Info_AddChoice(DIA_Addon_Farim_William,"Где именно находится это место?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Где именно находится это место?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//К северу отсюда есть небольшая бухта.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Туда можно приплыть самому или на лодке.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//На берегу этой бухты расположен небольшой рыбацкий лагерь. Там-то я их и видел.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Рыбак Фарим пожаловался мне, что пропал его приятель Вильям. Фарим рассказал, что Вильям встречался с какими-то головорезами на пляже к северу от гавани.");
	Info_AddChoice(DIA_Addon_Farim_William,"Я услышал все, что хотел знать.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Когда ты видел Вильяма в последний раз?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Несколько дней назад.
	Info_AddChoice(DIA_Addon_Farim_William,"Может быть, он просто ушел в море рыбачить?",DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Может быть, он просто ушел в море рыбачить?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//Не похоже. Его лодка стоит на якоре в гавани.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Думаю, он еще появится.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//Вряд ли. Его не было слишком долго.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Боюсь, через некоторое время его тело прибьет к берегу волнами.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Я услышал все, что хотел знать.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Тебе не стоит беспокоиться. Не думаю, что ты его найдешь.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "Как клюет?";
};


func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Как клюет?
	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Прекрати изображать интерес.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Бывало и получше. Выжить сейчас сложно, а вот погибнуть - проще простого.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		if((Npc_HasItems(other,ITWr_Addon_William_01) > 0) || (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//А, это снова ты!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Есть какие-нибудь новости о Вильяме?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Он мертв.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(вздыхает) Так я и думал.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Что ж, спасибо, что рассказал.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Пойду-ка я в кабак и пропью его долю из нашего последнего улова. Он бы хотел, чтобы я так поступил...
};

