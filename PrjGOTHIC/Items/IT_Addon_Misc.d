
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
	name = NAME_Joint;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Addon_Joint_01;
	visual = "ItMi_Addon_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Addon_Joint_01;
	description = "Зеленый послушник";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 200;
};


var int FirstJoint;

func void Use_Addon_Joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FirstJoint == FALSE)
		{
			if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY))
			{
				B_GivePlayerXP(50);
			}
			else
			{
				B_GivePlayerXP(5);
			};
			FirstJoint = TRUE;
		};
		Wld_StopEffect("SLOW_TIME");
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
	text[0] = "Тяжелый пакет с различными";
	text[1] = "товарами с фермы Акила.";
	text[5] = NAME_Value;
	count[5] = value;
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
	text[0] = "Тяжелый пакет с различными";
	text[1] = "товарами для пирата Скипа.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_BromorsGeld_Addon(C_Item)
{
	name = "Золотое блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_MariasGoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Острым предметом на дне";
	text[1] = "нацарапано имя 'Бромор'.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Pocket_Mis.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_CavalornsBeutel;
	description = name;
	text[0] = PRINT_Pocket_MIS;
	text[1] = "с именем 'Кавалорн'.";
	text[2] = "Внутри находится кусок руды.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_CavalornsBeutel()
{
	B_PlayerFindItem(ItMi_Nugget,1);
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Я нашел мешочек с куском руды около хижины Кавалорна в Долине Рудников. Его, должно быть, забыл там старый пройдоха Кавалорн.");
	SC_OpenedCavalornsBeutel = TRUE;
};


instance ItMi_Skull(C_Item)
{
	name = "Череп";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IECello(C_Item)
{
	name = "Виолончель";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemeName = "CELLO";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IECelloBow(C_Item)
{
	name = "Виолончельный смычок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IEDrum(C_Item)
{
	name = "Барабан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemeName = "PAUKE";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IEDrumStick(C_Item)
{
	name = "Барабанная палочка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = 55;
};

instance ItMi_IEDrumScheit(C_Item)
{
	name = "Трумшайт";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemeName = "DRUMSCHEIT";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IEDudelBlau(C_Item)
{
	name = "Синяя волынка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_LEATHER;
	scemeName = "DUDEL";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IEDudelGelb(C_Item)
{
	name = "Желтая волынка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_LEATHER;
	scemeName = "DUDEL";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IEHarfe(C_Item)
{
	name = "Арфа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemeName = "HARFE";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_IELaute(C_Item)
{
	name = "Гитара";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemeName = "IELAUTE";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 45;
	inv_rotx = 270;
	inv_roty = 295;
};

instance ItMi_Addon_Fisk_Paket(C_Item)
{
	name = "Звенящий пакет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_FiskPaket;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Внутри находятся отмычки.";
	text[1] = "Много отмычек.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_FiskPaket()
{
	B_PlayerFindItem(ItKe_Lockpick,Fisk_Lockpicks_amount);
	Snd_Play("Geldbeutel");
	FiskPaket_Open = TRUE;
};


instance ItMi_Grog_Crate(C_Item)
{
	name = "Ящик с грогом";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Grog * 4;
	visual = "ItMi_Crate.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_Grog_Crate;
	material = MAT_WOOD;
	description = name;
	text[0] = "Внутри находятся четыре бутылки грога.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Grog_Crate()
{
	B_PlayerFindItem(ItFo_Addon_Grog,4);
};


instance ItMi_Zeitspalt_Addon(C_Item)
{
	name = "Черная руда";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemeName = "MAPSEALED";
	on_state[0] = Use_Zeitspalt_Addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
//	text[0] = PRINT_UnknownEffect;
	text[1] = TEXT_Zeitspalt_Setting;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void Use_Zeitspalt_Addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
		TEXT_Zeitspalt_Setting = PRINT_SlowTime;
		Zeitspalt_Used = TRUE;
	};
};


