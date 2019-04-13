
const int AM_EyeProtEdge = 10;
const int AM_EyeProtPoint = 10;
const int AM_EyeProtMage = 20;
const int AM_EyeProtFire = 30;

instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[0] = "Глаз пульсирует энергией.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
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
	PrintScreen("",-1,-1,FONT_Screen,0);
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_EDGE] -= AM_EyeProtEdge;
	self.protection[PROT_BLUNT] -= AM_EyeProtEdge;
	self.protection[PROT_POINT] -= AM_EyeProtPoint;
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
	self.protection[PROT_MAGIC] -= AM_EyeProtMage;
};


instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
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
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
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
	name = "Письмо о подтверждение полномочий";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = "Письмо о подтверждение полномочий для Пирокара.";
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
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
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
	name = "Ключ Ксардаса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "от сундука на ферма Секоба.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дневник";
	text[0] = "Дневник Корнелиуса.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;
	Cornelius_IsLiar = TRUE;
	B_LogEntry(TOPIC_RescueBennet,"Этот дневник - доказательство, необходимое для подтверждения невиновности Беннета.");
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если Лариус будет продолжать в том же духе, мне придется начать подыскивать себе другое место.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Что-то странно произошло со мной прошлой ночью. Мне нанес визит один из этих парней в черных капюшонах, о которых ходит столько слухов последнее время. Я не очень-то испугался, даже несмотря на то, что, как говорят,  они - само зло. Эти люди прямо-таки источают силу. Но голос был спокойным и располагающим к себе.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Он предложил мне 20,000 золота за то, чтобы один из наемников был осужден. Он сказал, что я пойму, что он имел в виду, когда это произойдет.");
	Doc_PrintLines(nDocID,1,"Конечно же, я согласился. Эти наемники все равно не заслуживают лучшей участи. Если бы не они, у меня все было бы хорошо. И это золото позволит мне спокойно встретить старость.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Это произошло -- один из наемников был арестован. Сдержать мое слово будет просто.");
	Doc_Show(nDocID);
	PrintScreen("",-1,-1,FONT_Screen,0);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = "Альманах одержимых";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
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
		Doc_PrintLine(nDocID,0,"in Sparady bell ");
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
			Doc_PrintLine(nDocID,1,"        РЕНДОЛЬФ");
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
		Doc_PrintLine(nDocID,0,"РЕНДОЛЬФ");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"СЕКОБ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"БРУТУС");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Лекарство от черной лихорадки";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "На ручке выгравирована";
	text[1] = "буква 'М'.";
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
	name = "Кошелек полный золота!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
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
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
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
	description = "Письмо Бабо.";
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
	Doc_PrintLines(nDocID,0,"Ты, наверняка, задаешься вопросом, как мы смогли написать тебе это письмо. Мы отнесли все наши сбережения мастеру Марласу и попросили его написать эти строчки. Мы желаем тебе всего наилучшего и посылаем тебе картину в качестве прощального дара, чтобы ты всегда помнил о нас во время долгих ночей в монастыре.");
	Doc_PrintLines(nDocID,0,"Удачи. Надеемся, тебе понравится эта картина.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Фехт и Бонка");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Изображение женщины";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = "Изображение нагой женщины.";
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
	text[2] = "Несколько документов,";
	text[3] = "скрученных вместе.";
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};


instance ItKe_IgarazChest_Mis(C_Item)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от сундука,";
	text[3] = "принадлежащего Игарацу.";
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


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;
	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,2);
		Print(Print_ReadAstronomy);
		Astronomy_once = TRUE;
	};
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
	Doc_PrintLines(nDocID,1,"Что может произойти вследствие этого, известно нам из истории войн древних времен, когда связь между мирами была еще сильна. Эти отродья зла несли смерть и разрушения нашему миру, и благодаря Избранному и Инносу мир был избавлен от этого зла.");
	Doc_PrintLines(nDocID,1,"Если такая угроза когда-либо возникнет опять, то да поможет нам Иннос, ибо мир не видел Избранного Инноса уже многие сотни лет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Лекарство от одержимости";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	B_ClearSCObsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = "Кожаный мешочек.";
	text[0] = "";
	text[1] = "";
	text[2] = "Этот кошелек полон монет.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name = "Очень старая карта.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
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
	name = "Письмо от Диего";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "Письмо Диего Гербрандту.";
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Гербрандт, ");
	Doc_PrintLines(nDocID,0,"Знаешь, тебе стоило убить меня.");
	Doc_PrintLines(nDocID,0,"Я вернулся в город и ищу тебя. И когда я найду тебя, я покрошу тебя как капусту. Ты хорошо меня знаешь, так что не надейся, меня так легко не обвести вокруг пальца.");
	Doc_PrintLines(nDocID,0,"Полагаю, что когда ты засунул меня за Барьер, ты и не думал, что я могу вернуться. Что ж, ты ошибался.");
	Doc_PrintLines(nDocID,0,"Я пришел за тем, что принадлежит мне по праву.");
	Doc_PrintLines(nDocID,0,"Твой единственный шанс остаться в живых - это уносить ноги поскорее и оставить свой бизнес мне. Тогда мы будим квиты.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Диего");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = "Полный кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = "Старый кожаный кошелек Диего.";
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
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
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
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
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
	Doc_PrintLine(nDocID,0,"         Подпись");
	Doc_PrintLine(nDocID,0,"      Королевский проспектор");
	Doc_PrintLine(nDocID,0,"");
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
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[2] = "";
	text[3] = "Защита от сглаза";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Камень из благословенной земли";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
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
	SCKnowsRichterKomproBrief = TRUE;
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
	Doc_PrintLine(nDocID,0,"          Главный судья и ");
	Doc_PrintLine(nDocID,0,"          королевский секретарь");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
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
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я ухожу. Надеюсь, мы встретимся опять, когда все немного успокоится.");
	Doc_PrintLines(nDocID,0,"Не волнуйтесь, парни. В крайнем случае, я попрошу Онара помочь.");
	Doc_PrintLines(nDocID,0,"Все будет хорошо.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                           М.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Map_Shrine_MIS(C_Item)
{
	name = "Карта священных алтарей";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
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
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
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
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сила винограда");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... Я уже многое перепробовал, но этот плод, что был привезен мне из-за границы на прошлой неделе, превзошел все ожидания ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... сок этого винограда несравним с тем, что можно найти в этой части страны ...");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... пока все хорошо. Но мне все же не по себе от мысли, что может произойти, если меня застанут за моими секретными экспериментами. Не представляю, что будет делать ополчение, если они найдут меня здесь. Они могут даже засунуть меня за Барьер ...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... Они стали подозрительными. Мне лучше оставить это занятие, пока все не успокоится немного, я вернусь к своей работе, когда буду уверен, что никто мной больше не интересуется ...");
	Doc_Show(nDocID);
};

