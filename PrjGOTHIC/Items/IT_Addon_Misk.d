
const int Value_Goldnugget = 18;
const int Value_WhitePearl = 120;
const int Value_Addon_Joint_01 = 60;

instance ItMi_GoldNugget_Addon(C_Item)
{
	name = "Золотой самородок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Goldnugget;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Addon_WhitePearl(C_Item)
{
	name = "Жемчужина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WhitePearl;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_Addon_Joint_01(C_Item)
{
	name = "Зеленый послушник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Addon_Joint_01;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Addon_Joint_01;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


var int FirstJoint;

func void Use_Addon_Joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_GivePlayerXP(5);
		};
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ItMi_BaltramPaket(C_Item)
{
	name = "Пакет для Бальтрама";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тяжелый пакет с";
	text[3] = "различными товарами";
	text[4] = "с фермы Акила";
};

instance ItMi_Packet_Baltram4Skip_Addon(C_Item)
{
	name = "Пакет для Скипа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тяжелый пакет";
	text[3] = "с различными товарами";
	text[4] = "для пирата Скипа";
};

instance ItMi_BromorsGeld_Addon(C_Item)
{
	name = "Золотая чаша Бромора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "На дне этой чаши ";
	text[3] = "острым предметом нацарапано";
	text[4] = "имя 'Бромор'.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name = "Кожаный мешочек Кавалорна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_CavalornsBeutel;
	description = name;
	text[0] = "";
	text[1] = "На мешочке прикреплен ярлык";
	text[2] = "с именем 'Кавалорн'";
	text[3] = "Внутри находится 1 кусок руды";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_CavalornsBeutel()
{
	CreateInvItems(hero,ItMi_Nugget,1);
	Print(PRINT_FoundOreNugget);
	SC_OpenedCavalornsBeutel = TRUE;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Я нашел мешочек с куском руды около хижины Кавалорна в Долине рудников. Его, должно быть, забыл там старый пройдоха Кавалорн.");
};


instance ItMi_Skull(C_Item)
{
	name = "Череп";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_IECello(C_Item)
{
	name = "Виолончель";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemeName = "CELLO";
	on_state[0] = Use_Cello;
	description = name;
};


func void Use_Cello()
{
};


instance ItMi_IECelloBow(C_Item)
{
	name = "Виолончельный лук";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_IEDrum(C_Item)
{
	name = "Барабан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemeName = "PAUKE";
	on_state[0] = Use_Drum;
	description = name;
};


func void Use_Drum()
{
};


instance ItMi_IEDrumScheit(C_Item)
{
	name = "Тромба марина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemeName = "DRUMSCHEIT";
	on_state[0] = Use_Drumscheit;
	description = name;
};


func void Use_Drumscheit()
{
};


instance ItMi_IEDrumStick(C_Item)
{
	name = "Барабанная палочка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_IEDudelBlau(C_Item)
{
	name = "Синяя волынка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
};


func void Use_Dudel()
{
};


instance ItMi_IEDudelGelb(C_Item)
{
	name = "Желтая волынка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
};

instance ItMi_IEHarfe(C_Item)
{
	name = "Арфа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemeName = "HARFE";
	on_state[0] = Use_Harfe;
	description = name;
};


func void Use_Harfe()
{
};


instance ItMi_IELaute(C_Item)
{
	name = "Лютня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemeName = "IELAUTE";
	on_state[0] = Use_Laute;
	description = name;
};


func void Use_Laute()
{
};


instance ItMi_Addon_Lennar_Paket(C_Item)
{
	name = "Звенящий пакет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_LennarPaket;
	material = MAT_LEATHER;
	description = name;
	text[2] = "Внутри находятся отмычки";
	text[3] = "";
	text[4] = "Много отмычек";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_LennarPaket()
{
	B_PlayerFindItem(ItKE_lockpick,Lennar_picklock_amount);
	Snd_Play("Geldbeutel");
	LennarPaket_Open = TRUE;
};


instance ItMi_Zeitspalt_Addon(C_Item)
{
	name = "Черная руда";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemeName = "MAPSEALED";
	on_state[0] = Use_Zeitspalt_Addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[3] = "Эффект неизвестен.";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void Use_Zeitspalt_Addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};

