
instance DIA_Bullco_EXIT(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 999;
	condition = DIA_Bullco_EXIT_Condition;
	information = DIA_Bullco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bullco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bullco_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Hallo(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 1;
	condition = DIA_Bullco_Hallo_Condition;
	information = DIA_Bullco_Hallo_Info;
	permanent = TRUE;
	description = "Нам двоим нужно поболтать...";
};


func int DIA_Bullco_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bullco_HALLO_15_00");	//Нам двоим нужно поболтать...
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_01");	//Послушай, ты победил! Теперь оставь меня в покое.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_02");	//Я ничего не хочу знать об этом.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Quatscher(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 2;
	condition = DIA_Bullco_Quatscher_Condition;
	information = DIA_Bullco_Quatscher_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_Quatscher_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Sylvio_angequatscht >= 2))
	{
		return TRUE;
	};
};

func void DIA_Bullco_Quatscher_Info()
{
	AI_Output(self,other,"DIA_Bullco_Quatscher_06_00");	//Сильвио не любит болтунов. Ты мог бы понять это уже.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
	B_Attack(self,other,AR_NONE,1);
};


var int Bullco_Leave_Day;
var int Bullco_scharf;

instance DIA_Bullco_PleaseLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 3;
	condition = DIA_Bullco_PleaseLeave_Condition;
	information = DIA_Bullco_PleaseLeave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_PleaseLeave_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) || (Sylvio_MenDefeated == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_PleaseLeave_Info()
{
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_00");	//Нам нужно поговорить. Тебе и мне.
	AI_Output(other,self,"DIA_Bullco_PleaseLeave_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_02");	//Я думаю, будет лучше для всех, если твоя физиономия больше не будет маячить на этой ферме.
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_03");	//Чтобы завтра утром тебя здесь не было. Мы поняли друг друга?
	Bullco_Leave_Day = B_GetDayPlus();
	Bullco_scharf = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
};


var int Bullco_HitCounter;

instance DIA_Bullco_DailyCheck(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 4;
	condition = DIA_Bullco_DailyCheck_Condition;
	information = DIA_Bullco_DailyCheck_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_DailyCheck_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Bullco_scharf == TRUE) && (Wld_GetDay() > Bullco_Leave_Day))
	{
		return TRUE;
	};
};

func void DIA_Bullco_DailyCheck_Info()
{
	if(Bullco_HitCounter == 0)
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_00");	//Ты все еще здесь...
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_01");	//А я-то думал, мы договорились, что я позволю тебе уйти с миром.
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_02");	//Тебе стоило прислушаться к моим словам.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_03");	//Глазам своим не верю! Этот урод все еще здесь!
	};
	Bullco_HitCounter = Bullco_HitCounter + 1;
	Bullco_Leave_Day = B_GetDayPlus();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bullco_WontLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 5;
	condition = DIA_Bullco_WontLeave_Condition;
	information = DIA_Bullco_WontLeave_Info;
	permanent = FALSE;
	description = "Я НЕ СОБИРАЮСЬ уходить отсюда!";
};


func int DIA_Bullco_WontLeave_Condition()
{
	if(Bullco_scharf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_WontLeave_Info()
{
	AI_Output(other,self,"DIA_Bullco_WontLeave_15_00");	//Я НЕ СОБИРАЮСЬ уходить отсюда!
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_01");	//(вздыхает) Похоже, нам придется обсудить этот вопрос опять.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_02");	//(ворчливо) Да, да, иди, расскажи это кому-нибудь, кому это интересно.
		Bullco_scharf = FALSE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bullco_PepesSchafe(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 6;
	condition = DIA_Bullco_PepesSchafe_Condition;
	information = DIA_Bullco_PepesSchafe_Info;
	permanent = FALSE;
	description = "Тебе имя Пепе говорит о чем-нибудь?";
};


func int DIA_Bullco_PepesSchafe_Condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && (Bullco_scharf == TRUE) && (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bullco_PepesSchafe_Info()
{
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_00");	//Тебе имя Пепе говорит о чем-нибудь?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_01");	//Я абсолютно не понимаю, о чем ты говоришь, но твой тон мне не нравится!
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_02");	//Ты должен был охранять овец.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_03");	//Какое мне дело до овец?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_04");	//До них есть дело Ли.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_05");	//На что ты намекаешь?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_06");	//Если ты продолжишь действовать мне на нервы, я позабочусь, чтобы тебе пришлось заплатить за овец.
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_07");	//Так что если тебя волнует твое жалование, оставь меня в покое!
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_08");	//(в ярости) Ты, ты...
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_09");	//(спокойно) Да?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_10");	//(себе под нос) Мерзкий коварный ублюдок...
	Bullco_scharf = FALSE;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_BullcoSLD_PICKPOCKET(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 900;
	condition = DIA_BullcoSLD_PICKPOCKET_Condition;
	information = DIA_BullcoSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_BullcoSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(56,35);
};

func void DIA_BullcoSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,Dialog_Back,DIA_BullcoSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BullcoSLD_PICKPOCKET_DoIt);
};

func void DIA_BullcoSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

func void DIA_BullcoSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

