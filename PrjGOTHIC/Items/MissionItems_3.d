
const int AM_EyeProtEdge = 10;
const int AM_EyeProtPoint = 10;
const int AM_EyeProtMage = 20;
const int AM_EyeProtFire = 20;

instance ItMi_InnosEye_MIS(C_Item)
{
	name = NAME_InnosEye;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	text[0] = "Глаз пульсирует энергией.";
	text[1] = NAME_Prot_Edge;
	count[1] = AM_EyeProtEdge;
	text[2] = NAME_Prot_Point;
	count[2] = AM_EyeProtPoint;
	text[3] = NAME_Prot_Fire;
	count[3] = AM_EyeProtFire;
	text[4] = NAME_Prot_Magic;
	count[4] = AM_EyeProtMage;
};


func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_EyeProtEdge;
	self.protection[PROT_BLUNT] += AM_EyeProtEdge;
	self.protection[PROT_POINT] += AM_EyeProtPoint;
	self.protection[PROT_FIRE] += AM_EyeProtFire;
	self.protection[PROT_MAGIC] += AM_EyeProtMage;
//	PrintScreen("",-1,-1,FONT_Screen,0);
	SC_IsWearingInnosEye = TRUE;
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_EDGE] -= AM_EyeProtEdge;
	self.protection[PROT_BLUNT] -= AM_EyeProtEdge;
	self.protection[PROT_POINT] -= AM_EyeProtPoint;
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
	self.protection[PROT_MAGIC] -= AM_EyeProtMage;
	SC_IsWearingInnosEye = FALSE;
};


instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = NAME_InnosEye;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_Discharged_MIS.3DS";
	material = MAT_METAL;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	text[0] = "Глаз потух и не сияет.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = NAME_InnosEye;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_Broken_MIS.3DS";
	material = MAT_METAL;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[0] = TEXT_Innoseye_Setting;
	text[1] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = "Письмо для Пирокара";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = name;
	text[0] = "О подтверждении полномочий.";
};


func void Use_PermissionToWearInnosEye()
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
	Doc_PrintLines(nDocID,0,"Предъявителю этого документа даровано право входа в священные залы монастыря.");
	Doc_PrintLines(nDocID,0,"Его пожелания, касательно владения Глазом Инноса должны выполняться немедленно.");
	Doc_PrintLines(nDocID,0,"Вышеуказанное следует считать действительным вследствие силы моей позиции в качестве властителя этого острова и представителя короля, а также учитывая договор о разделении церкви Инноса во 2 году от Огня.");
	Doc_PrintLines(nDocID,0,"P.S. Я ожидаю неукоснительного выполнения моих указаний.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да хранит Иннос короля.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"        Лорд Хаген");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
{
	name = "Чертоги Ирдората";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_XardasBookForPyrokar;
};


func void Use_XardasBookForPyrokar()
{
	Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от сундука на ферме Секоба.";
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = "Дневник Корнелиуса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = UseCorneliusTagebuch;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если Лариус будет продолжать в том же духе, мне придется начать подыскивать себе другое место.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Что-то странное произошло со мной прошлой ночью. Мне нанес визит один из этих парней в черных капюшонах, о которых ходит столько слухов последнее время. Я не очень-то испугался, даже несмотря на то, что, как говорят, они - само Зло. Эти люди прямо-таки источают силу. Но голос был спокойным и располагающим к себе.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Он предложил мне 20000 золотых за то, чтобы один из наемников был осужден. Он сказал, что я пойму, что он имел в виду, когда это произойдет.");
	Doc_PrintLines(nDocID,1,"Конечно же, я согласился. Эти наемники все равно не заслуживают лучшей участи. Если бы не они, у меня все было бы хорошо. И это золото позволит мне спокойно встретить старость.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Это произошло - один из наемников был арестован. Сдержать мое слово будет просто.");
	Doc_Show(nDocID);
	PrintScreen("",-1,-1,FONT_Screen,0);
	if(Cornelius_IsLiar == FALSE)
	{
		B_LogEntry(TOPIC_RescueBennet,"Этот дневник - доказательство, необходимое для подтверждения невиновности Беннета.");
		Cornelius_IsLiar = TRUE;
	};
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = "Альманах Одержимых";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_DementorObsessionBook;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_BookHeadline);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"edef Kon dirandorix");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"in Sparady bell");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"el utoy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kho ray xaondron");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"em piratoram endro");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		if(Kapitel >= 3)
		{
			Doc_PrintLine(nDocID,1,"           ВИНО");
			Doc_PrintLine(nDocID,1,"ФЕРНАНДО");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"        МАЛАК");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"БРОМОР");
		};
		if(Kapitel >= 4)
		{
			Doc_PrintLine(nDocID,1,"    ЭНГРОМ");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"        РЭНДОЛЬФ");
			Doc_PrintLine(nDocID,1,"");
		};
		if(Kapitel >= 5)
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"СЕКОБ");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"            БРУТУС");
			Doc_PrintLine(nDocID,1,"");
		};
		if((Kapitel == 6) && (Mario_IsOnBoard == LOG_SUCCESS) && (OrkSturmDI == TRUE))
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"МАРИО");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = "Магическое письмо Пирокара";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = name;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Одержимые");
	Doc_SetFont(nDocID,0,FONT_Book);
	if(Kapitel >= 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ФЕРНАНДО");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ВИНО");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"МАЛАК");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"БРОМОР");
	};
	if(Kapitel >= 4)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ЭНГРОМ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"РЭНДОЛЬФ");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"СЕКОБ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"БРУТУС");
	};
	if((Kapitel == 6) && (Mario_IsOnBoard == LOG_SUCCESS) && (OrkSturmDI == TRUE))
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"МАРИО");
	};
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItPo_HealHilda.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Лекарство от черной лихорадки";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	if(MIS_HealHilda == LOG_RUNNING)
	{
		MIS_HealHilda = LOG_FAILED;
		B_CheckLog();
	};
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Походный посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 15;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_02.3ds";
	description = name;
	text[0] = "На древке вырезана буква 'М.'";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
