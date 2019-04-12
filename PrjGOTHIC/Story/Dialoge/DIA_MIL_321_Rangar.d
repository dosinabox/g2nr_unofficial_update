
instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	information = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть этот ключ будет легко)";
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hallo(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent = FALSE;
	description = "Эй, ты что делаешь тут?";
};


func int DIA_Rangar_Hallo_Condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Эй, как дела?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Пока у паладинов нет никаких заданий для меня, я могу расслабиться и попить пивка. А что еще делать? (усмехается)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Ты работаешь на паладинов?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Да, я докладываю им о ситуации в городе. В настоящий момент все спокойно.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "А как ситуация с орками?";
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//А как ситуация с орками?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Нет причин для беспокойства - городская стража и паладины держат ситуацию под контролем.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Иди спокойно домой и оставь нашу работу нам. Мы отвечаем за город и его граждан. -ИК-
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "Хочешь еще пива?";
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Хочешь еще пива?
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ах, нет ничего лучше, чем холодный эль.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Ты что-то хотел сказать насчет орков...
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Ах, да, точно. Орки не представляют угрозы для города.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Они застряли в Долине Рудников. А Проход охраняется паладинами.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Даже мясной жук не просочится там.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Я бы не отказался еще от одной пинты.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Говорят, орков видели у самого города.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Да, точно, опасный орк около города. Этот орк - настоящий монстр. Он скоро нападет на город.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Послушай, мы порвем этого орка как тузик тряпку, если он подойдет близко к городу. Понял?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Понял.
			Knows_Paladins = 2;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Горький эль - однозначно лучший.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Знаешь, нечасто встретишь парня, готового угостить тебя пивом. Ты наш человек.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Я хочу еще пива.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rangar_Erwischt(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 5;
	condition = DIA_Addon_Rangar_Erwischt_Condition;
	information = DIA_Addon_Rangar_Erwischt_Info;
	description = "Что ты здесь делаешь?";
};


var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_Addon_Rangar_Erwischt_OneTime == FALSE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Erwischt_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(испуганно) Э-э-э... Я... Это не твое дело! Проваливай!
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Мартин будет просто счастлив, когда я расскажу, кто копается в вещах, пока его нет.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(печально) Делай, что хочешь. Я ухожу отсюда.
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GotRangar = TRUE;
};


instance DIA_Addon_Rangar_nachhaken(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Addon_Rangar_nachhaken_Condition;
	information = DIA_Addon_Rangar_nachhaken_Info;
	permanent = TRUE;
	description = "Ты действительно думаешь, что тебе это сойдет с рук?";
};


func int DIA_Addon_Rangar_nachhaken_Condition()
{
	if((SC_GotRangar == TRUE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_nachhaken_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Ты действительно думаешь, что тебе это сойдет с рук?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(безразлично) Не поднимай столько шума из-за жалкой кучки хлама.
};

