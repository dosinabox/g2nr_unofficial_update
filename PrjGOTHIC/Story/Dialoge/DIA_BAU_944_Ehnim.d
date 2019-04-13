
instance DIA_Ehnim_EXIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 999;
	condition = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_HALLO(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 3;
	condition = DIA_Ehnim_HALLO_Condition;
	information = DIA_Ehnim_HALLO_Info;
	description = "Кто ты?";
};


func int DIA_Ehnim_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Меня зовут Эним. Я работаю здесь.
	if(Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//А коротышка вон там - мой брат Эгилл.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//Мы работаем здесь, на ферме Акила, уже несколько лет.
};


instance DIA_Ehnim_FELDARBEIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 4;
	condition = DIA_Ehnim_FELDARBEIT_Condition;
	information = DIA_Ehnim_FELDARBEIT_Info;
	description = "Как идет работа в поле?";
};


func int DIA_Ehnim_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDARBEIT_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Как идет работа?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Ты хочешь помочь? Тут есть еще одна мотыга. Бери ее и выходи в поле.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//Нужно только быть осторожным, чтобы полевые хищники не подкрались к тебе незаметно. Они сожрут тебя, даже моргнуть не успеешь.
};


instance DIA_Ehnim_FELDRAEUBER(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 5;
	condition = DIA_Ehnim_FELDRAEUBER_Condition;
	information = DIA_Ehnim_FELDRAEUBER_Info;
	description = "Почему вы ничего не делаете с этими полевыми хищниками?";
};


func int DIA_Ehnim_FELDRAEUBER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDRAEUBER_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Почему вы ничего не делаете с этими полевыми хищниками?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Я убил их столько, что уже сбился со счета. Но проблема в том, что на место убитых приходят новые.
};


instance DIA_Ehnim_STREIT1(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 6;
	condition = DIA_Ehnim_STREIT1_Condition;
	information = DIA_Ehnim_STREIT1_Info;
	description = "Твой брат сказал мне то же самое.";
};


func int DIA_Ehnim_STREIT1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && (Npc_KnowsInfo(other,DIA_Egill_STREIT2) == FALSE) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT1_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Твой брат сказал мне то же самое.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Что? Этот трус? Да он всегда исчезает, как только эти твари хотя бы приблизятся к нашей земле.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Ему не стоит нести такую чушь.
};


instance DIA_Ehnim_STREIT3(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 7;
	condition = DIA_Ehnim_STREIT3_Condition;
	information = DIA_Ehnim_STREIT3_Info;
	description = "Твой брат думает, что ты хвастун.";
};


func int DIA_Ehnim_STREIT3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT2) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT3_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Твой брат думает, что ты хвастун.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Что? У него действительно хватило мужества сказать это?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Ему лучше следить за своим языком, а то мне придется опять преподать ему урок.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Иди, и скажи ему это.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_STREIT5(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 8;
	condition = DIA_Ehnim_STREIT5_Condition;
	information = DIA_Ehnim_STREIT5_Info;
	permanent = TRUE;
	description = "Я думаю, вам двоим нужно просто остыть.";
};


var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT4) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)) && (DIA_Ehnim_STREIT5_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT5_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//Я думаю, вам двоим нужно просто остыть.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Этот ублюдок не отказался от своих слов, я прав?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//Я ему пасть порву. Скажи ему это.
	Info_ClearChoices(DIA_Ehnim_STREIT5);
	Info_AddChoice(DIA_Ehnim_STREIT5,"Делай, что хочешь. А я ухожу.",DIA_Ehnim_STREIT5_gehen);
	Info_AddChoice(DIA_Ehnim_STREIT5,"Почему ты не скажешь это ему сам?",DIA_Ehnim_STREIT5_Attack);
};

func void DIA_Ehnim_STREIT5_Attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Почему ты не скажешь это ему сам?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//Сейчас пойду и сделаю это .
	AI_StopProcessInfos(self);
	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Egill,AR_NONE,0);
	B_GivePlayerXP(XP_EgillEhnimStreit);
};

