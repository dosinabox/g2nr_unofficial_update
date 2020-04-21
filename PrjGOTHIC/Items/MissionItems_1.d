
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от сундука,";
	text[1] = "принадлежащего Ксардасу.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "Поддельное письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = name;
	text[0] = "Эту бумагу дал мне Кантар, чтобы";
	text[1] = "я подбросил ее торговке Саре.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Последнее предупреждение");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"        Я уже несколько раз напоминал тебе,");
	Doc_PrintLines(nDocID,0,"        стараясь быть вежливым,");
	Doc_PrintLines(nDocID,0,"        что мне срочно необходимо оружие,");
	Doc_PrintLines(nDocID,0,"        заказанное у тебя неделю назад.");
	Doc_PrintLines(nDocID,0,"        Если я вскоре не получу от тебя никаких");
	Doc_PrintLines(nDocID,0,"        вестей, Сара, я буду вынужден изменить");
	Doc_PrintLines(nDocID,0,"        свое отношение к тебе. Надеюсь,");
	Doc_PrintLines(nDocID,0,"        мы понимаем друг друга!!!!!!!!!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            Онар");
//	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = NAME_2h_Rod;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rod;
	visual = "ItMw_035_2h_sld_sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Rod_Fake(C_Item)
{
	name = NAME_2h_Rod;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMw_035_2h_sld_sword_02.3DS";
	scemeName = "INSPECTWEAPON";
	material = MAT_METAL;
	description = name;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "Серебро Корагона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_CoragonsSilber.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "Пакет для Теклы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[0] = "Легкий пакет с травами Сагитты.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "Золотое блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_MariasGoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "На этом блюде выгравированы";
	text[1] = "имена: Онар и Мария.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Edge_01_Valentino(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо железной кожи";
	text[0] = "Это кольцо принадлежит Валентино.";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от сундука,";
	text[1] = "принадлежащего Декстеру.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Список трав Константино";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Алхимические травы:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Лечебная трава");
	Doc_PrintLine(nDocID,0,"Лечебное растение");
	Doc_PrintLine(nDocID,0,"Лечебный корень");
	Doc_PrintLine(nDocID,0,"Огненная крапива");
	Doc_PrintLine(nDocID,0,"Огненная трава");
	Doc_PrintLine(nDocID,0,"Огненный корень");
	Doc_PrintLine(nDocID,0,"Гоблинская ягода");
	Doc_PrintLine(nDocID,0,"Драконий корень");
	Doc_PrintLine(nDocID,0,"Снеппер-трава");
	Doc_PrintLine(nDocID,0,"Луговой горец");
	Doc_PrintLine(nDocID,0,"Царский щавель");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Примечание: Пусть кандидат в ученики соберет эти травы для тебя. Это позволит проверить его способности.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"С уважением, Зурис");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Рецепт магических зелий";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Магические зелья");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Чтобы сварить магическое зелье, опытному алхимику необходимы:");
//	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Огненная крапива");
	Doc_PrintLine(nDocID,0,"Огненная трава");
	Doc_PrintLine(nDocID,0,"Огненный корень");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Также ему понадобится:");
	Doc_PrintLine(nDocID,0,"Луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мастер Неорас");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "Пропуск";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[0] = "Эта бумага позволит мне";
	text[1] = "пройти мимо стражников у ворот.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Пропуск");
	Doc_PrintLine(nDocID,0,"            Хоринис");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"        Этот документ дает право");
	Doc_PrintLines(nDocID,0,"        свободного прохода по всему нижнему");
	Doc_PrintLines(nDocID,0,"        Хоринису на неограниченный период времени.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            Лариус");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            королевский губернатор");
//	Doc_PrintLine(nDocID,0,"");
//	Doc_PrintLine(nDocID,0,"");
//	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	Player_KnowsLariusAsGovernor = TRUE;
};