//	mainflag = ITEM_MULTI;
	flags = 0;
	value = 300;
	visual = "ItMi_Bag.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[0] = "Этот мешок доверху набит монетами!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold,300);
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = "Жир крысокрота";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Pitch * 3;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = "Письмо Бабо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Дорогой Бабо,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ты, наверняка, задаешься вопросом, как мы смогли написать тебе это письмо. Мы отнесли все наши сбережения мастеру Марласу и попросили его написать эти строчки. Мы желаем тебе всего наилучшего и посылаем тебе рисунок в качестве прощального дара, чтобы ты всегда помнил о нас во время долгих ночей в монастыре.");
	Doc_PrintLines(nDocID,0,"Удачи. Надеемся, тебе понравится этот рисунок.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Фехт и Бонка");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Рисунок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
//	visual = "ItWr_Scroll_01.3DS";
	visual = "ItWr_BabosPinUp_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = name;
	text[0] = "Изображение нагой женщины.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = "Связка бумаг";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Несколько документов,";
	text[1] = "скрученных вместе.";
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	AI_PrintScreen("Получено письмо и рисунок",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};


instance ItKe_IgarazChest_Mis(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Это ключ от сундука,";
	text[1] = "принадлежащего Игарацу.";
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = "Божественная сила звезд";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
};


var int Astronomy_Once;

func void Use_Astronomy()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... но когда сила быка объединяется с началом воина, нужно опасаться грядущих событий.");
	Doc_PrintLines(nDocID,0,"Высвободившаяся сила быка и настойчивость воина могут нарушить древний баланс сил. Космическая граница между измерениями становится слабой - столь слабой, что теневые твари Белиара получают возможность проникнуть в наш мир.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Что может произойти вследствие этого, известно нам из истории войн древних времен, когда связь между мирами была еще сильна. Эти отродья Зла несли смерть и разрушения нашему миру, и благодаря Избранному и Инносу мир был избавлен от этого Зла.");
	Doc_PrintLines(nDocID,1,"Если такая угроза когда-либо возникнет опять, то да поможет нам Иннос, ибо мир не видел Избранного Инноса уже многие сотни лет.");
//	Doc_PrintLine(nDocID,1,"");
//	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
	if(Astronomy_Once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,2);
		Npc_ChangeAttribute(self,ATR_MANA,2);
		Print(Print_ReadAstronomy);
		Astronomy_Once = TRUE;
	};
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItPo_HealObsession.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Лекарство от одержимости";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	if(SC_IsObsessed == TRUE)
	{
		SC_ObsessionTimes += 1;
		B_ClearSCObsession(self);
		Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
//		Wld_PlayEffect("spellFX_LIGHTSTAR_GREEN",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_GolemChest;
	description = name;
	text[0] = "Этот кошелек полон монет.";
	text[1] = "Кажется, внутри позванивает что-то еще.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
};


instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name = "Очень старая карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_NW_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_ShatteredGolem_Mis()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_ShatteredGolem_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = "Письмо Диего Гербрандту";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Гербрандт,");
	Doc_PrintLines(nDocID,0,"Знаешь, тебе стоило убить меня.");
	Doc_PrintLines(nDocID,0,"Я вернулся в город и ищу тебя. И когда я найду тебя, я покрошу тебя как капусту. Ты хорошо меня знаешь, так что не надейся, меня так легко не обвести вокруг пальца.");
	Doc_PrintLines(nDocID,0,"Полагаю, что когда ты засунул меня за Барьер, ты и не думал, что я могу вернуться. Что ж, ты ошибался.");
	Doc_PrintLines(nDocID,0,"Я пришел за тем, что принадлежит мне по праву.");
	Doc_PrintLines(nDocID,0,"Твой единственный шанс остаться в живых - это уносить ноги поскорее и оставить свой бизнес мне. Тогда мы будем квиты.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Диего");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = DiegosTreasure;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosTreasure;
	description = "Старый кошелек Диего";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	B_PlayerFindItem(ItMi_Gold,DiegosTreasure);
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = "Святая вода Ультара";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_UltharsHolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


