
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = NAME_LetterSealed;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Это письмо тщательно запечатано.";
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дорогой Ватрас,");
	Doc_PrintLines(nDocID,0,"Мы нашли портал. Ты был прав.");
	Doc_PrintLines(nDocID,0,"Похоже, что это действительно были последователи Аданоса. Я прошу тебя проверить это еще раз, пользуясь моими записями.");
	Doc_PrintLines(nDocID,0,"Эти любопытные каменные создания не появлялись уже несколько дней.");
	Doc_PrintLines(nDocID,0,"Однако земля продолжает трястись безо всякой видимой причины.");
	Doc_PrintLines(nDocID,0,"Полагаю, что наши исследования вскорости принесут новые результаты.");
	Doc_PrintLines(nDocID,0,"Найденный нами орнамент имеет гораздо большее значение, чем мы думали. Похоже, что это артефакт-ключ. Увы, у нас только часть его. Мы должны заняться им.");
	Doc_PrintLines(nDocID,0,"Отправь одного из членов Кольца Воды, чтобы он вернул нам орнамент. Если возможно, не посылай Кавалорна.");
	Doc_PrintLines(nDocID,0,"Он и так достаточно потрудился, доставляя тебе это письмо.");
	Doc_PrintLines(nDocID,0,"Надеюсь, то, что мы делаем - правильно.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Сатурас");
	Doc_Show(nDocID);
	if(Use_SaturasFirstMessage_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		if(SC_KnowsRanger == FALSE)
		{
			B_LogEntries(TOPIC_Addon_KDW,"Я забрал у бандита письмо, которое Кавалорн должен был доставить магу Воды Ватрасу. Теперь это моя задача.");
			Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
			B_LogNextEntry(TOPIC_Addon_RingOfWater,"Существует какое-то сообщество, которое называется 'Кольцо Воды'. Похоже, что управляют им маги Воды.");
			Log_AddEntry(TOPIC_Addon_RingOfWater,"Кавалорн принадлежит к 'Кольцу Воды'.");
			SC_KnowsRanger = TRUE;
		}
		else
		{
			B_LogEntry(TOPIC_Addon_KDW,"Я забрал у бандита письмо, которое Кавалорн должен был доставить магу Воды Ватрасу. Теперь это моя задача.");
		};
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
};

func void Use_SaturasFirstMessage_Sealed()
{
	Snd_Play("PICKLOCK_BROKEN");
	CreateInvItem(self,ItWr_SaturasFirstMessage_Addon);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = name;
	text[0] = "Письмо Сатураса Ватрасу.";
	text[1] = "Печать сломана.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Орнамент";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Фрагмент большого, богато украшенного кольца.";
	inv_zbias = 270;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Орнамент";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Фрагмент большого, богато украшенного кольца.";
	text[1] = "Его дал мне Ватрас.";
	inv_zbias = 270;
};

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name = "Карта Нефариуса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = name;
	text[0] = "На этой карте отмечены места, где, как полагает";
	text[1] = "Нефариус, можно найти недостающие орнаменты.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_NewWorld_Ornaments()
{
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};
//	SC_Saw_Ornament_Map = TRUE;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(nDocID,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(nDocID,-28000,50500,95500,-42500);
	Doc_Show(nDocID);
};


instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name = "Карта земель Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = name;
	text[0] = "Пират Скип пометил место,";
	text[1] = "где я могу найти предводителя";
	text[2] = "бандитов Декстера.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_NewWorld_Dexter()
{
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(nDocID,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(nDocID,-28000,50500,95500,-42500);
	Doc_Show(nDocID);
};


prototype Rangerring_Prototype(C_Item)
{
	name = "Аквамариновое кольцо";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Rangerring.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = "Опознавательный знак членов Кольца Воды.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Lares()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsLaresRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Lares()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsLaresRing = FALSE;
	};
};

func void Equip_ItRi_Ranger_My()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsMyRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_My()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsMyRing = FALSE;
	};
};

