
instance DIA_GornDJG_EXIT(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 999;
	condition = DIA_GornDJG_EXIT_Condition;
	information = DIA_GornDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_STARTCAMP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_STARTCAMP_Condition;
	information = DIA_GornDJG_STARTCAMP_Info;
	description = "Я вижу, ты присоединился к охотникам на драконов.";
};


func int DIA_GornDJG_STARTCAMP_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_STARTCAMP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Я вижу, ты присоединился к охотникам на драконов.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//Я пошел за Сильвио в Долину Рудников, потому что я знаю эту местность как свои пять пальцев, и я хотел сам понять, что здесь происходит.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Я скажу тебе вот что. Здесь определенно что-то не так. В жизни никогда не видел столько орков в одном месте.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Я не удивлюсь, если Гаронд и паладины из замка давно сбежали или уже все перебиты.
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"Еще увидимся.",DIA_GornDJG_STARTCAMP_By);
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"Что ты планируешь делать дальше?",DIA_GornDJG_STARTCAMP_Wohin);
};

func void DIA_GornDJG_STARTCAMP_Wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Я сначала пойду с парнями в Долину Рудников, а потом свалю.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Мне просто очень хочется выяснить, что планируют орки.
};

func void DIA_GornDJG_STARTCAMP_By()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Еще увидимся.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Будь осторожен.
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_HALLO(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HALLO_Condition;
	information = DIA_GornDJG_HALLO_Info;
	description = "Так вот ты куда забился!";
};


func int DIA_GornDJG_HALLO_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//Так вот ты куда забился!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Ты тоже не особенно похож на самоубийцу.
};


instance DIA_GornDJG_WHATSUP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATSUP_Condition;
	information = DIA_GornDJG_WHATSUP_Info;
	description = "Что-нибудь выяснил?";
};


func int DIA_GornDJG_WHATSUP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATSUP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Что-нибудь выяснил?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Я все еще выжидаю. Мне кажется, там, наверху, в этих руинах на скале, может что-то быть. Ночью там виден свет и доносятся крики.
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"Может, это Лестер, который вернулся в свои старые руины на скале?",DIA_GornDJG_WHATSUP_Lester);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"Дракон?",DIA_GornDJG_WHATSUP_A_Dragon);
	B_LogEntry(TOPIC_Dragonhunter,"Горн находится у подножья плоскогорья, ведущего к старой крепости в скалах. Отсюда он может наблюдать за плоскогорьем и барьером орков.");
};

func void DIA_GornDJG_WHATSUP_Lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Может, это Лестер, который вернулся в свои старые руины на скале?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//Может. Но, насколько я знаю, Лестер больше не живет там.
};

func void DIA_GornDJG_WHATSUP_A_Dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Дракон?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Весьма вероятно. Плоскогорье, находящееся там, охраняется лучше, чем королевская сокровищница. Ох, а это единственный путь в крепость.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Как будто одного дракона недостаточно. Но, похоже, они окружают себя свитой из монстров.
	GornDJG_WhatMonsters = TRUE;
	B_LogEntry(TOPIC_Dragonhunter,"Согласно информации, полученной от Горна, в старой крепости в скалах находится дракон.");
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
};


instance DIA_GornDJG_WHATMONSTERS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATMONSTERS_Condition;
	information = DIA_GornDJG_WHATMONSTERS_Info;
	description = "А что это за монстры?";
};


func int DIA_GornDJG_WHATMONSTERS_Condition()
{
	if(GornDJG_WhatMonsters == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATMONSTERS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//А что это за монстры?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Я не смог хорошо разглядеть их, но они ходят на двух ногах и у них чешуйчатая кожа. Они обшаривают скалы как снепперы, унюхавшие добычу.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//Я хорошо слышу здесь внизу, как они сопят и фыркают там. Мне кажется, они заняли все плоскогорье там.
};


instance DIA_GornDJG_WAHTABOUTORCS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WAHTABOUTORCS_Condition;
	information = DIA_GornDJG_WAHTABOUTORCS_Info;
	description = "Что насчет орков?";
};


