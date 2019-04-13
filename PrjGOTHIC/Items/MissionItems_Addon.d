
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = "Запечатанное послание";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Это письмо было тщательно запечатано.";
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Дорогой Ватрас,");
	Doc_PrintLines(nDocID,0,"Мы нашли портал. Ты был прав.");
	Doc_PrintLines(nDocID,0,"Похоже, что это действительно были последователи Аданоса. Я прошу тебя проверить это еще раз, пользуясь моими записями.");
	Doc_PrintLines(nDocID,0,"Эти любопытные каменные создания не появлялись уже несколько дней.");
	Doc_PrintLines(nDocID,0,"Однако земля продолжает трястись безо всякой видимой причины.");
	Doc_PrintLines(nDocID,0,"Полагаю, что наши исследования вскорости принесут новые результаты.");
	Doc_PrintLines(nDocID,0,"Найденный нами орнамент имеет гораздо большее значение, чем мы думали. Похоже, что это артефакт-ключ. Увы, у нас только часть его. Мы должны заняться им.");
	Doc_PrintLines(nDocID,0,"Отправь одного из членов Кольца Воды, чтобы он вернул нам орнамент. Если возможно, не посылай Кавалорна.");
	Doc_PrintLines(nDocID,0,"Он и так достаточно потрудился, доставляя тебе это письмо. ");
	Doc_PrintLines(nDocID,0,"Надеюсь, то, что мы делаем, - правильно.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Сатурас");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Я забрал у бандита письмо, которое Кавалорн должен был доставить магу воды Ватрасу. Теперь это моя задача.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Существует какое-то сообщество, которое называется 'Кольцо Воды'. Похоже, что управляют им маги воды.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Кавалорн принадлежит к Кольцу Воды.");
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = "Распечатанное письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Сатураса Ватрасу";
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Орнамент";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Фрагмент большого, богато украшенного кольца";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Орнамент";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Фрагмент большого, богато украшенного кольца";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name = "Карта Нефариуса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = name;
	text[0] = "На этой карте отмечены места, где, как полагает";
	text[1] = "Нефариус, можно найти недостающие орнаменты.";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name = "Карта Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = name;
	text[0] = "Скип пометил место,";
	text[1] = "где я могу найти предводителя";
	text[2] = "бандитов Декстера.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Dexter()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = "Аквамариновое кольцо";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "Опознавательный знак членов Кольца Воды";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[1] = "Это кольцо принадлежит Ларесу.";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[1] = "Это кольцо принадлежит  мне.";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
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
	description = "Это кольцо открывает портал.";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
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
	description = "Рекомендательное письмо для лорда Андре";
	text[2] = "Это письмо поможет мне";
	text[3] = "присоединиться к ополчению.";
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Уважаемый лорд Андре!");
	Doc_PrintLines(nDocID,0,"");
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
	text[2] = "Я забрал это письмо у";
	text[3] = "предводителя бандитов Декстера";
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Теперь у меня есть письменные доказательства того, что Ворон, бывший рудный барон, стоит за похищениями граждан Хориниса. Убежище Ворона находится где-то за горами на северо-востоке. Я должен показать этот документ Ватрасу.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"Декстер, ублюдок!");
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
	description = "Рекомендательное письмо Ватраса";
	text[2] = "Это письмо поможет мне";
	text[3] = "попасть в монастырь магов огня,";
	text[4] = "не заплатив за вход.";
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Братья огня!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мне стало известно, что за вход в ваш монастырь вы требуете плату.");
	Doc_PrintLines(nDocID,0,"С этим письмом я направляю вам молодого человека, который страстно желает присоединиться к вам.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ватрас");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Драгоценная статуэтка Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
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
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Люсия написала Элвриху прощальное письмо. Оно должно его заинтересовать.");
	MIS_LuciasLetter = LOG_Running;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Элврих!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я не могу найти слова, чтобы выразить свое сожаление.");
	Doc_PrintLines(nDocID,0,"Я знаю, что ты не поймешь меня, но я пришла к выводу, что и для нас обоих будет лучше, если ты найдешь себе более достойную девушку, чем я.");
	Doc_PrintLines(nDocID,0,"Я не вернусь оттуда, куда я сейчас направляюсь. Забудь меня. Такому честному парню, как ты, не нужна проститутка. Прощай!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Люсия");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
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

