
instance DIA_AngarDJG_EXIT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 999;
	condition = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AngarDJG_HALLO(C_Info)
{
	npc = DJG_705_Angar;
	nr = 5;
	condition = DIA_AngarDJG_HALLO_Condition;
	information = DIA_AngarDJG_HALLO_Info;
	description = "Я знаю тебя. Ты Кор Ангар. Ты был храмовником в болотном лагере.";
};


func int DIA_AngarDJG_HALLO_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Я знаю тебя. Ты Кор Ангар. Ты был храмовником в болотном лагере.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//(смиренно) Зови меня просто Ангаром. Я потерял свой титул. Братства Спящего больше нет.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Забавно, но мне кажется, что я тебя тоже знаю. Но я точно не помню откуда.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Что с тобой?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//Ох. Я уже давно не мог нормально спать. Эти постоянные кошмары...
	B_LogEntry(TOPIC_Dragonhunter,"Я нашел Ангара в Долине Рудников.");
};

func void B_SCTellsAngarAboutMadPsi()
{
	if(Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Братство Спящего было порабощено Злом.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Твои бывшие друзья из болотного лагеря наводнили землю, одевшись в черные рясы, и атакуют все, что движется.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//О чем ты говоришь?
	};
};

func void B_SCTellsAngarAboutMadPsi2()
{
	if(Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Теперь они служат врагу и стали бездушными воинами Зла.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//Боги всевышние! И почему я был так слеп! Со мной никогда больше такого не повторится, клянусь.
		B_GivePlayerXP(XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};


instance DIA_Angar_WIEKOMMSTDUHIERHER(C_Info)
{
	npc = DJG_705_Angar;
	nr = 6;
	condition = DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information = DIA_Angar_WIEKOMMSTDUHIERHER_Info;
	description = "Как ты оказался здесь?";
};


func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Как ты оказался здесь?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//После обрушения магического барьера я спрятался в горах. Затем пришло время что-то делать.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//Я бесцельно брел четыре дня, пока неожиданно не очнулся в замке. Не спрашивай меня, что произошло, я не знаю.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//И что еще хуже, я также потерял амулет, который был со мной многие годы. Я сойду с ума, если не найду его.
	Log_CreateTopic(TOPIC_AngarsAmulett,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett,LOG_Running);
	B_LogEntry(TOPIC_AngarsAmulett,"Ангар потерял свой амулет и теперь в отчаянии пытается найти его.");
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,Dialog_Back,DIA_Angar_WIEKOMMSTDUHIERHER_gehen);
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"А где именно ты потерял свой амулет?",DIA_Angar_WIEKOMMSTDUHIERHER_amulett);
	if(SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"Братство Спящего было порабощено Злом.",DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	}
	else
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"А что произошло с другими из болотного лагеря?",DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	};
	if(DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"А что ты будешь делать дальше?",DIA_Angar_WIEKOMMSTDUHIERHER_nun);
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//А где именно ты потерял свой амулет?
	if(DJG_Angar_SentToStones == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Где-то на юге, вскоре после того, как я очнулся в замке.
		B_LogEntry(TOPIC_AngarsAmulett,"Этот амулет должен быть где-то на юге. Ангар собирается отправиться на его поиски.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//Он должен быть где-то там.
		B_LogEntry(TOPIC_AngarsAmulett,"Амулет находится около склепа на юге Долины Рудников.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Я подозреваю, что он был украден. Мне крайне необходимо вернуть его себе.
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere()
{
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//А что произошло с другими из болотного лагеря?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Последнее, что я помню - это обрушение Барьера, сопровождавшееся душераздирающим воплем.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//Нас охватил панический страх. Мы упали на землю, корчась от боли. Этот голос, он... становился все громче.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//И затем вдруг все кончилось, все побежали как безумные и исчезли в ночи, вопя истошными голосами.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//И больше я их не видел.
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//А что ты будешь делать дальше?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Я сначала немного отдохну, а затем продолжу поиски моего амулета.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//Я слышал что-то о драконах.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Также говорят, что в Долину Рудников пришло много воинов - охотиться на них.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Я думаю присоединиться к ним.
	Angar_willDJGwerden = TRUE;
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen()
{
	Info_ClearChoices(DIA_Angar_WIEKOMMSTDUHIERHER);
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_Info;
	description = "Братство Спящего было порабощено Злом.";
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition()
{
	if((SC_KnowsMadPsi == TRUE) && (Angar_KnowsMadPsi == FALSE) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};


instance DIA_Angar_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_FOUNDAMULETT_Condition;
	information = DIA_Angar_FOUNDAMULETT_Info;
	description = "Я нашел твой амулет.";
};


func int DIA_Angar_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER))
	{
		return TRUE;
	};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Я нашел твой амулет.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Спасибо. Я уж думал, что больше никогда не увижу его.
	B_GiveInvItems(other,self,ItAm_Mana_Angar_MIS,1);
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP(XP_AngarDJGUndeadMage);
};

func void DIA_Angar_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
	Info_AddChoice(DIA_Angar_FOUNDAMULETT,"А чем он такой особенный?",DIA_Angar_FOUNDAMULETT_besonders);
	Info_AddChoice(DIA_Angar_FOUNDAMULETT,"Что ты планируешь делать теперь?",DIA_Angar_FOUNDAMULETT_nun);
};

func void DIA_Angar_FOUNDAMULETT_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//А чем он такой особенный?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Это подарок.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Понимаю.
};

