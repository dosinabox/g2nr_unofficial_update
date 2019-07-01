
instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Камень знаний";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_METAL;
	scemeName = "SDW";
	description = name;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = "Письмо Гаронда лорду Хагену";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = name;
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Лорд Хаген!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Экспедиция в Долину Рудников завершилась провалом. Мы понесли огромные потери. Те, кому удалось выжить, заперты в замке, окруженном орками.");
	Doc_PrintLines(nDocID,0,"Мы неоднократно подвергались нападению драконов. Они опустошили земли вокруг замка. Надеюсь, с помощью Инноса мы сможем продержаться до прибытия подкрепления. Сами прорвать кольцо мы не сможем.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да поможет нам Иннос.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Гаронд");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = "Сообщение Милтена Горну";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseLetterForGorn()
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
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Горн!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Гаронд согласился освободить тебя - за 1000 золотых.");
	Doc_PrintLines(nDocID,0,"Так что если у тебя есть где-то припрятанное золотишко, самое время сказать об этом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Милтен");
	Doc_Show(nDocID);
};


instance ItKe_PrisonKey_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от темницы в замке.";
};

instance ItKe_OC_Store(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от склада в замке.";
};

instance ITKE_ErzBaronFlur(C_Item)
{
	name = "Ключ от первой двери";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "На нем выгравировано имя:";
	text[1] = "Гомез.";
};

instance ITKE_ErzBaronRaum(C_Item)
{
	name = "Ключ от второй двери";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "На нем выгравировано имя:";
	text[1] = "Гомез.";
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItMi_Pocket_Mis.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseGornsTreasure;
	description = name;
	text[0] = PRINT_Pocket_MIS;
	text[1] = "с именем 'Горн'.";
	text[2] = PRINT_Pocket_300;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	Gorns_Beutel = TRUE;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = "Записка Сильвестро";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"От королевского паладина Сильвестро");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Нас ждет еще один день раскопок. Сегодня мы собираемся пробиться через стену и углубиться дальше в скалу.");
	Doc_PrintLines(nDocID,0,"У меня нехорошие предчувствия, поэтому я намереваюсь спрятать руду.");
	Doc_PrintLines(nDocID,0,"Диего единственный из нас, кто хорошо ориентируется здесь. Я вынужден доверять ему. Он перенесет ящики в безопасное место - но я не позволю ему пойти одному.");
	Doc_PrintLines(nDocID,0,"Эту руду нужно сохранить во что бы то ни стало, поэтому я отправляю с Диего двух рыцарей.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да здравствует король.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Сильвестро");
	Doc_Show(nDocID);
	if((MIS_ScoutMine == LOG_Running) && Npc_IsDead(DiegoOW) && !Npc_KnowsInfo(other,DIA_DiegoOw_Beweise) && (Silvestro_Ore == FALSE))
	{
		B_LogEntry(TOPIC_ScoutMine,"Диего переправил в безопасное место руду, добытую старателями Сильвестро. Через некоторое время на шахту напали краулеры. Никто не выжил.");
	};
	Silvestro_Ore = TRUE;
};


instance ItAt_ClawLeader(C_Item)
{
	name = "Когти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_ClawLeader.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Когти вожака стаи снепперов.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_Olav(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket_Mis.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseOlav;
	description = name;
	text[0] = PRINT_Pocket_MIS;
	text[1] = "с именем 'Олав'.";
	text[2] = PRINT_Pocket_25;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_GoldPlate_MIS(C_Item)
{
	name = "Золотая тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Pass_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Этот маленький ключик";
	text[1] = "открывает ворота Прохода.";
	inv_zbias = 190;
};

instance ItKe_Bromor(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от комнаты";
	text[1] = "в борделе.";
};

instance ItKe_Rune_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Сундук, к которому подходит";
	text[1] = "этот ключ, находится под мостом.";
	text[2] = "В нем лежит рунный камень.";
};

