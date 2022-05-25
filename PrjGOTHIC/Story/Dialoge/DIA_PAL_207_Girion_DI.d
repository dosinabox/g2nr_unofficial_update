
instance DIA_Girion_DI_EXIT(C_Info)
{
	npc = PAL_207_Girion_DI;
	nr = 999;
	condition = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_DI_Hallo(C_Info)
{
	npc = PAL_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_Hallo_Condition;
	information = DIA_Girion_DI_Hallo_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Girion_DI_Hallo_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Все в порядке?
	if(OrkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//У орков хватило мужества, чтобы атаковать меня.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Но им стоило лучше подумать, прежде чем нападать на паладина из королевской стражи.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Думаю, да. Долго ты еще будешь возиться на этом утесе?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Не считай меня за идиота. Делай то, что нужно сделать, и побыстрее возвращай корабль мне.
	};
};


var int DIA_Girion_DI_Teacher_permanent;
var int Girion_DI_TeachComment_Swords;
var int Girion_DI_TeachComment_Crossbow;

func void B_BuildLearnDialog_Girion_DI()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Girion)
	{
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	};
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Girion)
	{
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Girion)
	{
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
		Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Girion) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Girion) && (RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Girion))
	{
		DIA_Girion_DI_Teacher_permanent = TRUE;
	};
	if((VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Girion) && (VisibleTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Girion) && (VisibleTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Girion))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

func void B_Girion_DI_TeachComment_Swords()
{
	if(Girion_DI_TeachComment_Swords == 0)
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Твой клинок должен рассекать воздух как тростник на ветру.
		Girion_DI_TeachComment_Swords = 1;
	}
	else if(Girion_DI_TeachComment_Swords == 1)
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Силу нужно применять расчетливо. Если ты слепо будешь бросаться на противника, это не приведет тебя к успеху.
		Girion_DI_TeachComment_Swords = 2;
	}
	else if(Girion_DI_TeachComment_Swords == 2)
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Не сжимай рукоятку слишком сильно, и твой удар точно поразит цель.
		Girion_DI_TeachComment_Swords = 3;
	}
	else if(Girion_DI_TeachComment_Swords == 3)
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Не забывай о парировании. Но лучшая оборона - это уклонение от удара врага.
		Girion_DI_TeachComment_Swords = 0;
	};
};

func void B_Girion_DI_TeachComment_Crossbow()
{
	if(Girion_DI_TeachComment_Crossbow == 0)
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//При стрельбе никогда не опирайся локтями. Это сделает твою хватку слишком жесткой, и ты неизбежно собьешь прицел.
		Girion_DI_TeachComment_Crossbow = 1;
	}
	else if(Girion_DI_TeachComment_Crossbow == 1)
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Всегда расслабляй левую руку перед выстрелом. Это позволит тебе более точно прицелиться.
		Girion_DI_TeachComment_Crossbow = 2;
	}
	else if(Girion_DI_TeachComment_Crossbow == 2)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Ты должен понимать, когда лучше отступить.
		Girion_DI_TeachComment_Crossbow = 0;
	};
};

instance DIA_Girion_DI_Teach(C_Info)
{
	npc = PAL_207_Girion_DI;
	nr = 5;
	condition = DIA_Girion_DI_Teach_Condition;
	information = DIA_Girion_DI_Teach_Info;
	permanent = TRUE;
	description = "Обучи меня, тогда мы сможем быстрее убраться с этого острова.";
};


func int DIA_Girion_DI_Teach_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && (DIA_Girion_DI_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Обучи меня, тогда мы сможем быстрее убраться с этого острова.
	if((VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Girion) || (VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Girion) || (VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Girion))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Похоже, у меня нет другого выбора.
	};
	B_BuildLearnDialog_Girion_DI();
};

func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Girion))
	{
		B_Girion_DI_TeachComment_Crossbow();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Girion))
	{
		B_Girion_DI_TeachComment_Crossbow();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Girion))
	{
		B_Girion_DI_TeachComment_Swords();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Girion))
	{
		B_Girion_DI_TeachComment_Swords();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Girion))
	{
		B_Girion_DI_TeachComment_Swords();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Girion))
	{
		B_Girion_DI_TeachComment_Swords();
		B_BuildLearnDialog_Girion_DI();
	};
};

func void DIA_Girion_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
};

var int DIA_Girion_DI_OrcEliteRing_OneTime;
var int GirionRingCount;

instance DIA_Girion_DI_OrcEliteRing(C_Info)
{
	npc = PAL_207_Girion_DI;
	nr = 99;
	condition = DIA_Girion_DI_OrcEliteRing_Condition;
	information = DIA_Girion_DI_OrcEliteRing_Info;
	permanent = TRUE;
	description = "У меня есть кольцо предводителей орков.";
};


func int DIA_Girion_DI_OrcEliteRing_Condition()
{
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_OrcEliteRing_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//У меня есть кольцо предводителей орков.
	if(DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Я думаю, лорд Хаген сможет что-нибудь предпринять.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Дай его мне. Я покажу его лорду Хагену.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Я лучше оставлю его себе.",DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Вот, возьми.",DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_geben()
{
	GirionRingCount = Npc_HasItems(other,ItRi_OrcEliteRing);
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Вот, возьми.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Спасибо. Все равно я не думаю, что оно может тебе пригодиться.
	if(GirionRingCount > 1)
	{
		DIA_Hagen_MoreOrcRings();
	};
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,GirionRingCount);
	Npc_RemoveInvItems(self,ItRi_OrcEliteRing,GirionRingCount);
	B_GivePlayerXP(XP_AmbientKap6 * GirionRingCount);
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};

func void DIA_Girion_DI_OrcEliteRing_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Я лучше оставлю его себе.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Как знаешь. Все равно оно вряд ли тебе пригодится.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};


var int DIA_Girion_DI_UndeadDragonDead_OneTime;

instance DIA_Girion_DI_UndeadDragonDead(C_Info)
{
	npc = PAL_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_UndeadDragonDead_Condition;
	information = DIA_Girion_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Мы готовы к отплытию.";
};


func int DIA_Girion_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Мы готовы к отплытию.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Это хорошо. А то я уже начал думать, что сгинем здесь на этом утесе.
	if(DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Теперь немедленно верни корабль мне.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Мы еще не в Хоринисе. И, если честно, я не так уж жажду возвращаться назад, на Хоринис.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Я и так провел там слишком много времени.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Я так и думал. Но сейчас не место и не время поднимать этот вопрос. Лучше мы обсудим это в открытом море.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//Ладно. Я, тем не менее, рад видеть тебя на борту в полном здравии.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Ты настоящий воин Инноса. У меня нет сомнений на этот счет. И я рад, что ты на нашей стороне.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//Даже хотя ты и мошенник, последнее время ты вел себя как настоящий праведник.
		};
		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Хорошо. Теперь иди к капитану. Пусть он поднимает якорь.
	AI_StopProcessInfos(self);
};