func void DIA_Angar_FOUNDAMULETT_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Что ты планируешь делать теперь?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Выбираться из этой проклятой долины.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Может быть, мы еще встретимся. Прощай.
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
	{
		Npc_ExchangeRoutine(self,"LeavingOW");
	};
};


instance DIA_Angar_DJG_ANWERBEN(C_Info)
{
	npc = DJG_705_Angar;
	nr = 8;
	condition = DIA_Angar_DJG_ANWERBEN_Condition;
	information = DIA_Angar_DJG_ANWERBEN_Info;
	description = "Может быть, я смогу помочь тебе найти амулет?";
};


func int DIA_Angar_DJG_ANWERBEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DJG_ANWERBEN_Info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Может быть, я смогу помочь тебе найти амулет?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Почему бы и нет. Помощь никогда не помешает.
	if(DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,Dialog_Ende_v2,DIA_Angar_DJG_ANWERBEN_gehen);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Где ты собираешься искать?",DIA_Angar_DJG_ANWERBEN_wo);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Когда ты отправляешься в путь?",DIA_Angar_DJG_ANWERBEN_wann);
	};
	if(Angar_willDJGwerden == TRUE)
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Что насчет охотников на драконов?",DIA_Angar_DJG_ANWERBEN_DJG);
	};
};

func void DIA_Angar_DJG_ANWERBEN_DJG()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//Что насчет охотников на драконов?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Я поговорю с ними позже. Может, им пригодится хороший воин.
};

func void DIA_Angar_DJG_ANWERBEN_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Когда ты отправляешься в путь?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Чем быстрее, тем лучше.
};

func void DIA_Angar_DJG_ANWERBEN_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//Где ты собираешься искать?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//Я пойду на юг, туда, где я его потерял.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Там есть склеп в пещере, окруженной кучей валунов.
};

func void DIA_Angar_DJG_ANWERBEN_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//Мне нужно идти.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Будь осторожен!
	AI_StopProcessInfos(self);
};


instance DIA_AngarDJG_WASMACHSTDU(C_Info)
{
	npc = DJG_705_Angar;
	nr = 9;
	condition = DIA_AngarDJG_WASMACHSTDU_Condition;
	information = DIA_AngarDJG_WASMACHSTDU_Info;
	description = "Что-то не так?";
};


func int DIA_AngarDJG_WASMACHSTDU_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,DIA_Angar_DJG_ANWERBEN) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Что-то не так?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//Ты слышишь это? В жизни никогда не слышал такого ужасного шума!
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Что ты имеешь в виду? Я ничего не слышу!
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Все здесь пропитано смертью и разрушениями. Грязные твари охраняют вход в склеп перед нами.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//Там затаилась какая-то мерзость, она посылает своих прихвостней на поверхность этого мира.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Я почти уверен, что мой амулет был потерян где-то здесь.
	if(Angar_willDJGwerden == TRUE)
	{
		Info_AddChoice(DIA_AngarDJG_WASMACHSTDU,"Ты говорил с охотниками на драконов?",DIA_AngarDJG_WASMACHSTDU_DJG);
	};
};

func void DIA_AngarDJG_WASMACHSTDU_DJG()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Ты говорил с охотниками на драконов?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Да. Но я ожидал, что это будет братство, подобное тому, что было у нас в болотном лагере.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//А эти парни - просто дикая пестрая толпа идиотов. Мне нечего с ними делать.
};


instance DIA_AngarDJG_WHATSINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 10;
	condition = DIA_AngarDJG_WHATSINTHERE_Condition;
	information = DIA_AngarDJG_WHATSINTHERE_Info;
	description = "Что скрывается в этой пещере в скалах?";
};