instance ItWr_Bloody_MIS(C_Item)
{
	name = "Записка алхимика";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = name;
	text[0] = "Яд кровавых мух.";
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Жало кровавых мух содержит смертельный яд, и ни один человек в здравом уме не возьмет его в руки.");
	Doc_PrintLines(nDocID,0,"Если только он не владеет искусством извлечения жала и его обработки.");
	Doc_PrintLines(nDocID,0,"Жало необходимо аккуратно разрезать острым ножом от кончика до основания.");
	Doc_PrintLines(nDocID,0,"Верхний слой удаляется. Затем разрезается ткань вокруг желез.");
	Doc_PrintLines(nDocID,0,"Выделяющийся при разрезе сок обладает лечебными свойствами.");
	Doc_PrintLines(nDocID,0,"Однако, со временем человеческий организм становится невосприимчивым к этому лечебному зелью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дамарок");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_Screen,2);
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,PRINT_KnowsBloodfly);
		Knows_Bloodfly = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = "Закладная";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В качестве гарантии погашения долга принимается залог, стоимость которого равна сумме долга.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Залог: Орнаментированный золотой кубок из коллекции кровавых кубков.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Подписали:");
	Doc_PrintLine(nDocID,0,"Лютеро, торговец");
	Doc_PrintLine(nDocID,0,"Лемар, ростовщик");
	Doc_Show(nDocID);
};


instance ItWr_Map_OldWorld_Oremines_MIS(C_Item)
{
	name = "Карта рудников Гаронда";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_OW.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_OldWorld_Oremines()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Map_OldWorld_Oremines_Small_MIS(C_Item)
{
	name = "Карта рудников Гаронда";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_OW_Small.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines_Small;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_OldWorld_Oremines_Small()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_Small_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines_Small.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "Текст песни";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = name;
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Клич Доминика");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы заслужим Его уважение");
	Doc_PrintLines(nDocID,0,"Иннос всегда со мной и моими братьями");
	Doc_PrintLines(nDocID,0,"Я убью всех, кто встанет на моем пути");
	Doc_PrintLines(nDocID,0,"ибо в моем сердце горит Его огонь");
	Doc_PrintLines(nDocID,0,"Мой клинок служит только Ему");
	Doc_PrintLines(nDocID,0,"Его имя всегда у меня на устах");
	Doc_PrintLines(nDocID,0,"Любой, кто противостоит мне");
	Doc_PrintLines(nDocID,0,"падет от моей руки");
	Doc_PrintLines(nDocID,0,"ведь я воин Инноса");
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = "Сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = name;
	text[0] = "из замерзшего лагеря в Долине Рудников.";
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы покинули лагерь. Теперь, когда Барьер пал, мы отправимся на поиски центра разрушения. Возможно, там мы найдем ответы на вопросы, которые мы задавали столько долгих лет. Одному Аданосу ведомо, куда приведет нас наш путь.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Да пребудет с нами Аданос.");
	Doc_PrintLine(nDocID,0,"Сатурас");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = name;
	text[0] = "из пещеры в Долине Рудников.";
};


func void UseGilbertLetter()
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
	Doc_PrintLines(nDocID,0,"С меня хватит. Я устал прятаться здесь. И если слухи верны - Барьер, наконец, пал.");
	Doc_PrintLines(nDocID,0,"Вряд ли кто-то будет искать меня сейчас. Меня уже достала эта пещера и вся эта чертова долина. Пришло время возвращаться домой.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Гилберт");
	Doc_Show(nDocID);
};


instance ItRi_HP_01_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
//	description = NAME_ADDON_TengronsRing;
	description = NAME_ADDON_CASSIASBELOHNUNGSRING;
	text[0] = "Это кольцо принадлежит Тенгрону.";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] += Ri_Hp;
//	self.attribute[ATR_HITPOINTS] += Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] -= Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
//	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
//	{
//		self.attribute[ATR_HITPOINTS] -= Ri_Hp;
//	}
//	else
//	{
//		self.attribute[ATR_HITPOINTS] = 2;
//	};
};