instance ItMi_HerbPaket(C_Item)
{
	name = "Тюк травы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_HerbPaket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Тяжелый, липкий тюк,";
	text[1] = "пахнущий болотной травой.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Storage(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от портового склада.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Странная рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = name;
	text[0] = "Что-то с этой рыбой не так.";
	text[1] = "Похоже, она была зашита...";
};


func void Use_HalvorFish()
{
	Snd_Play("CS_IHL_WO_WA");
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "Вонючая записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[0] = "Эта записка была спрятана в рыбе.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseHalvorMessage()
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
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Не высовывайтесь, парни!");
	Doc_PrintLines(nDocID,0,"    Ополчение становится подозрительным.");
	Doc_PrintLines(nDocID,0,"    Не предпринимайте ничего,");
	Doc_PrintLines(nDocID,0,"    пока я не дам знать о себе!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    Халвор");
	Doc_Show(nDocID);
	Knows_Halvor = TRUE;
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Меч Альрика";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = Damage_Alrik;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Alrik;
	visual = "ItMw_025_1h_Sld_Sword_02.3DS";
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

/*
func void Equip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
	if(Npc_IsPlayer(self))
	{
		b_meleeweaponchange(10,0,0);
	};
};

func void UnEquip_AlriksSword()
{
	if(!Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10);
	};
	if(Npc_IsPlayer(self) && ((MELEEWEAPONCHANGEDHERO == TRUE) || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10);
		b_meleeweaponundochange();
	};
};
*/

instance ItWr_VatrasMessage(C_Item)
{
	name = NAME_LetterSealed;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageSealed;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Письмо Ватраса магам Огня.";
};


func void UseVatrasMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дорогой Исгарот,");
	Doc_PrintLines(nDocID,0,"Я ощущаю все нарастающее присутствие другой силы.");
	Doc_PrintLines(nDocID,0,"Это сила, доселе неведомая нам. Может ли быть так, что вассалы Белиара уже близко?");
	Doc_PrintLines(nDocID,0,"Я могу ошибаться, но я полагаю, что отцу Пирокару стоило бы разобраться с этим вопросом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Да не останутся наши молитвы без ответа.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ватрас");
	Doc_Show(nDocID);
};