func void DIA_Ehnim_STREIT5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//Делай, что хочешь. А я ухожу.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Да, уходи отсюда.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP1(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP1_Condition;
	information = DIA_Ehnim_PERMKAP1_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP1_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk) && ((Kapitel < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP1_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Тебе мало того, что ты натворил? Я думаю, тебе лучше уйти.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_MoleRatFett(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_MoleRatFett_Condition;
	information = DIA_Ehnim_MoleRatFett_Info;
	important = TRUE;
};


func int DIA_Ehnim_MoleRatFett_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && (Kapitel >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_MoleRatFett_Info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//Ты ВСЕ ЕЩЕ здесь?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Ну да. Все еще ссоритесь?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Не твое дело. Забудь об этом. Скажи, ты не был недавно на ферме Лобарта?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Может быть. А что?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//Ох, ничего такого. Я просто хотел поговорить с Вино о  его винокурне.
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"У меня сейчас нет времени на это.",DIA_Ehnim_MoleRatFett_nein);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Винокурня? Какая винокурня?",DIA_Ehnim_MoleRatFett_was);
	if(Npc_IsDead(Vino))
	{
		Info_AddChoice(DIA_Ehnim_MoleRatFett,"Вино мертв.",DIA_Ehnim_MoleRatFett_tot);
	};
};

func void DIA_Ehnim_MoleRatFett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Вино мертв.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//О боже. Ужас-то какой.
};

func void DIA_Ehnim_MoleRatFett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Винокурня? Какая винокурня?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//Ох. Мне, наверное, не стоило говорить об этом. Вино всегда так трепетно относился к этому своему маленькому секрету.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Ну ладно, все равно уже я проболтался. В лесу, неподалеку от фермы, Вино устроил секретную винокурню.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Несколько дней назад, он попросил меня дать ему что-нибудь, чтобы смазать механизм решетки, установленной там.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//Последнее время шли дожди, и она заржавела. Лебедку заклинило, и он не может поднять решетку.
	Log_CreateTopic(TOPIC_FoundVinosKellerei,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei,LOG_Running);
	B_LogEntry(TOPIC_FoundVinosKellerei,"Эним рассказал мне, что Вино содержит секретный винокуренный завод в лесу около фермы Акила. Но механизм, открывающий дверь, заклинило, и починить его можно только смазав шестеренки жиром крысокрота.");
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"И? Ты достал смазку?",DIA_Ehnim_MoleRatFett_was_Fett);
};

func void DIA_Ehnim_MoleRatFett_was_Fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//И? Ты достал смазку?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Да, конечно. Самую лучшую. Жир крысокрота. Потрясающая вещь, скажу я тебе. Ее используют даже для смазки корабельных пушек.
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Продай мне этого жира.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill);
};


var int Ehnim_MoleRatFettOffer;

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Продай мне этого жира.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//Это обойдется тебе недешево, приятель. Он очень редко встречается в этой части страны.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Сколько?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Ммм. 100 золотых?
	Ehnim_MoleRatFettOffer = 100;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Это слишком много.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Договорились.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Договорились.
	if(B_GiveInvItems(other,self,ItMi_Gold,Ehnim_MoleRatFettOffer))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Хорошо. Вот, держи.
		if(Npc_HasItems(self,ItMi_Moleratlubric_MIS))
		{
			B_GiveInvItems(self,other,ItMi_Moleratlubric_MIS,1);
			if(Npc_IsDead(Vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(себе под нос) Ох. Вино убьет меня за это.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Черт, и куда же она подевалась? Что за досада. Извини. Похоже, у меня ее не осталось. Вот, возьми свои деньги назад .
			B_GiveInvItems(self,other,ItMi_Gold,Ehnim_MoleRatFettOffer);
			if(Npc_IsDead(Egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Готов поклясться, это проделки моего брата. Вот ублюдок.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				B_Attack(self,Egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//Так, вообще-то не поступают. Сначала ты договариваешься о сделке, а затем оказывается, что у тебя даже нет денег! Уходи, я не хочу тебя видеть!
	};
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//Это слишком много.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Хорошо, хорошо. 70 золотых. Но это мое последняя цена.
	Ehnim_MoleRatFettOffer = 70;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Это все равно слишком много.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Договорились.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//Это все равно слишком много.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(сердито) Тогда забудь об этом. Прощай.
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//У меня сейчас нет времени на это.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Тогда ее буду отвлекать тебя, парень.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP3(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP3_Condition;
	information = DIA_Ehnim_PERMKAP3_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_MoleRatFett) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP3_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//У меня нет времени на тебя.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PICKPOCKET(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 900;
	condition = DIA_Ehnim_PICKPOCKET_Condition;
	information = DIA_Ehnim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Ehnim_PICKPOCKET_Condition()
{
	return C_Beklauen(76,35);
};

func void DIA_Ehnim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,Dialog_Back,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

