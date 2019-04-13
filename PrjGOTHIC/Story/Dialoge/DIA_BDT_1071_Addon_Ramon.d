
instance DIA_Addon_Ramon_EXIT(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 999;
	condition = DIA_Addon_Ramon_EXIT_Condition;
	information = DIA_Addon_Ramon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Ramon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_Checkpoint = "BL_UP_CHECK";

instance DIA_Addon_Ramon_FirstWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 1;
	condition = DIA_Addon_Ramon_FirstWarn_Condition;
	information = DIA_Addon_Ramon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if(Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_00");	//Эй, что там случилось?
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//Я укокошил Франко.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//Так что? Значит это теперь ТВОЯ забота - заставлять этих лентяев выполнять свою работу.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Эй, я здесь не для того, чтобы нянчиться с охотниками. Мне надо попасть в лагерь.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Забудь об этом. Ты убил Франко - теперь ты старший, так делай свою работу.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//Если я старший, то я решаю, кто входит следующим.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//А я решил, что следующим вхожу я.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//(смеется) Это не так просто. Мы НИКОГО не просили, так что НИКТО не войдет.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Торус может послать нового командира охотникам, тогда там освободится место для меня.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//(смеется) Ты не отстанешь, верно? Ну ладно, тогда давай сюда.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Торус позаботится о том, чтобы охотники не остались без командира.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//Чего ты ждешь? И не забудь взять кирку.
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP(XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		AI_Teleport(Carlos,"BL_WAIT_FINN");
		B_StartOtherRoutine(Carlos,"START");
		B_StartOtherRoutine(Finn,"START");
	}
	else if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Эй, чего тебе нужно? Не могу вообразить, что у тебя есть разрешение на проход в лагерь.
		if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Меня послал Франко. Он хочет узнать, не нужен ли кто-нибудь в лагере.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//Да, нужен. Вчера еще один парень дал дуба.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//Этот идиот поссорился с Эстебаном.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Кто такой Эстебан?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//Командир нижнего лагеря. Он определяет, кто пойдет в шахту.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//Так что скажи Франко, что Торусу нужен новый человек. Понял?
		Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
		B_LogEntry(Topic_Addon_Franco,"Торусу нужен еще один человек. Это может заинтересовать Франко.");
		Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn,"Торус? Сам Торус?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn,"Торус? Никогда про него слышал...",DIA_Addon_Ramon_FirstWarn_NO);
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//Эй, притормози. Ты сюда не попадешь, так что проваливай!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

func void DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Торус? Сам Торус?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Да. САМ Торус. Тот, кто принимает новых людей.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//Тот, кто решает, когда новый человек уходит с болота и приходит в лагерь.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//Может, ты хочешь сказать, что ты и раньше был знаком с Торусом?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//Ну... да...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Послушай, ВСЕ знают Торуса.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//И это значит, что ты не попадешь внутрь - и я даже не пошлю ему весточку!
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};

func void DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Торус? Никогда про него слышал...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//О, парень, ты его не знаешь? Он был начальником стражи в Старом Лагере.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//Все доверяют этому человеку.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//Он вызывает новых людей и решает, когда новички должны попасть в лагерь.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//Если ты проживешь достаточно долго, ты с ним познакомишься.
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};


instance DIA_Addon_Ramon_SecondWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 2;
	condition = DIA_Addon_Ramon_SecondWarn_Condition;
	information = DIA_Addon_Ramon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//Следующий шаг будет твоим последним!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Attack(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 3;
	condition = DIA_Addon_Ramon_Attack_Condition;
	information = DIA_Addon_Ramon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//Некоторые люди совершенно необучаемы...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_Ramon_News(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_News_Condition;
	information = DIA_Addon_Ramon_News_Info;
	permanent = FALSE;
	description = "Я тот новый человек.";
};


func int DIA_Addon_Ramon_News_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//Я тот новый человек.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Эй, не пытайся меня обдурить. Все равно Франко решает, кто из вас пойдет в лагерь.
};


instance DIA_Addon_Ramon_Lie(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_Lie_Condition;
	information = DIA_Addon_Ramon_Lie_Info;
	permanent = FALSE;
	description = "Франко послал меня...";
};


func int DIA_Addon_Ramon_Lie_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Ramon_News) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//Франко послал меня...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//Не-а. Проваливай, а не то я переломаю тебе кости...
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Perm(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 99;
	condition = DIA_Addon_Ramon_Perm_Condition;
	information = DIA_Addon_Ramon_Perm_Info;
	permanent = TRUE;
	description = "Ситуация под контролем?";
};


func int DIA_Addon_Ramon_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Ramon_News) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//Ситуация под контролем?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//Здесь все в порядке, пока в лагерь не попытается пройти кто-нибудь, кому НЕ ПОЛОЖЕНО.
	AI_StopProcessInfos(self);
};