func void UseVatrasMessageSealed()
{
	Snd_Play("PICKLOCK_BROKEN");
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	UseVatrasMessage();
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAP";
	description = name;
	text[0] = "Письмо Ватраса магам Огня.";
	text[1] = "Печать сломана.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


/*instance ItKe_Hotel(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от комнаты отеля.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};*/

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Этот ключ изъеден";
	text[1] = "соленой морской водой.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от подвала отеля.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от входа";
	text[1] = "в монастырь Инноса.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от монастырской сокровищницы.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от монастырской кладовой.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от монастырской кельи.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от монастырской библиотеки.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Баранья колбаса";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Schafswurst.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_UltharsHolyWater.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Эссенция духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "Священный молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
//	text[2] = "Урон:                     ??";
//	text[3] = "Необходима сила:          ??";
//	text[4] = "Двуручное оружие";
//	text[5] = "Цена:  невозможно определить";
//	text[2] = NAME_Damage;
//	count[2] = damageTotal;
//	text[3] = NAME_Str_needed;
//	count[3] = cond_value[2];
	text[2] = "Урон неизвестен";
	text[3] = "Требование к силе неизвестно";
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_MagicChest(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Старый железный ключ.";
	text[1] = "Возможно, это ключ";
	text[2] = "от висячего замка.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "Предложение мира паладинам";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[0] = "Эта записка должна помочь мне";
	text[1] = "встретиться с лордом Хагеном.";
};


func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Глубокоуважаемый лорд Хаген,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы оба прекрасно знаем, в какой ситуации вы находитесь. И, учитывая обстоятельства, я предлагаю следующее соглашение:");
	Doc_PrintLines(nDocID,0,"Вы даруете моим людям полное отпущение грехов перед Инносом и королем.");
	Doc_PrintLines(nDocID,0,"Взамен мы предлагаем вам свою помощь в обороне города и прилегающих земель.");
	Doc_PrintLines(nDocID,0,"Кроме того, я лично прослежу за тем, чтобы мои люди держались подальше от местных ферм - за исключением, естественно, фермы Онара, где мы расквартированы.");
	Doc_PrintLines(nDocID,0,"Я знаю, что на корабле, на котором вы собираетесь отправиться на материк, вполне достаточно места, как для меня, так и для моих избранных людей. Когда вы поднимете паруса, я хочу тоже быть на борту.");
	Doc_PrintLines(nDocID,0,"Я умоляю вас: примите решение со всей присущей вам мудростью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Подпись:   Генерал Ли");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[0] = "Я забрал его у одного из бандитов Браго.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Задерживайте всех, спустившихся с гор.");
	Doc_PrintLines(nDocID,0,"Вполне вероятно, что через проход");
	Doc_PrintLines(nDocID,0," попытается пройти старик.");
	Doc_PrintLines(nDocID,0,"Не дайте ему обмануть вас -");
	Doc_PrintLines(nDocID,0,"    это очень опасный колдун.");
	Doc_PrintLines(nDocID,0,"Присматривайте за ним.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLines(nDocID,0,"Возможно, человек, которого мы ищем,");
	Doc_PrintLines(nDocID,0,"    выйдет с ним на связь.");
	Doc_PrintLines(nDocID,0,"С этим письмом я посылаю вам");
	Doc_PrintLines(nDocID,0,"    тридцать золотых самородков.");
	Doc_PrintLines(nDocID,0,"Я дам еще тридцать любому,");
	Doc_PrintLines(nDocID,0,"    кто убьет этого человека.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLines(nDocID,0,"Принесите его голову к старой шахте");
	Doc_PrintLines(nDocID,0,"    около поместья землевладельца.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Д.");
//	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[0] = "Мое изображение!";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Этот ключ принадлежал бандиту.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[0] = "Этот лук принадлежит Босперу.";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо деревянной кожи";
	text[0] = "Это кольцо принадлежит Константино.";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Статуэтка Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "На задней стороне нацарапаны слова:";
	text[1] = "'Иннос, бог правосудия,";
	text[2] = "благослови и сохрани меня,";
	text[3] = "и защити меня от боли'.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ скелета из первой комнаты.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ скелета из второй комнаты.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ скелета из третьей комнаты.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};


const int Value_ITAR_PAL_Skel = 500;

instance ITAR_PAL_Skel(C_Item)
{
	name = "Старые доспехи паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = Value_ITAR_PAL_Skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_Skel.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от сундука,";
	text[1] = "принадлежащего Валентино.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Buerger(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Он лежал на камине.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Richter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от сундука,";
	text[1] = "принадлежащего судье.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Salandril(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от сундука, принадлежащего";
	text[1] = "алхимику Саландрилу.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Маленький латунный ключик";
	text[1] = "из дома паладинов.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Маленький ключик.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ржавый ключ от двери";
	text[1] = "в канализации.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Долговая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Принадлежит ростовщику Лемару.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


func void UseSchuldBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сделки и долги");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, мастер Торбен, плотник Хориниса, должен глубокоуважаемому Лемару 200 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Торбен");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, Корагон, трактирщик Хориниса, должен глубокоуважаемому Лемару 150 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Корагон");
//	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Я, Ханна, владелица отеля Хориниса, должна глубокоуважаемому Лемару 250 золотых монет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"               Ханна");
//	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
	SchuldBuchNamesKnown = TRUE;
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "Солнечное алоэ";
	mainflag = ITEM_KAT_FOOD;
//	flags = ITEM_MULTI;
	flags = ITEM_MISSION;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Sagitta_Herb.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Orlan_HotelZimmer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от комнаты";
	text[1] = "в таверне 'Мертвая гарпия'.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Арбалет Драгомира";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 65;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
//	visual = "ItRw_Crossbow_L_02.mms";
	visual = "ITRW_CROSSBOW_MISSION.MMS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GregsSilverPlate(C_Item)
{
	name = "Серебряное блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 130;
	visual = "ItMi_GregsSilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

