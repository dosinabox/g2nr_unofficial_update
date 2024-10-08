
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
	text[0] = "��� ������ ��������� ����������.";
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
	Doc_PrintLine(nDocID,0,"������� ������,");
	Doc_PrintLines(nDocID,0,"�� ����� ������. �� ��� ����.");
	Doc_PrintLines(nDocID,0,"������, ��� ��� ������������� ���� ������������� �������. � ����� ���� ��������� ��� ��� ���, ��������� ����� ��������.");
	Doc_PrintLines(nDocID,0,"��� ���������� �������� �������� �� ���������� ��� ��������� ����.");
	Doc_PrintLines(nDocID,0,"������ ����� ���������� �������� ���� ������ ������� �������.");
	Doc_PrintLines(nDocID,0,"�������, ��� ���� ������������ ��������� �������� ����� ����������.");
	Doc_PrintLines(nDocID,0,"��������� ���� �������� ����� ������� ������� ��������, ��� �� ������. ������, ��� ��� ��������-����. ���, � ��� ������ ����� ���. �� ������ �������� ��.");
	Doc_PrintLines(nDocID,0,"������� ������ �� ������ ������ ����, ����� �� ������ ��� ��������. ���� ��������, �� ������� ���������.");
	Doc_PrintLines(nDocID,0,"�� � ��� ���������� ����������, ��������� ���� ��� ������.");
	Doc_PrintLines(nDocID,0,"�������, ��, ��� �� ������ - ���������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������");
	Doc_Show(nDocID);
	if(Use_SaturasFirstMessage_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		if(SC_KnowsRanger == FALSE)
		{
			B_LogEntries(TOPIC_Addon_KDW,"� ������ � ������� ������, ������� �������� ������ ��� ��������� ���� ���� �������. ������ ��� ��� ������.");
			Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
			B_LogNextEntry(TOPIC_Addon_RingOfWater,"���������� �����-�� ����������, ������� ���������� '������ ����'. ������, ��� ��������� �� ���� ����.");
			Log_AddEntry(TOPIC_Addon_RingOfWater,"�������� ����������� � '������ ����'.");
			SC_KnowsRanger = TRUE;
		}
		else
		{
			B_LogEntry(TOPIC_Addon_KDW,"� ������ � ������� ������, ������� �������� ������ ��� ��������� ���� ���� �������. ������ ��� ��� ������.");
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
	text[0] = "������ �������� �������.";
	text[1] = "������ �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "�������� ��������, ������ ����������� ������.";
	inv_zbias = 270;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "�������� ��������, ������ ����������� ������.";
	text[1] = "��� ��� ��� ������.";
	inv_zbias = 270;
};

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name = "����� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = name;
	text[0] = "�� ���� ����� �������� �����, ���, ��� ��������";
	text[1] = "��������, ����� ����� ����������� ���������.";
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
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(nDocID,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(nDocID,-28000,50500,95500,-42500);
	Doc_Show(nDocID);
};


instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name = "����� ������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = name;
	text[0] = "����� ���� ������� �����,";
	text[1] = "��� � ���� ����� ������������";
	text[2] = "�������� ��������.";
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
	name = "������������� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Rangerring.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = "��������������� ���� ������ ������ ����.";
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
	text[1] = "��� ������ ����������� ������.";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	on_equip = Equip_ItRi_Ranger_My;
	on_unequip = UnEquip_ItRi_Ranger_My;
	text[1] = "��� ������ ����������� ���.";
};

