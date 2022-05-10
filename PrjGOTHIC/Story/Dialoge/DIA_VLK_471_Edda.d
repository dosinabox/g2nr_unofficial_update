
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
	description = "Что ты варишь?";
};


func int DIA_Edda_Hallo_Condition()
{
	if(Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//Что ты варишь?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//Уху. Может, она не особенно вкусная, но, по крайней мере, это горячая еда.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//Могу налить тебе тарелку, если хочешь.
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//Я готовлю для всех. Для тебя тоже, если захочешь. Все, что мне нужно - это чтобы ты принес мне рыбу.
};


func void B_Edda_AboutStolenStatue()
{
	if(Wld_IsTime(8,0,22,0))
	{
		AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//Но если ты ищешь, где остановиться на ночь, можешь поспать в моей хижине. Там есть еще одна кровать.
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Stadt_17_02_add");	//Если ты ищешь, где остановиться на ночь, можешь поспать в моей хижине. Есть еще одна кровать.
	};
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//А ты не боишься воров?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//Единственная ценная вещь, что у меня была, уже пропала.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//Кто-то украл мою статую Инноса.
	Edda_Schlafplatz = TRUE;
};

instance DIA_Edda_Sleep(C_Info)
{
	npc = VLK_471_Edda;
	nr = 3;
	condition = DIA_Edda_Sleep_Condition;
	information = DIA_Edda_Sleep_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Sleep_Condition()
{
	if(Wld_IsTime(22,0,8,0) && Npc_IsInState(self,ZS_Talk) && (Edda_Schlafplatz == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Edda_Sleep_Info()
{
	B_Edda_AboutStolenStatue();
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 9;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о городе?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//Что ты можешь рассказать мне о городе?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//Большинство горожан опасаются воров. Поэтому лучше не входить в чужие дома.
	if(Edda_Schlafplatz == FALSE)
	{
		B_Edda_AboutStolenStatue();
	};
};


instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "Ты можешь сварить для меня суп?";
};


func int DIA_Edda_Suppe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//Ты можешь сварить для меня суп?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//С завтрашнего дня ты можешь приходить и получать суп каждый день.
	}
	else if(Wld_IsTime(22,0,8,0))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03_add");	//Заходи попозже.
	}
	else if(Edda_Day != Wld_GetDay())
	{
		if(Npc_HasItems(other,ItFo_Fish) || Npc_HasItems(other,ItFo_SmellyFish))
		{
			if(Npc_HasItems(other,ItFo_Fish))
			{
				B_GiveInvItems(other,self,ItFo_Fish,1);
				Npc_RemoveInvItems(self,ItFo_Fish,Npc_HasItems(self,ItFo_Fish));
			}
			else
			{
				B_GiveInvItems(other,self,ItFo_SmellyFish,1);
				Npc_RemoveInvItems(self,ItFo_SmellyFish,Npc_HasItems(self,ItFo_SmellyFish));
			};
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//Нет ничего проще. Вот, держи тарелку.
			B_GiveInvItems(self,other,ItFo_EddasFishSoup,1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//Принеси мне рыбу, и я сварю тебе вкусный суп.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//Нет, не сегодня. Приходи завтра.
	};
};


instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "Посмотри, я принес статую Инноса для тебя.";
};


func int DIA_Edda_Statue_Condition()
{
	if(Edda_Schlafplatz == TRUE)
	{
		if(Npc_HasItems(other,ItMi_EddasStatue) || Npc_HasItems(other,ItMi_InnosStatue) || Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
		{
			return TRUE;
		};
	};
};

func void DIA_Edda_Statue_Info()
{
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//Посмотри, я принес статую Инноса для тебя.
	if(Npc_HasItems(other,ItMi_EddasStatue))
	{
		B_GiveInvItems(other,self,ItMi_EddasStatue,1);
		B_SetItemToSteal(self,20,ItMi_EddasStatue,1);
		B_GivePlayerXP(XP_Edda_Statue * 2);
		AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Да! Это она! Огромное тебе спасибо!
	}
	else
	{
		if(Npc_HasItems(other,ItMi_InnosStatue))
		{
			B_GiveInvItems(other,self,ItMi_InnosStatue,1);
			B_SetItemToSteal(self,20,ItMi_InnosStatue,1);
		}
		else if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
		{
			B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1);
			B_SetItemToSteal(self,20,ItMi_LostInnosStatue_Daron,1);
		};
		B_GivePlayerXP(XP_Edda_Statue);
		AI_Output(self,other,"DIA_Edda_Statue_17_01");	//Ах - огромное тебе спасибо. Да не оставит тебя свет Инноса...
	};
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//Не стоит благодарностей.
	
};

instance DIA_Edda_PICKPOCKET(C_Info)
{
	npc = VLK_471_Edda;
	nr = 900;
	condition = DIA_Edda_PICKPOCKET_Condition;
	information = DIA_Edda_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(нет ничего проще, чем украсть ее статуэтку)";
};


func int DIA_Edda_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItMi_EddasStatue) || Npc_HasItems(self,ItMi_InnosStatue) || Npc_HasItems(self,ItMi_LostInnosStatue_Daron))
	{
		return C_CanStealFromNpc(20);
	};
	return FALSE;
};

func void DIA_Edda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
	Info_AddChoice(DIA_Edda_PICKPOCKET,Dialog_Back,DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Edda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
	if(Npc_HasItems(self,ItMi_EddasStatue))
	{
		B_StealItem(20,ItMi_EddasStatue,1);
	}
	else if(Npc_HasItems(self,ItMi_InnosStatue))
	{
		B_StealItem(20,ItMi_InnosStatue,1);
	}
	else if(Npc_HasItems(self,ItMi_LostInnosStatue_Daron))
	{
		B_StealItem(20,ItMi_LostInnosStatue_Daron,1);
	};
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};

func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};