func void Equip_ItRi_Ranger_Lance()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsLanceRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Lance()
{
	if(Npc_IsPlayer(self))
	{
		RangerRingIsLanceRing = FALSE;
	};
};

instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	on_equip = Equip_ItRi_Ranger_Lares;
	on_unequip = UnEquip_ItRi_Ranger_Lares;
	text[1] = "Это кольцо принадлежит Ларесу.";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	on_equip = Equip_ItRi_Ranger_My;
	on_unequip = UnEquip_ItRi_Ranger_My;
	text[1] = "Это кольцо принадлежит мне.";
};

instance ItRi_Ranger_Lance_Addon(Rangerring_Prototype)
{
	on_equip = Equip_ItRi_Ranger_Lance;
	on_unequip = UnEquip_ItRi_Ranger_Lance;
	text[1] = "Это кольцо принадлежит Лансу.";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = "Украшенное кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это кольцо открывает портал.";
	inv_zbias = 190;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = "Рекомендательное письмо Мартина";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "Это письмо поможет мне";
	text[1] = "присоединиться к ополчению.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Уважаемый лорд Андрэ!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"С этим письмом я отправляю вам нового рекрута для ополчения.");
	Doc_PrintLines(nDocID,0,"Он уже помог мне в одном важном и непростом деле.");
	Doc_PrintLines(nDocID,0,"Я уверен, что он достоин защищать короля и спокойствие граждан этого города.");
	Doc_PrintLine(nDocID,0,"Иннос, храни короля!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Интендант Мартин");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = "Приказы";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "Я забрал это письмо у Декстера,";
	text[1] = "предводителя бандитов.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_RavensKidnapperMission_Addon()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Декстер, ублюдок!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Когда я еще был рудным бароном, ты не был настолько ненадежен.");
	Doc_PrintLines(nDocID,0,"Если ты в ближайшее время не пришлешь мне новую партию похищенных людей, то у нас начнутся серьезные проблемы с ребятами.");
	Doc_PrintLines(nDocID,0,"Мне нужны новые рабы, или ребята взбунтуются. Думаю, мне не нужно объяснять тебе, что это означает.");
	Doc_PrintLines(nDocID,0,"Уже скоро я попаду в храм. Меньше всего мне сейчас нужны эти проблемы.");
	Doc_PrintLines(nDocID,0,"И еще одно:");
	Doc_PrintLines(nDocID,0,"Рано или поздно нам придется найти путь через северо-восточные горы. Если мы не будем платить пиратам, они перестанут заниматься нашими перевозками.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Ворон");
	Doc_Show(nDocID);
	if(SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		if(SC_HearedAboutMissingPeople == TRUE)
		{
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"Теперь у меня есть письменные доказательства того, что Ворон, бывший рудный барон, стоит за похищениями граждан Хориниса. Убежище Ворона находится где-то за горами на северо-востоке.");
		};
		if(MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running)
		{
			Log_AddEntry(TOPIC_Addon_WhoStolePeople,"Я должен показать этот документ Ватрасу.");
		};
		SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	};
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = "Рекомендательное письмо Ватраса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "Это письмо поможет мне";
	text[1] = "попасть в монастырь магов Огня,";
	text[2] = "не заплатив за вход.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Братья Огня!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мне стало известно, что за вход в ваш монастырь вы требуете плату.");
	Doc_PrintLines(nDocID,0,"С этим письмом я направляю вам молодого человека, который страстно желает присоединиться к вам.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Ватрас");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = NAME_InnosStatue;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "На нижней стороне выгравирован";
	text[1] = "символ магов Огня.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = "Прощальное письмо Люсии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_LuciasLoveLetter_Addon()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Элврих!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я не могу найти слова, чтобы выразить свое сожаление.");
	Doc_PrintLines(nDocID,0,"Я знаю, что ты не поймешь меня, но я пришла к выводу, что и для нас обоих будет лучше, если ты найдешь себе более достойную девушку, чем я.");
	Doc_PrintLines(nDocID,0,"Я не вернусь оттуда, куда я сейчас направляюсь. Забудь меня. Такому честному парню, как ты, не нужна проститутка. Прощай!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Люсия");
	Doc_Show(nDocID);
	if(MIS_LuciasLetter == FALSE)
	{
		if(MIS_LookingForLucia == LOG_Running)
		{
			Log_AddEntry(TOPIC_Addon_Lucia,"Люсия написала Элвриху прощальное письмо. Оно должно его заинтересовать.");
		};
		if(Elvrich_IsDead == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_LuciasLetter,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_LuciasLetter,LOG_Running);
			B_LogEntry(TOPIC_Addon_LuciasLetter,"Люсия написала Элвриху прощальное письмо. Оно должно его заинтересовать.");
		};
		MIS_LuciasLetter = LOG_Running;
	};
	LuciaMentionedInKhorinis = TRUE;
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Камень";
//	mainflag = ITEM_KAT_NONE;
	mainflag = ITEM_KAT_LIGHT;
	flags = ITEM_MULTI;
	value = 15;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItRi_Addon_BanditTrader(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 70;
	visual = "ItRi_Addon_BanditTrader.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Кольцо гильдии";
	text[0] = "Гравированное кольцо";
	text[1] = "гильдии торговцев Араксоса.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = "Список товаров";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[0] = "Я нашел это письмо у бандитов";
	text[1] = "за фермой Секоба.";
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 коротких мечей");
	Doc_PrintLines(nDocID,0,"20 шпаг");
	Doc_PrintLines(nDocID,0,"25 буханок хлеба");
	Doc_PrintLines(nDocID,0,"15 бутылок вина");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это был последний раз.");
	Doc_PrintLines(nDocID,0,"Все становится слишком опасным.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ФЕРНАНДО");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != FALSE) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Я нашел документ, доказывающий, что Фернандо является поставщиком оружия, которого я ищу.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
	BanditTrader_Lieferung_Gelesen = TRUE;
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = NAME_LetterSealed;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Письмо Ватраса Сатурасу.";
};