instance ItRi_Ranger_Lance_Addon(Rangerring_Prototype)
{
	on_equip = Equip_ItRi_Ranger_Lance;
	on_unequip = UnEquip_ItRi_Ranger_Lance;
	text[1] = "��� ������ ����������� �����.";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ��������� ������.";
	inv_zbias = 190;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = "���������������� ������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������ ������� ���";
	text[1] = "�������������� � ���������.";
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
	Doc_PrintLine(nDocID,0,"��������� ���� �����!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ���� ������� � ��������� ��� ������ ������� ��� ���������.");
	Doc_PrintLines(nDocID,0,"�� ��� ����� ��� � ����� ������ � ��������� ����.");
	Doc_PrintLines(nDocID,0,"� ������, ��� �� ������� �������� ������ � ����������� ������� ����� ������.");
	Doc_PrintLine(nDocID,0,"�����, ����� ������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     ��������� ������");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "� ������ ��� ������ � ��������,";
	text[1] = "������������ ��������.";
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
	Doc_PrintLine(nDocID,0,"�������, �������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� � ��� ��� ������ �������, �� �� ��� ��������� ���������.");
	Doc_PrintLines(nDocID,0,"���� �� � ��������� ����� �� �������� ��� ����� ������ ���������� �����, �� � ��� �������� ��������� �������� � ��������.");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ����, ��� ������ �����������. �����, ��� �� ����� ��������� ����, ��� ��� ��������.");
	Doc_PrintLines(nDocID,0,"��� ����� � ������ � ����. ������ ����� ��� ������ ����� ��� ��������.");
	Doc_PrintLines(nDocID,0,"� ��� ����:");
	Doc_PrintLines(nDocID,0,"���� ��� ������ ��� �������� ����� ���� ����� ������-��������� ����. ���� �� �� ����� ������� �������, ��� ���������� ���������� ������ �����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     �����");
	Doc_Show(nDocID);
	if(SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		if(SC_HearedAboutMissingPeople == TRUE)
		{
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"������ � ���� ���� ���������� �������������� ����, ��� �����, ������ ������ �����, ����� �� ����������� ������� ��������. ������� ������ ��������� ���-�� �� ������ �� ������-�������.");
		};
		if(MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running)
		{
			Log_AddEntry(TOPIC_Addon_WhoStolePeople,"� ������ �������� ���� �������� �������.");
		};
		SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	};
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = "���������������� ������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������ ������� ���";
	text[1] = "������� � ��������� ����� ����,";
	text[2] = "�� �������� �� ����.";
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
	Doc_PrintLines(nDocID,0,"������ ����!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ��������, ��� �� ���� � ��� ��������� �� �������� �����.");
	Doc_PrintLines(nDocID,0,"� ���� ������� � ��������� ��� �������� ��������, ������� �������� ������ �������������� � ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     ������");
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
	text[0] = "�� ������ ������� ������������";
	text[1] = "������ ����� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = "���������� ������ �����";
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
	Doc_PrintLines(nDocID,0,"������� ������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� �� ���� ����� �����, ����� �������� ���� ���������.");
	Doc_PrintLines(nDocID,0,"� ����, ��� �� �� ������� ����, �� � ������ � ������, ��� � ��� ��� ����� ����� �����, ���� �� ������� ���� ����� ��������� �������, ��� �.");
	Doc_PrintLines(nDocID,0,"� �� ������� ������, ���� � ������ �����������. ������ ����. ������ �������� �����, ��� ��, �� ����� �����������. ������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     �����");
	Doc_Show(nDocID);
	if(MIS_LuciasLetter == FALSE)
	{
		if(MIS_LookingForLucia == LOG_Running)
		{
			Log_AddEntry(TOPIC_Addon_Lucia,"����� �������� ������� ���������� ������. ��� ������ ��� ��������������.");
		};
		if(Elvrich_IsDead == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_LuciasLetter,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_LuciasLetter,LOG_Running);
			B_LogEntry(TOPIC_Addon_LuciasLetter,"����� �������� ������� ���������� ������. ��� ������ ��� ��������������.");
		};
		MIS_LuciasLetter = LOG_Running;
	};
	LuciaMentionedInKhorinis = TRUE;
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "������";
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
	description = "������ �������";
	text[0] = "������������� ������";
	text[1] = "������� ��������� ��������.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[0] = "� ����� ��� ������ � ��������";
	text[1] = "�� ������ ������.";
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
	Doc_PrintLines(nDocID,0,"15 �������� �����");
	Doc_PrintLines(nDocID,0,"20 ����");
	Doc_PrintLines(nDocID,0,"25 ������� �����");
	Doc_PrintLines(nDocID,0,"15 ������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ��� ��������� ���.");
	Doc_PrintLines(nDocID,0,"��� ���������� ������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"��������");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != FALSE) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"� ����� ��������, ������������, ��� �������� �������� ����������� ������, �������� � ���.");
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
	text[0] = "������ ������� ��������.";
};


