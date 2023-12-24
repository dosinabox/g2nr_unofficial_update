
instance ItWr_Addon_Hinweis_02(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "из таверны в бандитском лагере.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Hinweis_02()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Парни,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лу пропал в болотах. Вероятно, его съели болотные акулы.");
	Doc_PrintLines(nDocID,0,"Но что еще хуже - ключ от двери пропал вместе с ним.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Кто найдет его, сможет забрать вещи Лу.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Снаф");
	Doc_Show(nDocID);
	EnteredBanditsCamp = TRUE;
};


instance ItWr_Addon_Health_04(C_Item)
{
	name = "Рецепт зелья чистого здоровья";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = name;
	text[0] = "Для создания этого сильного зелья";
	text[1] = "необходимо знание рецепта лечебного эликсира.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Heilrezept_04()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание лечебного зелья:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три лечебные эссенции.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту лечебного эликсира.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт лечебного эликсира.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЧИСТОГО ЗДОРОВЬЯ': 1 луговой горец и 3 лечебные эссенции.");
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
		};
	};
};


instance ItWr_Addon_Mana_04(C_Item)
{
	name = "Рецепт зелья чистой маны";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1500;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = name;
	text[0] = "Для создания этого сильного зелья";
	text[1] = "необходимо знание рецепта эликсира маны.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Manarezept_04()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание зелья маны:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три эссенции маны.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту эликсира маны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт эликсира маны.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЧИСТОЙ МАНЫ': 1 луговой горец и 3 эссенции маны.");
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
		};
	};
};


instance ItWr_Addon_Hinweis_01(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[0] = "прикрепленное к хижине в болотах.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Hinweis_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Парни,");
	Doc_PrintLines(nDocID,0,"В этих сундуках находится неприкосновенный запас.");
	Doc_PrintLines(nDocID,0,"Он предназначен ДЛЯ ВСЕХ. Но воспользоваться им можно только в случае крайней необходимости");
	Doc_PrintLines(nDocID,0,"и в разумных пределах.");
	Doc_PrintLines(nDocID,0,"Надеюсь, все будут придерживаться этого правила.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Флетчер");
	Doc_Show(nDocID);
};


instance ItWr_Addon_William_01(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Найдена на теле рыбака Вильяма.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_William_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Вильям,");
	Doc_PrintLines(nDocID,0,"В полнолуние я отвлеку стражу.");
	Doc_PrintLines(nDocID,0,"Постарайся выбраться отсюда, но будь осторожен!");
	Doc_PrintLines(nDocID,0,"Если ты пойдешь по дороге, ты сможешь выйти из болот.");
	Doc_PrintLines(nDocID,0,"Лагерь пиратов находится по другую сторону долины на западе.");
	Doc_PrintLines(nDocID,0,"Оттуда ты сможешь вернуться домой на корабле.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Желаю удачи.");
	Doc_Show(nDocID);
	if(FoundDeadWilliam == FALSE)
	{
		if(Sklaven_Flucht == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		};
		B_LogEntry(TOPIC_Addon_MissingPeople,"Рыбак из Хориниса Вильям мертв. Я нашел его тело в Яркендаре.");
		FoundDeadWilliam = TRUE;
	};
};


instance ItWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Рецепт эликсира изменения сознания";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Это зелье помогает восстановить память.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MCELIXIER_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,NAME_Geist);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для создания этого эликсира необходим секрет из жал двух кровавых мух.");
	Doc_PrintLines(nDocID,0,"К нему нужно добавить один экстракт маны и одну лечебную эссенцию.");
	Doc_PrintLines(nDocID,0,"Перемешать, вскипятить и добавить красный жгучий перец.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может приготовить только опытный алхимик, владеющий навыком экстрагирования секрета из жал кровавых мух.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Knows_MCELIXIER == FALSE)
		{
			Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА ИЗМЕНЕНИЯ СОЗНАНИЯ': 2 жала кровавой мухи, 1 экстракт маны, 1 лечебная эссенция и 1 красный жгучий перец.");
			Knows_MCELIXIER = TRUE;
		};
	};
};


instance ItWr_Addon_Pirates_01(C_Item)
{
	name = "Сальная записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Найдена в кармане Ангуса.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Pirates_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Пираты,");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Получите последнюю посылку, предназначенную для нас.");
	Doc_PrintLines(nDocID,0,"Затем принесите ее в вашу пещеру. Я встречу вас там.");
	Doc_PrintLines(nDocID,0,"Я заплачу за эту посылку двойную цену.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"До встречи.");
	Doc_PrintLine(nDocID,0,"Том");
	Doc_Show(nDocID);
};


instance ItWr_Addon_Joint_01(C_Item)
{
	name = "Рецепт 'Зеленого послушника'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Записка из сундука Фортуно.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Joint_Rezept_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Зеленый послушник");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) Косяки здесь довольно хороши, но в Болотном Лагере они получались все же лучше.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если я возьму эссенцию двух болотных трав и добавлю луговой горец, получится косяк с эффектом 'Зеленого послушника'.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"'Зеленый послушник' помогает от любой боли и просветляет разум.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Green_Extrem == FALSE)
		{
			Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЗЕЛЕНОГО ПОСЛУШНИКА': 2 болотных травы и 1 луговой горец.");
			EnteredBanditsCamp = TRUE;
			Green_Extrem = TRUE;
		};
	};
};


