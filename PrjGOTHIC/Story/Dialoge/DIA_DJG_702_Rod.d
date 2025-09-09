
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
	nr = 1;
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
};


instance DIA_RodDJG_BOOTS(C_Info)
{
	npc = DJG_702_Rod;
	nr = 10;
	condition = DIA_RodDJG_BOOTS_Condition;
	information = DIA_RodDJG_BOOTS_Info;
	description = "Где ты взял эти сапоги?";
};


func int DIA_RodDJG_BOOTS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_RodDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_BOOTS_Info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//Где ты взял эти сапоги?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//Старый работяга Беннет сделал их для нас, охотников на драконов, и заставил нас хорошо заплатить за эти дерьмовые сапоги.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//Если я когда-нибудь доберусь до него, я сначала заставлю его съесть их, а затем выбью из него мои деньги назад.
};


instance DIA_RodDJG_WhyWait(C_Info)
{
	npc = DJG_702_Rod;
	nr = 2;
	condition = DIA_RodDJG_WhyWait_Condition;
	information = DIA_RodDJG_WhyWait_Info;
	description = "Чего ты ждешь?";
};


func int DIA_RodDJG_WhyWait_Condition()
{
	if(Npc_KnowsInfo(other,DIA_RodDJG_HALLO) && (DJG_SwampParty == FALSE) && !Npc_KnowsInfo(other,DIA_RodDJG_CipherDead) && !Npc_KnowsInfo(other,DIA_RodDJG_FallBack))
	{
		if(!Npc_IsDead(SwampDragon))
		{
			return TRUE;
		};
	};
};

func void DIA_RodDJG_WhyWait_Info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//Чего ты ждешь?
	if(!Npc_IsDead(DJG_Cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//Когда Сифер, наконец, соизволит поднять свою задницу. Нам уже пора отправляться в путь.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//Я хочу обследовать эту болотистую местность вон там.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//Как думаешь, может нам пойти туда вместе? Посмотрим, что там такое?
		Info_ClearChoices(DIA_RodDJG_WhyWait);
		Info_AddChoice(DIA_RodDJG_WhyWait,"Я пойду один.",DIA_RodDJG_HALLO_warten_allein);
		Info_AddChoice(DIA_RodDJG_WhyWait,"Что ты знаешь об этой болотистой местности?",DIA_RodDJG_HALLO_warten_wasweisstdu);
		Info_AddChoice(DIA_RodDJG_WhyWait,"Пойдем вместе.",DIA_RodDJG_HALLO_warten_zusammen);
	};
};

func void DIA_RodDJG_HALLO_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//Пойдем вместе.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//Хорошо. Тогда иди за мной.
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"BENCH",-1);
	};
	AI_StopProcessInfos(self);
	DJG_SwampParty = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SWAMPWAIT2");
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


instance DIA_RodDJG_FallBack(C_Info)
{
	npc = DJG_702_Rod;
	nr = 1;
	condition = DIA_RodDJG_FallBack_Condition;
	information = DIA_RodDJG_FallBack_Info;
	important = TRUE;
};


func int DIA_RodDJG_FallBack_Condition()
{
	if(DJG_SwampParty == TRUE)
	{
		if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000) && Npc_IsDead(DJG_Cipher))
		{
			return TRUE;
		};
	};
};

func void DIA_RodDJG_FallBack_Info()
{
	if(!Npc_IsDead(SwampDragon))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//Послушай, парень. Я думаю, эта тварь немного нам не по зубам. Я, пожалуй, попробую тихонько смыться.
	}
	else
	{
		B_Say(self,other,"$OHMYGODITSAFIGHT");
	};
	DJG_RodSurvivedSwampDragon = TRUE;
	DJG_SwampParty = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_RodDJG_WARTEMAL(C_Info)
{
	npc = DJG_702_Rod;
	nr = 3;
	condition = DIA_RodDJG_WARTEMAL_Condition;
	information = DIA_RodDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = "Что с тобой?";
};


func int DIA_RodDJG_WARTEMAL_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WARTEMAL_Info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//Что с тобой?
	AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(чертыхается) Ух! Эти сапоги, эти чертовы сапоги!
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_WhatNext(C_Info)
{
	npc = DJG_702_Rod;
	nr = 4;
	condition = DIA_RodDJG_WhatNext_Condition;
	information = DIA_RodDJG_WhatNext_Info;
	permanent = TRUE;
	description = "И что ты собираешься делать дальше?";
};


func int DIA_RodDJG_WhatNext_Condition()
{
	if((DJG_RodSurvivedSwampDragon == TRUE) || Npc_KnowsInfo(other,DIA_RodDJG_CipherDead))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WhatNext_Info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//И что ты собираешься делать дальше?
	if(Npc_IsDead(SwampDragon))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//Ты еще спрашиваешь! Прежде всего, я куплю себе новые сапоги!
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_CipherDead(C_Info)
{
	npc = DJG_702_Rod;
	nr = 2;
	condition = DIA_RodDJG_CipherDead_Condition;
	information = DIA_RodDJG_CipherDead_Info;
	important = TRUE;
};


func int DIA_RodDJG_CipherDead_Condition()
{
	if((DJG_SwampParty == TRUE) && (DJG_SwampParty_GoGoGo == TRUE))
	{
		if(Npc_IsDead(DJG_Cipher))
		{
			return TRUE;
		};
	};
};

func void DIA_RodDJG_CipherDead_Info()
{
	B_Say(self,other,"$RUNAWAY");
	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_RodDJG_GiveItBack(C_Info)
{
	npc = DJG_702_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = "Вот, держи свой меч!";
};

