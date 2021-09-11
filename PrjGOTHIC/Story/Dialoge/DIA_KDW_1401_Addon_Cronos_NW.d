
instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	B_EquipTrader(self);
	if(Cronos_NW_ItemsGiven_Chapter_1 == TRUE)
	{
		Cronos_NW_ItMi_Flask_Count = Npc_HasItems(self,ItMi_Flask);
		Cronos_NW_ItMi_Sulfur_Count = Npc_HasItems(self,ItMi_Sulfur);
		Cronos_NW_ItMi_Pitch_Count = Npc_HasItems(self,ItMi_Pitch);
		Cronos_NW_ItPo_Mana_01_Count = Npc_HasItems(self,ItPo_Mana_01);
		Cronos_NW_ItPo_Health_01_Count = Npc_HasItems(self,ItPo_Health_01);
		Cronos_NW_ItSc_Light_Count = Npc_HasItems(self,ItSc_Light);
		Cronos_NW_ItSc_Firebolt_Count = Npc_HasItems(self,ItSc_Firebolt);
		Cronos_NW_ItSc_Zap_Count = Npc_HasItems(self,ItSc_Zap);
		Cronos_NW_ItSc_LightHeal_Count = Npc_HasItems(self,ItSc_LightHeal);
		Cronos_NW_ItSc_SumGobSkel_Count = Npc_HasItems(self,ItSc_SumGobSkel);
		Cronos_NW_ItSc_Icelance_Count = Npc_HasItems(self,ItSc_Icelance);
		Cronos_NW_ItSc_Whirlwind_Count = Npc_HasItems(self,ItSc_Whirlwind);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_Hallo(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = "я могу теб€ побеспокоить?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//я могу теб€ побеспокоить?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//(удивлено) Ёто “џ? Ќе думал, что мне еще когда-нибудь доведетс€ увидеть твое лицо.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//“ы храбрец, если решил здесь показатьс€. Ќекоторое врем€ назад мы были готовы заживо содрать с теб€ кожу.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//  счастью дл€ теб€, с того времени прошло уже несколько недель, так что мы немного успокоились.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "„то ты здесь делаешь?";
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//„то ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//ћо€ задача - вы€снить как можно больше об охранниках храма.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Ќепроста€ задача, скажу € тебе. —войства этих каменных стражей мне совершенно незнакомы.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//ќни могут сто€ть, совершенно не подава€ признаков жизни, а через секунду уже нападать на теб€, как одержимые.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//я еще не определил силу, котора€ приводит их в движение, но в одном у мен€ сомнений нет: природа этой силы магическа€.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "–асскажи мне о каменных стражах.";
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//–асскажи мне о каменных стражах.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//ћногого € сказать пока не могу.   сожалению, нам пришлось их уничтожить. “еперь они не опасны.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	// огда мы только пришли сюда, они напали на нас.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Ћишь объединенными силами нам удалось их победить. Ѕоюсь, за порталом нас ждут новые стражи.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//ƒолжен быть способ закрыть источник их силы, чтобы они оставались лишь безжизненными стату€ми.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "“ы можешь продать мне какие-нибудь припасы?";
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//“ы можешь продать мне какие-нибудь припасы?
	if(CronosTraded == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//ѕочему бы и нет? ≈сли € правильно помню, мы с тобой уже вели дела.
		Log_CreateTopic(TOPIC_Addon_KDWTrader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTrader,LogText_Addon_CronosTrade);
		CronosTraded = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//»так, что тебе нужно?
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