instance ItWr_Addon_Lou_Rezept(C_Item)
{
	name = "Рецепт 'Молота Лу'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 70;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLouRezept()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Молот Лу");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ингредиенты для приготовления Молота:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите бутылку воды, две репы и немного болотной травы.");
	Doc_PrintLines(nDocID,0,"Добавьте перемолотый зуб болотной акулы.");
	Doc_PrintLines(nDocID,0,"Поместите все в бутылку, добавьте рома и вскипятите.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ваше здоровье.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Слепой старик, рассказавший мне этот рецепт, предупреждал, что лучше не дышать испарениями этого пойла!");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_LousHammer == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'МОЛОТА ЛУ': 1 вода, 2 репы, 1 болотная трава, 1 зуб болотной акулы и 1 ром.");
			Knows_LousHammer = TRUE;
		};
		Opened_LousHammer = TRUE;
	};
};


instance ItWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Рецепт двойного 'Молота Лу'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 140;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLouRezept2()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Двойной 'Молот Лу'");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите старый добрый 'Молот Лу' и перегоните его еще раз.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот напиток способен приготовить только очень опытный винокур.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если за это возьмется дилетант, он рискует ослепнуть и даже лишиться жизни.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_Schlafhammer == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для двойного 'МОЛОТА ЛУ': 1 'Молот Лу' и 1 ром.");
			Knows_Schlafhammer = TRUE;
		};
		Opened_Schlafhammer = TRUE;
	};
};


instance ItWr_Addon_Piratentod(C_Item)
{
	name = "Рецепт 'Быстрой селедки'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseRezeptPiratentod()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Быстрая селедка");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Пойло для настоящих мужчин");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Как всегда, необходима бутылка воды. Добавьте немного рома и свежую рыбу.");
	Doc_PrintLines(nDocID,0,"Как только жидкость станет желтой, выньте рыбу и добавьте пучок свежесорванной снеппер-травы.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Осторожно! Это пойло обладает очень сильным эффектом.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_SchnellerHering == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'БЫСТРОЙ СЕЛЕДКИ': 1 вода, 1 ром, 1 рыба и 1 снеппер-трава.");
			Knows_SchnellerHering = TRUE;
		};
		Opened_SchnellerHering = TRUE;
	};
};


instance ItWr_MushroomMana(C_Item)
{
	name = "Рецепт грибного экстракта";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseMushroomManaRecipe;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseMushroomManaRecipe()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание грибного экстракта:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Черные грибы полезны сами по себе, но нехитрая обработка позволит усилить их свойства и создать более эффективный жидкий концентрат.");
	Doc_PrintLines(nDocID,0,"Необходимо 50 черных грибов и одна луговая ягода.");
	Doc_PrintLines(nDocID,0,"Грибы очищаются от грязи и варятся около часа. Полученный отвар охлаждается и в него добавляется высушенная и измельченная луговая ягода.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если после добавления ягоды в емкости не выпал осадок, то все сделано правильно.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_MushroomMana == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ГРИБНОГО ЭКСТРАКТА': 50 черных грибов и 1 луговая ягода.");
			Knows_MushroomMana = TRUE;
		};
		Opened_MushroomMana = TRUE;
	};
};


instance ItWr_AppleSTR(C_Item)
{
	name = "Рецепт яблочного экстракта";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAppleSTRRecipe;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseAppleSTRRecipe()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание яблочного экстракта:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Конечно, яблоки сами по себе полезны для здоровья, но алхимик или опытный повар могут усилить их свойства и создать на их основе особый экстракт.");
	Doc_PrintLines(nDocID,0,"Необходимо 25 яблок и одна лесная ягода.");
	Doc_PrintLines(nDocID,0,"Яблоки очищаются от кожуры и семечек, разрезаются на мелкие дольки и варятся около получаса. Затем в отвар надо добавить сок свежесорванной лесной ягоды.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_AppleSTR == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЯБЛОЧНОГО ЭКСТРАКТА': 25 яблок и 1 лесная ягода.");
			Knows_AppleSTR = TRUE;
		};
		Opened_AppleSTR = TRUE;
	};
};


instance Fakescroll_Addon(C_Item)
{
	name = "Клочок бумаги";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Схема бандитского топора";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "Для его изготовления нужно";
	text[1] = "знание основ кузнечного дела.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseAxtAnleitung()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,NAME_ItMw_Banditenaxt);
	Doc_SetFont(nDocID,0,FONT_Book);
//	Doc_PrintLine(nDocID,0,"Легкий боевой топор");
//	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот топор может выковать любой, знакомый с основами кузнечного дела.");
	Doc_PrintLines(nDocID,0,"Необходимы два куска раскаленной сырой стали, один кусок руды и три зуба волка, снеппера или подобного им зверя.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Перекуйте на наковальне руду и зубы вместе со сталью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Такой топор очень легок и наносит значительный урон.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((Npc_GetTalentSkill(self,NPC_TALENT_SMITH) > 0) && (Knows_Banditenaxt == FALSE))
		{
			B_LogEntry(TOPIC_TalentSmith,"Для бандитского топора мне нужен 1 кусок руды, 3 зуба и 1 дополнительная стальная заготовка.");
			Knows_Banditenaxt = TRUE;
		};
		Opened_Banditenaxt = TRUE;
	};
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Вызов Куарходрона";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[0] = "С помощью этого свитка можно вызвать Куарходрона.";
};


func void UseSummonAncientGhost()
{
	if(SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			B_InitNpcGlobals();
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_CannotUse_Addon();
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ItWr_Map_AddonWorld(C_Item)
{
	name = "Забытая долина зодчих";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_AW.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_AddonWorld()
{
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(nDocID,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(nDocID,-47783,36300,43949,-32300);
	Doc_Show(nDocID);
};

