
instance DIA_RodDJG_EXIT(C_Info)
{
	npc = DJG_702_Rod;
	nr = 999;
	condition = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_HALLO(C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_HALLO_Condition;
	information = DIA_RodDJG_HALLO_Info;
	description = "С тобой все в порядке?";
};


func int DIA_RodDJG_HALLO_Condition()
{
	if(DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//С тобой все в порядке?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//Эти сапоги доконают меня! Эти новые доспехи очень хороши, но почему застежки на этих сапогах должны быть такими тугими?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//А если я чуть ослаблю их, сапоги начинают сваливаться с моих ног.
	if((Npc_IsDead(SwampDragon) == FALSE) && (DJG_SwampParty == FALSE))
	{
		Info_AddChoice(DIA_RodDJG_HALLO,"Чего ты ждешь?",DIA_RodDJG_HALLO_warten);
	};
	Info_AddChoice(DIA_RodDJG_HALLO,"Где ты взял эти сапоги?",DIA_RodDJG_HALLO_Woher);
};

func void DIA_RodDJG_HALLO_Woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//Где ты взял эти сапоги?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//Старый работяга Беннет сделал их для нас, охотников на драконов, и заставил нас хорошо заплатить за эти дерьмовые сапоги.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//Если я когда-нибудь доберусь до него, я сначала заставлю его съесть их, а затем выбью из него мои деньги назад.
};

func void DIA_RodDJG_HALLO_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//Чего ты ждешь?
	Info_ClearChoices(DIA_RodDJG_HALLO);
	if(Npc_IsDead(DJG_Cipher) == FALSE)
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//Когда Сифер, наконец, соизволит поднять свою задницу. Нам уже пора отправляться в путь.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//Я хочу обследовать эту болотистую местность вон там.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//Как думаешь, может нам пойти туда вместе? Посмотрим, что там такое?
		Info_AddChoice(DIA_RodDJG_HALLO,"Я пойду один.",DIA_RodDJG_HALLO_warten_allein);
		Info_AddChoice(DIA_RodDJG_HALLO,"Что ты знаешь об этой болотистой местности?",DIA_RodDJG_HALLO_warten_wasweisstdu);
		Info_AddChoice(DIA_RodDJG_HALLO,"Пойдем вместе.",DIA_RodDJG_HALLO_warten_zusammen);
	};
};

func void DIA_RodDJG_HALLO_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//Пойдем вместе.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//Хорошо. Тогда иди за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//Что ты знаешь об этой болотистой местности?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//Только что вонь от нее поднимается до небес и что там, вероятно, спрятана куча золота. Разве этого мало?
};

func void DIA_RodDJG_HALLO_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//Я пойду один.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//Что ж, тогда я желаю тебе удачи.
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_WARTEMAL(C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_WARTEMAL_Condition;
	information = DIA_RodDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = "Что с тобой?";
};


func int DIA_RodDJG_WARTEMAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_RodDJG_HALLO) || (DJG_SwampParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WARTEMAL_Info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//Что с тобой?
	if(((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(DJG_Cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//Послушай, парень. Я думаю, эта тварь немного нам не по зубам. Я пожалуй, попробую тихонько смыться.
		DJG_SwampParty = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(чертыхается) Эти сапоги! Эти чертовы сапоги!
	};
	if(Npc_IsDead(SwampDragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//И что ты собираешься делать дальше?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//Ты еще спрашиваешь! Прежде всего, я куплю себе новые сапоги!
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rod_PICKPOCKET(C_Info)
{
	npc = DJG_702_Rod;
	nr = 900;
	condition = DIA_Rod_PICKPOCKET_Condition;
	information = DIA_Rod_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Rod_PICKPOCKET_Condition()
{
	return C_Beklauen(16,320);
};

func void DIA_Rod_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
	Info_AddChoice(DIA_Rod_PICKPOCKET,Dialog_Back,DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rod_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};

func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};