func int DIA_GornDJG_WAHTABOUTORCS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//Что насчет орков?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Я понаблюдал за ними немного. Баррикада, которую они выстроили там, наверняка что-то скрывает. Я подозреваю, что за ней могут оказаться просто полчища орков.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//Ты хочешь сказать, даже БОЛЬШЕ, чем их есть сейчас?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Я не удивлюсь, если однажды вечером они разберут свой частокол и запрудят всю долину. Не нравится мне это все.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Если это случится, мне нужно будет вернуться и предупредить Ли. Он все равно хочет убраться с этого острова. А тогда мешкать уже будет нельзя.
};


instance DIA_GornDJG_HELPKILLDRACONIANS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information = DIA_GornDJG_HELPKILLDRACONIANS_Info;
	description = "Ты поможешь мне пробиться в эту крепость?";
};


func int DIA_GornDJG_HELPKILLDRACONIANS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATMONSTERS) && Npc_KnowsInfo(other,DIA_GornDJG_WAHTABOUTORCS) && (Npc_IsDead(RockDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Ты поможешь мне пробиться в эту крепость?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//Я даже не знаю. Боюсь, орки как назло начнут атаку, как только я отвернусь.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//Это паранойя!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Ничем не могу помочь. Я никогда не прощу себе, если опоздаю, понимаешь? Но с другой стороны...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//Ладно! Зачем я вообще тогда здесь? Пошли на это плоскогорье и пробьем себе дорогу к крепости.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Небольшая разминка не помешает. Кроме того, я хочу разглядеть поближе монстров, что бродят там.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Дай мне знать, когда будешь готов!
	B_LogEntry(TOPIC_Dragonhunter,"Горн хочет помочь мне добраться через плоскогорье до крепости в скалах.");
};


instance DIA_GornDJG_LOSGEHTS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_LOSGEHTS_Condition;
	information = DIA_GornDJG_LOSGEHTS_Info;
	description = "Пошли в атаку!";
};


func int DIA_GornDJG_LOSGEHTS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HELPKILLDRACONIANS))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_LOSGEHTS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Пошли в атаку!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Как в старые времена, да? Но я хочу, чтоб ты знал: это мой бой. На этот раз я пойду первым!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GornDJG_BISHIERHIN(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_BISHIERHIN_Condition;
	information = DIA_GornDJG_BISHIERHIN_Info;
	important = TRUE;
};


func int DIA_GornDJG_BISHIERHIN_Condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_BISHIERHIN_Info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Это было детской забавой. Ну а теперь, дружище, с остальными ты справишься сам. Задай им жару! А я пойду назад и буду наблюдать за орками.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//Нет проблем. Еще увидимся!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//Я тоже надеюсь на это!
	B_LogEntry(TOPIC_Dragonhunter,"Горн вернулся на свой сторожевой пост. Он будет продолжать наблюдать за орками.");
	B_GivePlayerXP(XP_GornDJGPlateauClear);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornDJG_DRAGONDEAD(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_DRAGONDEAD_Condition;
	information = DIA_GornDJG_DRAGONDEAD_Info;
	description = "Каменный дракон мертв!";
};


func int DIA_GornDJG_DRAGONDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATSUP) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && Npc_IsDead(RockDragon))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_DRAGONDEAD_Info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Каменный дракон мертв!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Я больше не слышу воплей! Ты был в этой крепости в скалах?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Да!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ха-ха! Я так и думал. Где бы ты ни появился, там камня на камне не остается.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Что ты собираешься делать дальше?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Я побуду здесь еще немного, а затем вернусь к Ли. Может, мы там еще встретимся!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Меня уже тошнит от этих мест. Пришло время убираться с этого острова.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Еще увидимся!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Fighter_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 900;
	condition = DIA_Fighter_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,35);
};

func void DIA_Fighter_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

