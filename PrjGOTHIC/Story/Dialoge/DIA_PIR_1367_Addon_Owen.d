
instance DIA_Addon_Owen_EXIT(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 999;
	condition = DIA_Addon_Owen_EXIT_Condition;
	information = DIA_Addon_Owen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Owen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Owen_PICKPOCKET(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 900;
	condition = DIA_Addon_Owen_PICKPOCKET_Condition;
	information = DIA_Addon_Owen_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Owen_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Owen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,Dialog_Back,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};


instance DIA_Addon_Owen_Hello(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_Hello_Condition;
	information = DIA_Addon_Owen_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Owen_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Hello_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//А ты кто такой? Один из бандитов?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//А что, похож?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Одет ты так же, как и мы, но я тебя не знаю.
	}
	else if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Честно говоря, да.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Нет. Судя по твоей одежде, ты издалека.
	};
};


instance DIA_Addon_Owen_WasMachen(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_WasMachen_Condition;
	information = DIA_Addon_Owen_WasMachen_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Addon_Owen_WasMachen_Condition()
{
	if(Malcom_Accident == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Рублю деревья для нашего лагеря.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//Я здесь работаю как проклятый, гну спину, а они там в лагере валяются на солнышке.
};


instance DIA_Addon_Owen_Perm(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 99;
	condition = DIA_Addon_Owen_Perm_Condition;
	information = DIA_Addon_Owen_Perm_Info;
	permanent = TRUE;
	description = "И?";
};


func int DIA_Addon_Owen_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_WasMachen) || Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//И?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Если бы я знал, что все будет именно так, я бы ни за что не стал пиратом.
};


instance DIA_Addon_Owen_Henry(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_Henry_Condition;
	information = DIA_Addon_Owen_Henry_Info;
	permanent = TRUE;
	description = "Генри нужно дерево.";
};


func int DIA_Addon_Owen_Henry_Condition()
{
	if((MIS_Henry_HolOwen == LOG_Running) && (Owen_ComesToHenry == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Henry_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Генри нужно дерево.
	if(MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//Сначала я должен выяснить, что случилось с моим другом Малькомом.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Расслабься. Получит он рано или поздно свое дерево.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Так ему и передай.
		B_LogEntry(TOPIC_Addon_HolOwen,"Я должен передать Генри, что Оуэн доставит дерево.");
		AI_StopProcessInfos(self);
		Owen_ComesToHenry = TRUE;
	};
};


instance DIA_Addon_Owen_MalcomStunt(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_MalcomStunt_Condition;
	information = DIA_Addon_Owen_MalcomStunt_Info;
	description = "Как дела?";
};


func int DIA_Addon_Owen_MalcomStunt_Condition()
{
	if(Malcom_Accident == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomStunt_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//Мой приятель Мальком пропал.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//На нас напал один из этих луркеров.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Мы убежали в эту пещеру.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Но луркер последовал за нами.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Мальком начал с ним сражаться, а потом они оба упали в ту яму.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Похоже, там на дне вода.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Я слышал, как внизу Мальком дерется с луркером. А потом все стихло.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Не знаю, жив ли еще Мальком.
	Log_CreateTopic(TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MalcomsStunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Оуэн хочет узнать, что случилось с его другом Малькомом, который упал в глубокую яму после того, как схватился с луркером.");
	Log_AddEntry(TOPIC_Addon_MalcomsStunt,"Оуэн сказал мне, что на дне ямы вода, и сначала упавший туда Мальком был жив. Но через некоторое время шум в яме стих.");
	MIS_Owen_FindMalcom = LOG_Running;
};


instance DIA_Addon_Owen_runter(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_runter_Condition;
	information = DIA_Addon_Owen_runter_Info;
	description = "Как можно спуститься на дно ямы?";
};


func int DIA_Addon_Owen_runter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_runter_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Как можно спуститься на дно ямы?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Понятия не имею. Спуститься по стенкам или спрыгнуть, наверное.
};


instance DIA_Addon_Owen_MalcomDead(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_MalcomDead_Condition;
	information = DIA_Addon_Owen_MalcomDead_Info;
	description = "Твой приятель Мальком мертв.";
};


func int DIA_Addon_Owen_MalcomDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Твой приятель Мальком мертв.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//Я так и знал. Бедняга. Я должен был ему помочь.
	if(SC_MadeStunt == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//А ты храбрец.
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Я бы ни за что не смог спуститься в эту яму.
	};
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Я рассказал Оуэну о смерти Малькома. Он воспринял новость довольно спокойно.");
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Owen_MalcomDead);
};

