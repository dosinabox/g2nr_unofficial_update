
instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "С таверны в бандитском лагере";
};


func void Use_Hinweis_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Парни,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лу пропал в болотах. Вероятно, его съели болотные акулы.");
	Doc_PrintLines(nDocID,0,"Но что еще хуже - ключ от двери пропал вместе с ним.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Кто найдет его, сможет забрать вещи Лу.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Снаф");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Health_04(C_Item)
{
	name = "Рецепт лечебного зелья";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Чистое здоровье";
	text[2] = "Для приготовления этого сильного зелья";
	text[3] = "необходимо знание рецепта лечебного эликсира.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Также необходимо иметь 1 луговой горец и 3 лечебные эссенции.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание лечебного зелья:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три лечебные эссенции.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту лечебного эликсира.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт лечебного эликсира.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Рецепт маны";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Чистая мана";
	text[2] = "Для приготовления этого сильного зелья";
	text[3] = "необходимо знание рецепта эликсира маны.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Также необходимо иметь 1 луговой горец и 3 эссенции маны.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание зелья маны:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три эссенции маны.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту эликсира маны.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт эликсира маны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[0] = "прикрепленное к хижине в болотах";
};


func void Use_Hinweis_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Парни,");
	Doc_PrintLines(nDocID,0,"В этих сундуках находится неприкосновенный запас.");
	Doc_PrintLines(nDocID,0,"Он предназначен ДЛЯ ВСЕХ. Но воспользоваться им можно только в случае крайней необходимости");
	Doc_PrintLines(nDocID,0,"и в разумных пределах.");
	Doc_PrintLines(nDocID,0,"Надеюсь, все будут придерживаться этого правила.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Флетчер");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Найдена на теле рыбака Вильяма.";
};


func void Use_William_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Вильям, ");
	Doc_PrintLines(nDocID,0,"В полнолуние я отвлеку стражу.");
	Doc_PrintLines(nDocID,0,"Постарайся выбраться отсюда, но будь осторожен!");
	Doc_PrintLines(nDocID,0,"Если ты пойдешь по дороге, ты сможешь выйти из болот.");
	Doc_PrintLines(nDocID,0,"Лагерь пиратов находится по другую сторону долины на западе.");
	Doc_PrintLines(nDocID,0,"Оттуда ты сможешь вернуться домой на корабле.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Желаю удачи");
	Doc_Show(nDocID);
};


instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт эликсира изменения сознания.";
	text[1] = "Это зелье помогает восстановить память.";
};


func void Use_MCELIXIER_01()
{
	var int nDocID;
	Knows_MCELIXIER = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Эликсир изменения сознания");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для создания этого эликсира необходим секрет из жал двух кровавых мух.");
	Doc_PrintLines(nDocID,0,"К нему нужно добавить один экстракт маны и одну лечебную эссенцию.");
	Doc_PrintLines(nDocID,0,"Перемешать, вскипятить и добавить красный жгучий перец.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может приготовить только опытный алхимик, владеющий навыком экстрагирования секрета из жал кровавых мух.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Сальная записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Найдена в кармане Ангуса.";
};


func void Use_Pirates_01()
{
	var int nDocID;
	Read_JuansText = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Пираты, ");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Получите последнюю посылку, предназначенную для нас.");
	Doc_PrintLine(nDocID,0,"Затем принесите ее в вашу пещеру. Я встречу вас там.");
	Doc_PrintLines(nDocID,0,"Я заплачу за эту посылку двойную цену.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"До встречи.");
	Doc_PrintLine(nDocID,0,"Том");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Зеленый послушник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "В сундуке Фортуно";
};


func void Use_Joint_Rezept_01()
{
	var int nDocID;
	Green_Extrem = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Зеленый послушник");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) Косяки здесь довольно хороши, но в болотном лагере они получались все же лучше.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если я возьму эссенцию двух болотных трав и добавлю луговой горец, получится косяк с эффектом зеленого послушника.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Зеленый послушник помогает от любой боли и просветляет разум.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Рецепт Молота Лу";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт Молота Лу";
};


func void UseLouRezept()
{
	var int nDocID;
	Knows_LousHammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Рецепт Молота Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ингредиенты для приготовления Молота:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите бутылку воды, две репы и немного болотной травы.");
	Doc_PrintLines(nDocID,0,"Добавьте перемолотый зуб болотной акулы.");
	Doc_PrintLines(nDocID,0,"Поместите все в бутылку, добавьте рома и вскипятите.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Удачи.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Старик, рассказавший мне этот рецепт, предупреждал, что лучше не дышать испарениями этого пойла!");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Рецепт двойного Молота Лу";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт двойного Молота Лу";
};


func void UseLouRezept2()
{
	var int nDocID;
	Knows_Schlafhammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Двойной Молот Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите Молот Лу и перегоните его еще раз.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот напиток способен приготовить только очень опытный винокур.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если за это возьмется дилетант, он рискует не ослепнуть и даже лишиться жизни.");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Быстрая селедка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт Быстрой селедки.";
};


func void UseRezeptPiratentod()
{
	var int nDocID;
	Knows_SchnellerHering = TRUE;
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
	Doc_PrintLines(nDocID,0,"Как только жидкость станет желтой, выньте рыбу и добавьте пучок");
	Doc_PrintLines(nDocID,0,"свежесорванной снеппер-травы.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Осторожно! Это пойло обладает очень сильным эффектом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Клочок бумаги";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Инструкция изготовления бандитского топора";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "Инструкция изготовления легкого острого топора.";
};


func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Бандитский топор");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Одноручный топор");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот топор может выковать любой, знакомый с основами кузнечного дела.");
	Doc_PrintLines(nDocID,0,"Необходимы два куска раскаленной сырой стали.");
	Doc_PrintLines(nDocID,0,"Один кусок руды и три зуба волка, снеппера или подобного им зверя.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Перекуйте руду и зубы вместе со сталью на наковальне.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Такой топор очень легок и наносит значительный урон.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Вызов 'Куарходрона'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
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
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ItWr_Map_AddonWorld(C_Item)
{
	name = "Забытая долина зодчих.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_AddonWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};