func void Use_Vatras2Saturas_FindRaven()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дорогой Сатурас!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Надеюсь, что скоро твоя цель будет достигнута. В городе ситуация, похоже, налаживается. Но я боюсь, что это обманчивое ощущение. Поторопись! Ты нужен мне здесь.");
	Doc_PrintLines(nDocID,0,"Я изучил твои записи и могу подтвердить твои подозрения. Это действительно были последователи Аданоса. Будь осторожен и не дай лжепророкам ослепить себя.");
	Doc_PrintLines(nDocID,0,"Пропавших жителей Хориниса отправили к бывшему рудному барону Ворону. Он находится там, куда должен вести портал.");
	Doc_PrintLines(nDocID,0,"И еще одно. Я посылаю тебе помощника. Это тот, кто передаст тебе это сообщение. В его глазах есть нечто особенное... Я не уверен, но, возможно, это ОН. Хотя мы представляли его по-другому.");
	Doc_PrintLines(nDocID,0,"Проверь его. Думаю, что я прав.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ватрас");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	Snd_Play("PICKLOCK_BROKEN");
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = name;
	text[0] = "Письмо Ватраса Сатурасу.";
	text[1] = "Печать сломана.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Addon_WispDetector.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
	description = name;
	text[0] = "Рудный амулет блуждающего огонька.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	var C_Npc DetWsp;
	if(Equip_WispDetector_OneTime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WispSearching = WispSearch_NF;
		Equip_WispDetector_OneTime = TRUE;
	};
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Hlp_IsValidNpc(DetWsp))
	{
		Wld_RemoveNpc(Wisp_Detector);
	};
	Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Hlp_IsValidNpc(DetWsp))
	{
		if(!Npc_IsDead(DetWsp))
		{
			Snd_Play("WSP_Dead_A1");
		};
		Wld_RemoveNpc(Wisp_Detector);
	};
};


instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = "Мясо болотной крысы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	description = name;
	text[0] = "Это мясо пахнет рыбой!";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Addon_MorgansRing.3DS";
	material = MAT_METAL;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо Моргана";
	text[0] = "Кольцо украшено множеством рун.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_Focus(C_Item)
{
	name = "Фокусирующий камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = "Пакет со сталью";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_STONE;
	description = name;
	text[0] = "Пакет очень тяжелый.";
	text[1] = "В нем находится большой слиток стали.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Старая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_StonePlateCommon;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[0] = "Серая каменная табличка.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_StonePlateCommon()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Каста воинов навлекла на нас божественный гнев.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"РАДЕМЕС, потомок Куарходрона, был изгнан. Но его злая сила действовала на нас даже из места его изгнания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Мы были беззащитны перед ней.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Гнев АДАНОСА обрушился на ЯРКЕНДАР!");
	}
	else
	{
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Stone_01(C_Item)
{
	name = "Красная каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
};

func void Use_Addon_Stone_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
//		Doc_PrintLines(nDocID,0,"Мы, последние трое из Совета Пяти, установили в храме ловушки и спрятали вход, чтобы меч больше никогда не покинул храм.");
		Doc_PrintLines(nDocID,0,"Мы, последние трое из Совета Пяти, установили в храме ловушки и спрятали вход, чтобы меч больше никогда не увидел свет.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Stone_02(C_Item)
{
	name = "Фиолетовая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
};

func void Use_Addon_Stone_02()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
		Doc_PrintLines(nDocID,0,"Внешние ворота с помощью КАРДИМОНА закрыл КУАРХОДРОН. Этот ритуал стал для них смертельным.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Рассказать о происшедшем могу только я.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Надеюсь, что РАДЕМЕС останется гнить в храме навеки!");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Stone_03(C_Item)
{
	name = "Синяя каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
};

func void Use_Addon_Stone_03()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
		Doc_PrintLines(nDocID,0,"КАРДИМОН создал вторую ловушку. Лишь тот, кто следует по пути света до самого конца, достигнет третьего зала.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Stone_04(C_Item)
{
	name = "Зеленая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
};

func void Use_Addon_Stone_04()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
		Doc_PrintLines(nDocID,0,"Третью ловушку создал КУАРХОДРОН. Лишь он знает, как открыть вход.");
		SC_KnowsRhademesTrapDetails = TRUE;
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Stone_05(C_Item)
{
	name = "Желтая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
};

func void Use_Addon_Stone_05()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(C_SCHasStPlSkill(LANGUAGE_1))
	{
		Doc_PrintLines(nDocID,0,"Я, тот, кто был против решения Совета Трех, создал первую ловушку. Лишь я знаю правильную дверь.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_Show(nDocID);
};

instance ItMi_Addon_Kompass_MIS(C_Item)
{
	name = "Золотой компас";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_Addon_FrancisChest(C_Item)
{
	name = "Сундук с сокровищами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 750;
	visual = "ItSe_Addon_FrancisChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = FrancisChest;
	description = name;
	text[0] = "Сундук очень тяжелый.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void FrancisChest()
{
	CreateInvItems(hero,ItWr_Addon_FrancisAbrechnung_MIS,1);
	CreateInvItems(hero,ItMw_1h_Pir_Dagger,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_GoldCup,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ItSe_Addon_EmptyFrancisChest,1);
	AI_PrintScreen("Книга платежей получено",-1,49,FONT_ScreenSmall,4);
	AI_PrintScreen("Хороший кинжал получено",-1,40,FONT_ScreenSmall,4);
	AI_PrintScreen("153 золотых получено",-1,52,FONT_ScreenSmall,4);
	AI_PrintScreen("Золотой кубок получено",-1,43,FONT_ScreenSmall,4);
	AI_PrintScreen("Серебряное ожерелье получено",-1,46,FONT_ScreenSmall,4);
	Snd_Play("Geldbeutel");
};


instance ItSe_Addon_EmptyFrancisChest(C_Item)
{
	name = "Пустой сундук";
	mainflag = ITEM_KAT_NONE;
	value = 200;
	visual = "ItSe_Addon_FrancisChest.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


instance ItWr_Addon_FrancisAbrechnung_MIS(C_Item)
{
	name = "Книга платежей";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = UseFrancisAbrechnung_MIS;
};


func void UseFrancisAbrechnung_MIS()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Торг. корабль 'Русалка'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Общая добыча: 15560 зол.");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Команда: 9840");
	Doc_PrintLine(nDocID,0,"Офицеры: 2500");
	Doc_PrintLine(nDocID,0,"Капитан: 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Личная доля: 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Торг. корабль 'Мириам'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Общая добыча: 4390 зол.");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Команда: 2390");
	Doc_PrintLine(nDocID,0,"Офицеры: 500");
	Doc_PrintLine(nDocID,0,"Капитан: 500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Личная доля: 1000");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Торг. корабль 'Нико'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Общая добыча: 9970 зол.");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Команда: 5610");
	Doc_PrintLine(nDocID,1,"Офицеры: 1500");
	Doc_PrintLine(nDocID,1,"Капитан: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Личная доля: 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Торг. корабль 'Мария'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Общая добыча: 7851 зол.");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Команда: 4400");
	Doc_PrintLine(nDocID,1,"Офицеры: 750");
	Doc_PrintLine(nDocID,1,"Капитан: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Личная доля: 1701");
	Doc_Show(nDocID);
	if(Francis_HasProof == FALSE)
	{
		B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
		Francis_HasProof = TRUE;
	};
};


instance ItWr_Addon_GregsLogbuch_MIS(C_Item)
{
	name = "Дневник Грега";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_GregsLogbuch_MIS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = UseGregsLogbuch;
};


func void UseGregsLogbuch()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"Я по горло сыт этим пляжем! Везде песок. Я не могу спокойно спать - все чешется. Мне уже не терпится забрать у Ворона золото за пленников и снова выйти в море. Надо поговорить с этим надутым болваном.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Да как он смеет?! Его чертов помощник прогнал меня. Но он меня плохо знает! Я собственными руками отправлю этого лизоблюда Бладвина на корм рыбам.");
	Doc_PrintLines(nDocID,0,"Если он не расплатится, я буду очень сердит.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLines(nDocID,1,"Эти бандиты совсем обнаглели! Они до сих пор не заплатили за последнюю партию. Но у нас пока недостаточно информации. Нужно выяснить, что задумал Ворон.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Я перевезу основную часть команды на материк. Они будут охранять руду. В лагере останется Фрэнсис с небольшой группой людей.");
	Doc_PrintLines(nDocID,1,"Времени терять нельзя. Я отдал доспехи Бонесу. Он проберется в лагерь бандитов и узнает, что планирует Ворон.");
	Doc_Show(nDocID);
	Greg_GaveArmorToBones = TRUE;
};


instance ItKe_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Бладвина";
	text[0] = "Открывает его сундук в храме.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Addon_Heiler(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = "Ключ каменного стража";
	text[0] = "Ключ от сундука в странном";
	text[1] = "древнем строении на болоте.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Каменная табличка Куарходрона";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	description = name;
	text[0] = "Ключ от храма Аданоса.";
};


func void Use_TempelTorKey()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  Джер-эдра Ахантар");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "Голова Бладвина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_FakeBloodwynHead(C_Item)
{
	name = "Голова Бладвина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
};

instance ItWr_Addon_TreasureMap(C_Item)
{
	name = "Карта сокровищ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_AW.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "На карте отмечено несколько мест.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_TreasureMap()
{
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Addon_TreasureMap);
	};
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(nDocID,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(nDocID,-47783,36300,43949,-32300);
	Doc_Show(nDocID);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Бутылка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Addon_GregsTreasureBottle_MIS.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "В бутылке находится листок бумаги.";
};


func void Use_GregsBottle()
{
	Snd_Play("RELEASECORK");
	B_PlayerFindItem(ItWr_Addon_TreasureMap,1);
};


instance ItMi_ErolsKelch(C_Item)
{
	name = "Поцарапанная серебряная чаша";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_ErolsKelch.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