var int ItWr_MinenAnteil_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = "Акция рудника Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scroll_01.3DS";
//	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Акция рудника");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Согласно королевскому свидетельству о собственности, предъявителю этого документа дается право на проведение горных работ в королевских землях.");
	Doc_PrintLines(nDocID,0,"Вышеуказанные горные работы должны быть ограничены пространством в один римлот.");
	Doc_PrintLines(nDocID,0,"Согласно закону о горнодобывающих работах, римлот составляет 16 шагов в горизонтальном измерении и 3 шага по вертикали.");
	Doc_PrintLines(nDocID,0,"Королевский проспектор имеет право на свободный доступ к местам производства работ.");
	Doc_PrintLines(nDocID,0,"Если арендатор не в состоянии платить ренту, все права на землю возвращаются к королевству.");
	Doc_PrintLine(nDocID,0,"                                Подпись:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"      Королевский проспектор,");
	Doc_PrintLine(nDocID,0,"                Саландрил");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile,"Парня, продавшего акции шахты торговцам, зовут Саландрил. Вероятно, я смогу найти его в верхней части Хориниса, если он еще не начал прятаться от правосудия.");
		if(Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile,"Саландрил мертв. Мне нужно сообщить это Серпентесу.");
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = "Амулет вызова душ";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
//	visual = "ItAm_Hp_Mana_01.3ds";
	visual = "ItAm_Prot_BlackEye_Mis.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[2] = "Защита от сглаза.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
//	on_equip = Equip_Prot_BlackEye;
//	on_unequip = UnEquip_Prot_BlackEye;
};

/*func void Equip_Prot_BlackEye()
{
	if(Npc_IsPlayer(self))
	{
		SC_IsBlackEyeProtected = TRUE;
	};
};

func void UnEquip_Prot_BlackEye()
{
	if(Npc_IsPlayer(self))
	{
		SC_IsBlackEyeProtected = FALSE;
	};
};*/

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
//	visual = "ItMi_Rockcrystal.3ds";
	visual = "ItMi_KarrasBlessedStone.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = "Камень из благословенной земли";
	inv_zbias = 190;
};

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name = "Поручение судьи";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = name;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Моргахард, ты, никчемный сукин сын. Выполни мой приказ, или мне придется заняться своими прямыми обязанностями и арестовать вас всех.");
	Doc_PrintLines(nDocID,0,"Все должно быть сделано завтра ночью. Лариус становится подозрительным.");
	Doc_PrintLines(nDocID,0,"Если мы не вытянем деньги из его карманов сейчас, может стать слишком поздно. Я устрою так, что ты встретишь его сегодня вечером на рыночной площади.");
	Doc_PrintLines(nDocID,0,"Но не привлекай к себе внимания, или ополченцы скрутят тебя, и глазом моргнуть не успеешь.");
	Doc_PrintLines(nDocID,0,"Кстати: если он ненароком скончается при этом, я не огорчусь.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"          Главный судья и");
	Doc_PrintLine(nDocID,0,"          королевский секретарь");
//	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
	if(SCKnowsRichterKomproBrief == FALSE)
	{
		B_LogEntry(TOPIC_RichterLakai,"Интересно, поверит ли Лариус в то, что его ограбили по приказу судьи?");
		SCKnowsRichterKomproBrief = TRUE;
	};
};


instance ItWr_MorgahardTip(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
	text[0] = "Это письмо было у сбежавшего заключенного.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я ухожу. Надеюсь, мы встретимся опять, когда все немного успокоится.");
	Doc_PrintLines(nDocID,0,"Не волнуйтесь, парни. В крайнем случае, я попрошу Онара помочь.");
	Doc_PrintLines(nDocID,0,"Все будет хорошо.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                     М.");
//	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Map_Shrine_MIS(C_Item)
{
	name = "Карта священных алтарей";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_Shrine_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = "Дух вина";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_VinosKellergeister_Mis;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLines(nDocID,0,"Сила винограда");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
//	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... Я уже многое перепробовал, но этот плод, что был привезен мне из-за границы на прошлой неделе, превзошел все ожидания ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... сок этого винограда несравним с тем, что можно найти в этой части страны ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... пока все хорошо. Но мне все же не по себе от мысли, что может произойти, если меня застанут за моими секретными экспериментами. Не представляю, что будет делать ополчение, если они найдут меня здесь. Они могут даже засунуть меня за Барьер ...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... Они стали подозрительными. Мне лучше оставить это занятие, пока все не успокоится немного, я вернусь к своей работе, когда буду уверен, что никто мной больше не интересуется ...");
	Doc_Show(nDocID);
};