func int DIA_AngarDJG_WHATSINTHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_WASMACHSTDU) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WHATSINTHERE_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Что скрывается в этой пещере в скалах?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Что-то, что не позволяет мне приблизиться к входу!
	if(!Npc_IsDead(Shadowbeast_Skeleton_Angar) || !Npc_IsDead(SkeletonMage_Angar))
	{
		AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//Его охраняет магическое существо. Я видел его ночью, он тут рыскал. Отвратительное создание.
		AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Он шнырял между деревьями, и у меня было впечатление, что он высасывает всю жизнь вокруг и впитывает ее, как губка.
	};
	B_LogEntry(TOPIC_Dragonhunter,"Я нашел Ангара в Долине Рудников.");
};


instance DIA_AngarDJG_WANTTOGOINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 11;
	condition = DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information = DIA_AngarDJG_WANTTOGOINTHERE_Info;
	description = "Пойдем вместе.";
};


func int DIA_AngarDJG_WANTTOGOINTHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_WHATSINTHERE) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Пойдем вместе.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Я попробую. Но нужно быть осторожными.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_AngarAngriff = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_AngarDJG_UndeadMageDead(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UndeadMageDead_Condition;
	information = DIA_AngarDJG_UndeadMageDead_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UndeadMageDead_Condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_AngarAngriff == TRUE) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UndeadMageDead_Info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//(тяжело дышит) Здесь только смерть и разрушение. Я должен уходить отсюда.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_AngarDJG_UNDEADMAGECOMES(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information = DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UNDEADMAGECOMES_Condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,DIA_AngarDJG_WANTTOGOINTHERE) && !Npc_KnowsInfo(other,DIA_AngarDJG_UndeadMageDead) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//(шепчет) Вот, опять! Ты слышишь это?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_Angar_WASISTLOS(C_Info)
{
	npc = DJG_705_Angar;
	nr = 14;
	condition = DIA_Angar_WASISTLOS_Condition;
	information = DIA_Angar_WASISTLOS_Info;
	description = "В чем дело?";
};


func int DIA_Angar_WASISTLOS_Condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_Angar_WASISTLOS_Info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//В чем дело?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//Я не могу идти дальше с тобой.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Что-то подсказывает мне, что мне не выбраться отсюда живым.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Я не могу объяснить это, но...
	AI_PlayAni(self,"T_SEARCH");
//	if(SC_KnowsMadPsi == TRUE)
	if(Angar_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//Я должен уходить из этой проклятой земли как можно быстрее, иначе меня ждет та же судьба, что и моих братьев.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Каждый раз, когда я вижу одного из этих... отродий ада, у меня появляется чувство, что я сражаюсь против своих.
	};
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Dragonhunter,"Ангар только что ушел. Из-за всей этой нежити у него появилось чувство, что он сражается против своих же людей.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_Angar_WHYAREYOUHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 15;
	condition = DIA_Angar_WHYAREYOUHERE_Condition;
	information = DIA_Angar_WHYAREYOUHERE_Info;
	description = "Ангар? Что ты делаешь здесь?";
};


func int DIA_Angar_WHYAREYOUHERE_Condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 3000)
	{
		return TRUE;
	};
};

func void DIA_Angar_WHYAREYOUHERE_Info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Ангар? Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//Я шел к Проходу, когда неожиданно наткнулся на орков. Я не смог оторваться от них.
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Я подожду немного, а затем пойду через Проход. Увидимся на другой стороне!
	B_LogEntry(TOPIC_Dragonhunter,"Я встретил Ангара опять, он застрял в Долине Рудников.");
	B_GivePlayerXP(XP_AngarDJGAgain);
	AI_StopProcessInfos(self);
};


instance DIA_Angar_PERMKAP4(C_Info)
{
	npc = DJG_705_Angar;
	condition = DIA_Angar_PERMKAP4_Condition;
	information = DIA_Angar_PERMKAP4_Info;
	permanent = TRUE;
	description = "Ты действительно справишься один?";
};


func int DIA_Angar_PERMKAP4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Angar_WHYAREYOUHERE))
	{
		return TRUE;
	};
};

func void DIA_Angar_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//Ты действительно справишься один?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Конечно. Ты можешь идти. Еще увидимся.
	AI_StopProcessInfos(self);
};


instance DIA_Angar_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar;
	nr = 900;
	condition = DIA_Angar_PICKPOCKET_Condition;
	information = DIA_Angar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Angar_PICKPOCKET_Condition()
{
	return C_Beklauen(47,55);
};

func void DIA_Angar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
	Info_AddChoice(DIA_Angar_PICKPOCKET,Dialog_Back,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

