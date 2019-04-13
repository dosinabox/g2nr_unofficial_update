
instance DIA_Gestath_EXIT(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 999;
	condition = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(сухо) Хорошие доспехи!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gestath_HALLO(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_HALLO_Condition;
	information = DIA_Gestath_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(сухо) Это мужественный поступок - прийти сюда. А ты не заблудился, часом?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO,"Что здесь есть интересного?",DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO,"А что ты делаешь здесь?",DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//У тебя хорошие доспехи.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//Да. Такие нелегко найти. Они из панцирей краулеров. Парень по имени Вольф сделал их для меня.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//Я был каторжником здесь, в колонии. Дал ему пару панцирей краулеров, и пару дней спустя доспехи были готовы. Этот парень - мастер.
	Wolf_ProduceCrawlerArmor = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,Dialog_Back,DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO,"А где сейчас Вольф?",DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//А где сейчас Вольф?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//Я давно уже не видел его. Раньше он был наемником здесь, в колонии.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Я думаю, он все еще со своими парнями.
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//А что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Зарабатываю деньги.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Здесь, где нет ничего?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Я охотник. Специализируюсь на сложных случаях.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Огненные ящеры, краулеры, драконьи снепперы... Другие не охотятся на таких зверей. Это приносит неплохие деньги.
	Info_AddChoice(DIA_Gestath_HALLO,"У тебя хорошие доспехи.",DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Что здесь есть интересного?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Куча огненных ящеров, орков и еще не знаю чего. Наверх я не ходил.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//И тебе бы не советовал. Твари, что живут там, не особенно дружелюбны.
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};


instance DIA_Gestath_Drachen(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_Drachen_Condition;
	information = DIA_Gestath_Drachen_Info;
	permanent = TRUE;
	description = "Ты умеешь потрошить драконов?";
};


var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Ты умеешь потрошить драконов?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//(смеется) Спроси меня об этом попозже, когда будешь готов к чему-нибудь подобному, хорошо?
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Конечно. Почему нет?
		Gestath_DragonTrophy = TRUE;
	};
};


instance DIA_Gestath_TEACHHUNTING(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 12;
	condition = DIA_Gestath_TEACHHUNTING_Condition;
	information = DIA_Gestath_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня потрошить животных.";
};


func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if(Gestath_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Gestath_TEACHHUNTING_OneTime;

func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Научи меня потрошить животных.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || ((Gestath_DragonTrophy == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Почему нет? У меня есть немного свободного времени.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Что ты хочешь узнать?
		};
		Info_AddChoice(DIA_Gestath_TEACHHUNTING,Dialog_Back,DIA_Gestath_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Удаление панцирей краулеров",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Удаление чешуи драконов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("Сбор крови дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//Сейчас я даже не представляю, чему еще можно обучить тебя.
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Язык огненного ящера нужно вырезать одним точным движением ножа, удерживая его при этом другой рукой.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Чтобы снять панцирь с краулера, нужен хороший прочный нож.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Мандибулы сидят глубоко в черепе полевых хищников и краулеров. Чтобы вытащить их, нужно приложить некоторое усилие.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Лучше всего отделять рог драконьего снеппера от черепа при помощи толстого ножа.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Чешую дракона очень сложно оторвать. Но когда ты уже думаешь, что у тебя ничего не получится, раз - и она все же отделяется.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Лучше всего брать кровь из брюха. Найди слабое место и вонзи туда острый нож.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};


instance DIA_Gestath_PICKPOCKET(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 900;
	condition = DIA_Gestath_PICKPOCKET_Condition;
	information = DIA_Gestath_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Gestath_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,Dialog_Back,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