func void Use_Vatras2Saturas_FindRaven()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������� �������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������, ��� ����� ���� ���� ����� ����������. � ������ ��������, ������, ������������. �� � �����, ��� ��� ���������� ��������. ����������! �� ����� ��� �����.");
	Doc_PrintLines(nDocID,0,"� ������ ���� ������ � ���� ����������� ���� ����������. ��� ������������� ���� ������������� �������. ���� ��������� � �� ��� ����������� �������� ����.");
	Doc_PrintLines(nDocID,0,"��������� ������� �������� ��������� � ������� ������� ������ ������. �� ��������� ���, ���� ������ ����� ������.");
	Doc_PrintLines(nDocID,0,"� ��� ����. � ������� ���� ���������. ��� ���, ��� �������� ���� ��� ���������. � ��� ������ ���� ����� ���������... � �� ������, ��, ��������, ��� ��. ���� �� ������������ ��� ��-�������.");
	Doc_PrintLines(nDocID,0,"������� ���. �����, ��� � ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������");
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
	text[0] = "������ ������� ��������.";
	text[1] = "������ �������.";
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
	text[0] = "������ ������ ����������� �������.";
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
	name = "���� �������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	description = name;
	text[0] = "��� ���� ������ �����!";
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
	description = "������ �������";
	text[0] = "������ �������� ���������� ���.";
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
	name = "������������ ������";
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
	name = "����� �� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_SteelPacket.3ds";
	material = MAT_STONE;
	description = name;
	text[0] = "����� ����� �������.";
	text[1] = "� ��� ��������� ������� ������ �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "������ �������� ��������";
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
	text[0] = "����� �������� ��������.";
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
		Doc_PrintLines(nDocID,0,"����� ������ �������� �� ��� ������������ ����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�������, ������� �����������, ��� ������. �� ��� ���� ���� ����������� �� ��� ���� �� ����� ��� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�� ���� ���������� ����� ���.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� ������� ��������� �� ��������!");
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
	name = "������� �������� ��������";
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
//		Doc_PrintLines(nDocID,0,"��, ��������� ���� �� ������ ����, ���������� � ����� ������� � �������� ����, ����� ��� ������ ������� �� ������� ����.");
		Doc_PrintLines(nDocID,0,"��, ��������� ���� �� ������ ����, ���������� � ����� ������� � �������� ����, ����� ��� ������ ������� �� ������ ����.");
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
	name = "���������� �������� ��������";
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
		Doc_PrintLines(nDocID,0,"������� ������ � ������� ��������� ������ ����������. ���� ������ ���� ��� ��� �����������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���������� � ����������� ���� ������ �.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�������, ��� ������� ��������� ����� � ����� ������!");
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
	name = "����� �������� ��������";
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
		Doc_PrintLines(nDocID,0,"�������� ������ ������ �������. ���� ���, ��� ������� �� ���� ����� �� ������ �����, ��������� �������� ����.");
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
	name = "������� �������� ��������";
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
		Doc_PrintLines(nDocID,0,"������ ������� ������ ����������. ���� �� �����, ��� ������� ����.");
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
	name = "������ �������� ��������";
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
		Doc_PrintLines(nDocID,0,"�, ���, ��� ��� ������ ������� ������ ����, ������ ������ �������. ���� � ���� ���������� �����.");
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
	name = "������� ������";
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
	name = "������ � �����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 750;
	visual = "ItSe_Addon_FrancisChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = FrancisChest;
	description = name;
	text[0] = "������ ����� �������.";
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
	AI_PrintScreen("����� �������� ��������",-1,49,FONT_ScreenSmall,4);
	AI_PrintScreen("������� ������ ��������",-1,40,FONT_ScreenSmall,4);
	AI_PrintScreen("153 ������� ��������",-1,52,FONT_ScreenSmall,4);
	AI_PrintScreen("������� ����� ��������",-1,43,FONT_ScreenSmall,4);
	AI_PrintScreen("���������� �������� ��������",-1,46,FONT_ScreenSmall,4);
	Snd_Play("Geldbeutel");
};


