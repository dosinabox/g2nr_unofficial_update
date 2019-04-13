
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = "Письмо Ксардаса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я полагал, что один из драконов в Долине рудников являлся источником Зла.");
	Doc_PrintLines(nDocID,0,"Я ошибался.");
	Doc_PrintLines(nDocID,0,"Если все прошло так, как я предполагаю,");
	Doc_PrintLines(nDocID,0,"ты сейчас должен искать Чертоги Ирдората.");
	Doc_PrintLines(nDocID,0,"В книге, что ты отдал Пирокару, содержатся все необходимые тебе ключи.");
	Doc_PrintLines(nDocID,0,"Я должен был догадаться, почему");
	Doc_PrintLines(nDocID,0,"Ищущие так хотели заполучить ее.");
	Doc_PrintLines(nDocID,0,"Ты должен вернуть ее себе!");
	Doc_PrintLines(nDocID,0,"Эту книгу открывают слова 'ХАРАК БЕНДАРДО'. Никому не говори об этом!");
	Doc_PrintLines(nDocID,0,"А меня сейчас ждут более важные дела.");
	Doc_PrintLines(nDocID,0,"Я не смогу помочь тебе в твоей последней задаче. Только ты можешь уничтожить источник Зла.");
	Doc_PrintLines(nDocID,0,"Мы еще встретимся!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                             Ксардас.");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"В этом письме Ксардас сообщил мне слова, открывающие книгу ЧЕРТОГИ ИРДОРАТА.");
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "из книги 'Чертоги Ирдората'";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = "Чертоги Ирдората";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Я смог открыть книгу Ксардаса. В ней находилось секретное сообщение и странный ключ. Кто знает, что еще смогу найти я в монастырских подвалах.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
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
	on_state[0] = Use_HallsofIrdorath_Open;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;
	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Я прочел книгу Ксардаса. В ней упоминается секретная библиотека. Она должна быть где-то здесь, в подвалах монастыря.");
	};
	ItWr_SCReadsHallsofIrdorath = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... и я закрыл вход в библиотеку секретной дверью, чтобы защитить мои записи о храмах Белиара.");
	Doc_PrintLines(nDocID,0,"Если бы мои братья знали бы об этих записях, эти идиоты, вероятно, уничтожили бы их.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"А теперь, они знают только, что эти храмы когда-то существовали.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"На всякий случай, я заклял нескольких слуг охранять эту библиотеку.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Этот ключ открывает последнюю дверь.");
	Doc_Show(nDocID);
};


instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = "Пыльная книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
};


func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... Теперь я почти уверен, что здание, о котором идет речь -- Чертоги Ирдората. Они находятся на острове, недалеко от гавани Хориниса. Интерес Белиара к этим шахтам вполне очевиден ...");
	Doc_PrintLines(nDocID,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"... Чем они сильнее, тем, похоже, для него выше их ценность как слуг-нежити. Эти обращенные паладины очень сильны, и с ними очень тяжело справиться. Один из них попал в мои руки. Мне остается только надеяться, что другие не почувствуют его присутствие здесь ...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... Обращенный паладин, похоже, ни на что не реагирует. Я запер его доспехи и остальные его вещи в задней комнате. Дверь в нее можно открыть только изнутри. Я создал руну телепортации, позволяющую переместиться туда. Инструкции по пользованию ей находятся в альманахе, где Избранный сможет найти их ...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"... В значении этих знамений невозможно ошибиться! Когда Избранный придет, ему понадобится вся помощь, которую мы сможем предоставить. Белиар уже очень силен. Мне удалось раздобыть несколько ценных артефактов, которые я схороню здесь, на всякий случай. Я полагаю, что избранный будет выходцем из наших рядов,");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"поэтому я записал в этом альманахе инструкции для него.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... Теперь я уверен. Мы не можем противиться судьбе. Как только Белиар почувствует, что достаточно силен, он поднимется и попытается взять бразды правления миром в свои руки. Я должен найти Избранного, иначе нам всем конец.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"... И будет война, война за судьбу мира. Похоже, только я один могу интерпретировать эти знамения. Все вокруг меня, похоже, игнорируют их. Избранный придет, и его пришествие возвестит о начале войны. Эта война стара как сам мир, но ее конец, похоже, уже близок.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"Я же не буду сидеть, сложа руки и наблюдать за тем, как другие берут судьбу мира в свои руки.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... Я изучал античные письмена и нашел в них, как создать легендарное оружие древних Повелителей Драконов. Однако, я понятия не имею, как раздобыть необходимые ингредиенты. Я записал рецепт в альманахе, так, на всякий случай. Кто знает, какие ужасы принесет с собой будущее - может быть, даже драконов.");
	};
	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = "Помятая записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = name;
	text[0] = "из книги 'Чертоги Ирдората'";
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"               Лампа несет свет ");
	Doc_PrintLine(nDocID,0,"               нижним уровням");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = "Морская карта острова Ирдорат";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"Похоже, я должен добраться до этого странного вражеского острова. Но для этого мне нужен корабль, команда и капитан.");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = "Корабельное свидетельство";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = name;
	text[3] = "Письмо о подтверждении полномочий";
	text[4] = "на распоряжение кораблем паладинов.";
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Предоставление полномочий");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"        Этот документ наделяет предъявителя");
	Doc_PrintLine(nDocID,0,"        правом свободно распоряжаться");
	Doc_PrintLine(nDocID,0,"        королевской военной галерой Лорда Хагена");
	Doc_PrintLine(nDocID,0,"        в течение неограниченного периода времени.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            Королевская печать");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name = "Ключ от башни главных ворот";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = "Ключ от капитанской каюты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Слезы Инноса";
	text[1] = "???";
	count[1] = Mana_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_PotionOfDeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
		PrintScreen(PRINT_LearnSTR5,-1,45,FONT_Screen,2);
		PrintScreen(PRINT_LearnDEX5,-1,55,FONT_Screen,2);
		PrintScreen(PRINT_FullyHealed,-1,65,FONT_Screen,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Слезы Инноса";
	text[1] = "Это зелье наделяет магов Огня особыми способностями.";
	text[2] = "Любой другой принявший его, найдет свою смерть.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = "Божественная аура Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Божественная аура Инноса.";
	text[2] = "Этот амулет защищает владельца";
	text[3] = "от всех форм урона.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Лекарство от привыкания";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};

