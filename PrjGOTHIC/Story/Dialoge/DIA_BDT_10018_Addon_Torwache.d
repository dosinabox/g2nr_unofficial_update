
instance DIA_Addon_BDT_10018_Torwache_EXIT(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 999;
	condition = DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information = DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent = TRUE;
	description = "Мы еще поговорим.";
};


func int DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00");	//Мы еще поговорим.
	if(BDT_100018_Einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//Ты знаешь, что я тебе скажу...
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Отвали.
	};
	AI_StopProcessInfos(self);
};


const string BDT_10018_Checkpoint = "BL_RAVEN_CHECK";

instance DIA_Addon_BDT_10018_Torwache_FirstWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 1;
	condition = DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,BDT_10018_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	if(BDT_100018_Tells == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Эй, притормози! Ты туда не попадешь, так что отвали!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Уйди с дороги - мне нужно поговорить с Вороном.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//Никто не должен входить сюда. Прямой приказ Ворона.
		BDT_100018_Tells = TRUE;
		Log_CreateTopic(Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Tempel,LOG_Running);
		B_LogEntry(Topic_Addon_Tempel,"Охранник у ворот не пропустит меня в храм. Я должен найти способ попасть внутрь.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//Снова ты? Ты начинаешь меня доставать!
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Addon_BDT_10018_Torwache_SecondWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//Следующий шаг станет для тебя последним!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10018_Torwache_Attack(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 3;
	condition = DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information = DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//За Ворона!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_BDT_10018_Torwache_Hi(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Hi_Condition;
	information = DIA_Addon_10018_Torwache_Hi_Info;
	permanent = FALSE;
	description = "Это чертовски важно, я просто должен попасть к нему.";
};


func int DIA_Addon_10018_Torwache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10018_Torwache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//Это чертовски важно, я просто должен попасть к нему.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//Нет. Это НЕ важно. Только Бладвин может находиться здесь.
	B_LogEntry(Topic_Addon_Tempel,"В храм позволено заходить только Бладвину. Возможно, я смогу попасть туда через него.");
};


instance DIA_Addon_BDT_10018_Torwache_Bloodwyn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information = DIA_Addon_10018_Torwache_Bloodwyn_Info;
	permanent = FALSE;
	description = "Бладвин? А разве он не погиб?";
};


func int DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Бладвин? А разве он не погиб?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//Он сильнее, чем когда-либо. И если он выяснит, что кто-то создает проблемы, он порубит тебя в фарш.
};


instance DIA_Addon_BDT_10018_Torwache_Bribe(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 9;
	condition = DIA_Addon_10018_Torwache_Bribe_Condition;
	information = DIA_Addon_10018_Torwache_Bribe_Info;
	permanent = FALSE;
	description = "Я дам тебе тысячу золотых, если ты впустишь меня.";
};


func int DIA_Addon_10018_Torwache_Bribe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//Я дам тебе тысячу золотых, если ты впустишь меня.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//Теряешь свое время, приятель.
};


instance DIA_Addon_BDT_10018_Torwache_Drin(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_Drin_Condition;
	information = DIA_Addon_10018_Torwache_Drin_Info;
	permanent = FALSE;
	description = "Бладвин там, внутри? Тогда позови его.";
};


func int DIA_Addon_10018_Torwache_Drin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Drin_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Бладвин там, внутри? Тогда позови его.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ха! Ты действительно думаешь, что я это сделаю?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//Может быть, в лагере ты теперь и важная персона. Но твоя власть заканчивается ПРЯМО ЗДЕСЬ. Теперь понял?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//Так что пойди поработай в шахте или займись чем-нибудь еще - но не загораживай здесь проход!
	MIS_BloodwynRaus = LOG_Running;
	B_LogEntry(Topic_Addon_Tempel,"Бладвин находится в храме. Но это мне ничего не дает. Возможно, мне стоит наведаться в шахту.");
};


instance DIA_Addon_BDT_10018_Torwache_kopf(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_kopf_Condition;
	information = DIA_Addon_10018_Torwache_kopf_Info;
	permanent = FALSE;
	description = "(показать голову Бладвина)";
};


func int DIA_Addon_10018_Torwache_kopf_Condition()
{
	if(Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Вот! Ты все еще хочешь остановить меня?!
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Это что... это... Бладвин?.. (тошнит) Это...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//Н-нет... Я хочу сказать... Да, проходи...
	MIS_BloodwynRaus = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

