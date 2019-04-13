
instance DIA_Geppert_EXIT(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 999;
	condition = DIA_Geppert_EXIT_Condition;
	information = DIA_Geppert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_HALLO(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 4;
	condition = DIA_Geppert_HALLO_Condition;
	information = DIA_Geppert_HALLO_Info;
	important = TRUE;
};


func int DIA_Geppert_HALLO_Condition()
{
	return TRUE;
};


var int Kervo_GotStuff;

func void DIA_Geppert_HALLO_Info()
{
	if((Npc_IsDead(Kervo) == FALSE) && (Kervo_GotStuff == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(Kervo,ItMi_RuneBlank,1);
		}
		else
		{
			CreateInvItems(Kervo,ItMi_Nugget,1);
		};
		Kervo_GotStuff = TRUE;
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_10_00");	//Стой! Кто идет?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_01");	//Ты пришел не за тем, чтобы отправить меня назад, в шахту? Нет?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_02");	//Я должен разочаровать тебя. Я ни за что не вернусь назад.
	Info_ClearChoices(DIA_Geppert_HALLO);
	Info_AddChoice(DIA_Geppert_HALLO,"Что ты делаешь здесь?",DIA_Geppert_HALLO_Wasmachtihr);
	Info_AddChoice(DIA_Geppert_HALLO,"Ты сбежавший каторжник, правильно?",DIA_Geppert_HALLO_Flucht);
};

func void DIA_Geppert_HALLO_Flucht()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Flucht_15_00");	//Ты сбежавший каторжник, правильно?
	AI_Output(self,other,"DIA_Geppert_HALLO_Flucht_10_01");	//Какой ты проницательный. А почему еще, по-твоему, я забился в эту грязную дыру?
	Info_ClearChoices(DIA_Geppert_HALLO);
};

func void DIA_Geppert_HALLO_Wasmachtihr()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Wasmachtihr_15_00");	//Что ты делаешь здесь?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_01");	//Что за идиотский вопрос? Я скрываюсь здесь от ваших солдат.
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_02");	//Хватит ходить вокруг да около. Либо убей меня, либо проваливай.
	}
	else
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_03");	//Идиотский вопрос. Скрываюсь! Что же еще? У этих свиней из ополчения шпионы есть повсюду.
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_04");	//Я не вернусь назад, в шахту. И точка.
	Info_ClearChoices(DIA_Geppert_HALLO);
};


instance DIA_Geppert_BRATEN(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 5;
	condition = DIA_Geppert_BRATEN_Condition;
	information = DIA_Geppert_BRATEN_Info;
	permanent = TRUE;
	description = "Твое жаркое так аппетитно пахнет.";
};


func int DIA_Geppert_BRATEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Geppert_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_BRATEN_Info()
{
	AI_Output(other,self,"DIA_Geppert_BRATEN_15_00");	//Твое жаркое так аппетитно пахнет.
	AI_Output(self,other,"DIA_Geppert_BRATEN_10_01");	//Не трогай!
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_PICKPOCKET(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 900;
	condition = DIA_Geppert_PICKPOCKET_Condition;
	information = DIA_Geppert_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Geppert_PICKPOCKET_Condition()
{
	return C_Beklauen(56,5);
};

func void DIA_Geppert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
	Info_AddChoice(DIA_Geppert_PICKPOCKET,Dialog_Back,DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Geppert_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

