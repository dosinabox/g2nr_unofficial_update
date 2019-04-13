
instance DIA_Rumbold_EXIT(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 999;
	condition = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_PrePerm(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_PrePerm_Condition;
	information = DIA_Rumbold_PrePerm_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Rumbold_PrePerm_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//Что вы делаете здесь?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Проваливай! Понял?
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_Hallo(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_Hallo_Condition;
	information = DIA_Rumbold_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rumbold_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//Посмотрите на него! Еще один клоун! Что ты здесь делаешь, а?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Кто ты, черт тебя побери?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//Еще один из этих грязных наемников!
	};
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"Я никто.",DIA_Rumbold_HALLO_schwanzeinziehen);
	Info_AddChoice(DIA_Rumbold_Hallo,"Я хочу, чтобы вы исчезли отсюда.",DIA_Rumbold_HALLO_verschwindet);
	Info_AddChoice(DIA_Rumbold_Hallo,"Я твой худший кошмар.",DIA_Rumbold_HALLO_Attack);
};

func void DIA_Rumbold_HALLO_Attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//Я твой худший кошмар.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//Считай, что ты уже труп!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//Я хочу, чтобы вы исчезли отсюда.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//Так-так. То есть, ты хочешь, чтобы мы исчезли?
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(угрожающе) А что будет, если мы этого не сделаем, эй?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"А что если я заплачу вам, чтобы вы убрались отсюда?",DIA_Rumbold_HALLO_geld);
	Info_AddChoice(DIA_Rumbold_Hallo,"В таком случае, вы больше никогда не сможете беспокоить этих фермеров.",DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//В таком случае, вы больше никогда не сможете беспокоить этих фермеров.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//Ты откусил больше, чем можешь проглотить, кретин!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//А что если я заплачу вам, чтобы вы убрались отсюда?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//Ты хочешь заплатить за Бенгара? Это другое дело.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Дай подумать. Учитывая все, что он нам задолжал, это будет 65 золотых монет.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Либо плати, либо убирайся с дороги.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//Ох. А ты что, казначей Бенгара?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"Ты с ума сошел? Это слишком много.",DIA_Rumbold_HALLO_Geld_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 65)
	{
		Info_AddChoice(DIA_Rumbold_Hallo,"Вот деньги. А теперь проваливайте.",DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Вот деньги. А теперь проваливайте.
	B_GiveInvItems(other,self,ItMi_Gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//Меня не волнует, кто платит за Бенгара. Удачи. (себе под нос) Кретин!
	AI_StopProcessInfos(self);
	Rumbold_Bezahlt = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"Start");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Bengar) && !Npc_IsDead(Bengar))
	{
		Npc_ExchangeRoutine(Bengar,"Start");
		AI_ContinueRoutine(Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Ты с ума сошел? Это слишком много.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//Тогда прочь с дороги!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//Я никто.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//Тогда убирайся с моей дороги!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_FightNow(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_FightNow_Condition;
	information = DIA_Rumbold_FightNow_Info;
	permanent = TRUE;
	description = "Оставьте этого фермера в покое!";
};


func int DIA_Rumbold_FightNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Оставьте этого фермера в покое!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//Ты что, оглох, сынок?
	Info_ClearChoices(DIA_Rumbold_FightNow);
	Info_AddChoice(DIA_Rumbold_FightNow,Dialog_Ende,DIA_Rumbold_FightNow_ENDAttack);
};

func void DIA_Rumbold_FightNow_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_StillThere(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_StillThere_Condition;
	information = DIA_Rumbold_StillThere_Info;
	permanent = TRUE;
	description = "Вы еще здесь?!";
};


func int DIA_Rumbold_StillThere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Вы еще здесь?!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//Сейчас ты у меня попляшешь!
	Info_ClearChoices(DIA_Rumbold_StillThere);
	Info_AddChoice(DIA_Rumbold_StillThere,Dialog_Ende,DIA_Rumbold_StillThere_ENDAttack);
};

func void DIA_Rumbold_StillThere_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_PICKPOCKET(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 900;
	condition = DIA_Rumbold_PICKPOCKET_Condition;
	information = DIA_Rumbold_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Rumbold_PICKPOCKET_Condition()
{
	return C_Beklauen(24,45);
};

func void DIA_Rumbold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,Dialog_Back,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