instance ItMi_Rake(C_Item)
{
	name = "Мотыга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Use_Rake()
{
};


instance ItRi_Addon_BanditTrader(C_Item)
{
	name = "Кольцо гильдии";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Гравированное кольцо";
	text[2] = "гильдии торговцев Араксоса";
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
	text[2] = "Я нашел это письмо у бандитов";
	text[3] = "за фермой Секоба.";
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Lieferung_Gelesen = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 коротких мечей");
	Doc_PrintLines(nDocID,0,"20 рапир");
	Doc_PrintLines(nDocID,0,"25 буханок хлеба");
	Doc_PrintLines(nDocID,0,"15 бутылок вина");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это был последний раз.");
	Doc_PrintLines(nDocID,0,"Все становится слишком опасным.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ФЕРНАНДО");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Я нашел документ, доказывающий, что Фернандо является поставщиком оружия, которого я ищу.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Письмо Ватраса Сатурасу";
};


func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Дорогой Сатурас!");
	Doc_PrintLines(nDocID,0,"");
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
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = "Открытое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Ватраса Сатурасу";
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = "Рудный амулет";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
	description = "Рудный амулет блуждающего огонька";
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
	AI_Teleport(DetWsp,"TOT");
	Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(DetWsp,"TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp,"TOT");
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
	text[1] = "Это мясо пахнет рыбой!";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = "Кольцо Моргана";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[1] = "Кольцо украшено множеством рун.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
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
	material = MAT_LEATHER;
	description = name;
	text[2] = "Пакет очень тяжелый.";
	text[3] = "В нем находится большой слиток стали.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Старая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = value_StonePlateCommon;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Серая каменная табличка";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value_StonePlateCommon;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
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
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
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
	text[2] = "Красная каменная табличка";
	text[3] = "";
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Мы, последние трое из Совета Пяти, установили в храме ловушки и спрятали вход, чтобы меч больше никогда не покинул храм.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
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
	text[2] = "Желтая каменная табличка";
	text[3] = "";
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Я, тот, кто был против решения Совета Трех, создал первую ловушку. Лишь я знаю правильную дверь.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
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
	text[2] = "Синяя каменная табличка";
	text[3] = "";
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"КАРДИМОН создал вторую ловушку. Лишь тот, кто следует по пути света, достигнет третьего зала.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
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
	text[2] = "Зеленая каменная табличка";
	text[3] = "";
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Третью ловушку создал КУАРХОДРОН. Лишь он знает, как открыть вход.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
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
	text[2] = "Фиолетовая каменная табличка";
	text[3] = "";
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Внешние ворота с помощью КАРДИМОНА закрыл Куадходрон. Этот ритуал стал для них смертельным.");
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
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Золотой компас";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = "Сундук с сокровищами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = "Сундук с сокровищами";
	text[0] = "Сундук очень тяжелый.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void FrancisChest()
{
	CreateInvItems(hero,ItMi_GoldChest,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_GoldCup,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Geldbeutel");
	Print("Вы нашли несколько предметов!");
};


instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = "Книга платежей";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Купеческий корабль 'Русалка'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Общая добыча: 14560 золотых");
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
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Купеческий корабль 'Мириам'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Общая добыча: 4890 золотых");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Команда: 2390");
	Doc_PrintLine(nDocID,0,"Офицеры: 500");
	Doc_PrintLine(nDocID,0,"Капитан: 500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Личная доля: 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Купеческий корабль 'Нико'");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Общая добыча: 9970 золотых");
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
	Doc_PrintLine(nDocID,1,"Купеческий корабль 'Мария'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Общая добыча: 7851 золотых");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Команда: 4400");
	Doc_PrintLine(nDocID,1,"Офицеры: 750");
	Doc_PrintLine(nDocID,1,"Капитан: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Личная доля: 1701");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дневник Грега";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
};


func void UseGregsLogbuch()
{
	var int nDocID;
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
	Greg_GaveArmorToBones = TRUE;
	Doc_Show(nDocID);
};


instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Бладвина";
	text[2] = "Ключ от сундука";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Addon_Heiler(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ каменного стража";
	text[2] = "Ключ от сундука";
	text[3] = "В странном древнем строении на болоте";
	text[5] = NAME_Value;
	count[5] = value;
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
	text[2] = "Ключ от храма Аданоса";
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  Яхедра Акантар");
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
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWR_Addon_TreasureMap(C_Item)
{
	name = "Карта сокровищ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "";
	text[1] = "На карте отмечено несколько мест.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TreasureMap()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWR_Addon_TreasureMap);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Послание в бутылке";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "В бутылке находится листок бумаги.";
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Поцарапанная серебряная чаша";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