instance ItSe_Addon_EmptyFrancisChest(C_Item)
{
	name = "������ ������";
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
	name = "����� ��������";
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
	Doc_PrintLine(nDocID,0,"����. ������� '�������'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ������: 15560 ���.");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������: 9840");
	Doc_PrintLine(nDocID,0,"�������: 2500");
	Doc_PrintLine(nDocID,0,"�������: 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������ ����: 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����. ������� '������'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ������: 4390 ���.");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������: 2390");
	Doc_PrintLine(nDocID,0,"�������: 500");
	Doc_PrintLine(nDocID,0,"�������: 500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������ ����: 1000");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����. ������� '����'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����� ������: 9970 ���.");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�������: 5610");
	Doc_PrintLine(nDocID,1,"�������: 1500");
	Doc_PrintLine(nDocID,1,"�������: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������ ����: 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����. ������� '�����'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����� ������: 7851 ���.");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�������: 4400");
	Doc_PrintLine(nDocID,1,"�������: 750");
	Doc_PrintLine(nDocID,1,"�������: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������ ����: 1701");
	Doc_Show(nDocID);
	if(Francis_HasProof == FALSE)
	{
		B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
		Francis_HasProof = TRUE;
	};
};


instance ItWr_Addon_GregsLogbuch_MIS(C_Item)
{
	name = "������� �����";
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
	Doc_PrintLines(nDocID,0,"� �� ����� ��� ���� ������! ����� �����. � �� ���� �������� ����� - ��� �������. ��� ��� �� �������� ������� � ������ ������ �� ��������� � ����� ����� � ����. ���� ���������� � ���� ������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ��� �� �����?! ��� ������ �������� ������� ����. �� �� ���� ����� �����! � ������������ ������ �������� ����� ��������� �������� �� ���� �����.");
	Doc_PrintLines(nDocID,0,"���� �� �� �����������, � ���� ����� ������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLines(nDocID,1,"��� ������� ������ ���������! ��� �� ��� ��� �� ��������� �� ��������� ������. �� � ��� ���� ������������ ����������. ����� ��������, ��� ������� �����.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� �������� �������� ����� ������� �� �������. ��� ����� �������� ����. � ������ ��������� ������� � ��������� ������� �����.");
	Doc_PrintLines(nDocID,1,"������� ������ ������. � ����� ������� ������. �� ���������� � ������ �������� � ������, ��� ��������� �����.");
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
	description = "���� ��������";
	text[0] = "��������� ��� ������ � �����.";
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
	description = "���� ��������� ������";
	text[0] = "���� �� ������� � ��������";
	text[1] = "������� �������� �� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "�������� �������� �����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	description = name;
	text[0] = "���� �� ����� �������.";
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
	Doc_PrintLine(nDocID,0,"  ����-���� �������");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_FakeBloodwynHead(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
};

instance ItWr_Addon_TreasureMap(C_Item)
{
	name = "����� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_AW.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "�� ����� �������� ��������� ����.";
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
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Addon_GregsTreasureBottle_MIS.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "� ������� ��������� ������ ������.";
};


func void Use_GregsBottle()
{
	Snd_Play("RELEASECORK");
	B_PlayerFindItem(ItWr_Addon_TreasureMap,1);
};


instance ItMi_ErolsKelch(C_Item)
{
	name = "������������ ���������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_ErolsKelch.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

