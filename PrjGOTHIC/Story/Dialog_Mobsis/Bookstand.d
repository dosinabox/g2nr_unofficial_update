
func void Use_Bookstand_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest,"Будучи послушником, я имею право требовать прохождения Испытания Огнем. Каждый из трех магов Высшего Совета должен дать мне задание. Если я пройду эти испытания, я буду принят в Круг Огня.");
		};
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Испытание Огнем");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Хотя послушник может чувствовать себя готовым пройти Испытание Магией, из этого не следует, что он обязательно будет выбран. Если, однако, он принял это решение после зрелого размышления и если он настаивает на своем решении, он наделен правом требовать прохождения этого Испытания, и ни один маг не может отказать ему в этом. Но послушник обязан не только пройти Испытание Магией, но также найти просвещение через огонь. ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Это Испытание должно позволять дать оценку мудрости силе и ловкости послушника. Следовательно, он должен пройти три испытания, каждое из которых дается ему одним из магов Высшего Совета, прежде чем ему будет позволено принять Клятву Огня и присоединиться к Соглашению Огня.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Такова воля Инноса и так тому и быть.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Высший совет");
		Doc_Show(nDocID);
	};
};


var int FinalDragonEquipment_Once;

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"... Я надеюсь, что этот купол защитит руду от коварства Белиара. Король настолько наивен, что верит, что мы строим этот купол для предотвращения побегов. Что ж, пока эта уловка позволяет нам следовать нашей высшей цели, пусть так и будет. Мне остается только надеяться, что у нас остается достаточно времени, чтобы подготовиться к битве. Как только купол вокруг Долины рудников будет воздвигнут, я соберу все силы, имеющиеся в моем распоряжении, чтобы принять участие в грядущей битве.");
		Doc_PrintLines(nDocID,0,"");
		if(hero.guild == GIL_KDF)
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Святая стрела': 1 святая вода, свиток не нужен");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... Я следовал инструкциям и просто окропил святой водой Инноса чистый рунный камень, лежащий на рунном столе. Рунный камень был уничтожен. Я подозреваю, что это заклинание подвластно только Избранному.");
			Doc_PrintLines(nDocID,1,"Я оставил священную ауру Инноса под защитой монастыря. Настоятель монастыря позаботится о ней до тех пор, пока не объявится Избранный.");
			Doc_PrintLines(nDocID,1,"Слезы Инноса, вероятно,  будут играть важную роль в грядущей битве. Но слишком опасно оставлять их у всех на виду. Я лучше спрячу их здесь, в библиотеке.");
			Doc_Show(nDocID);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
			PrintScreen(PRINT_LearnPalTeleportSecret,-1,-1,FONT_Screen,2);
			Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry(TOPIC_TalentRunes,"Для создания руны необходимы специфические ингредиенты. При помощи этих ингредиентов и чистого рунного камня, можно создать руну на рунном столе.");
			B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Секретный телепорт': 1 Слезы Инноса");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Чтобы достичь секретного места,  необходимо создать руну телепортации. Для этого необходим чистый рунный камень и небольшая бутылочка святой воды. При помощи этой руны можно телепортироваться в комнату.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Теперь я вполне уверен, что слезы Инноса - именно то, что паладины древности использовали в давно забытом ритуале 'Освящение Меча'. Это означает, что при помощи этой бутылочки, что я нашел, я смогу придать дополнительную силу освящаемому оружию. ");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
			PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry(TOPIC_TalentSmith,"Чтобы выковать оружие, Чтобы выковать оружие, прежде всего мне нужна сырая сталь. Я должен докрасна нагреть ее в огне кузнечного горна, а затем придать форму на наковальне. Особое оружие зачастую требует особых материалов, придающих оружию особые свойства.");
			B_LogEntry(TOPIC_TalentSmith,"Если я добавлю 4 куска руды и 5 частей драконьей крови, я смогу выковать рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			B_LogEntry(TOPIC_TalentSmith,"Если я добавлю 5 кусков руды и 5 частей драконьей крови, я смогу выковать большой рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			PlayergetsFinalDJGArmor = TRUE;
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Оружие повелителя драконов.");
			Doc_PrintLines(nDocID,1,"Чтобы сделать доспехи из чешуи дракона максимально прочными, чешуйки можно покрыть рудой, добытой в долине на острове Каринис.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Чтобы изготовить меч, достойный  повелителя драконов, этот меч должен быть закален в драконьей крови. 5 пиал крови могут придать стали непревзойденную остроту и прочность.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Примечание: 'Каринис' вероятно соответствует нынешнему названию 'Хоринис'.");
			Doc_Show(nDocID);
		};
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

