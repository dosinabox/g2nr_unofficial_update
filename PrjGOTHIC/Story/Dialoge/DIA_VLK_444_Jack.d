
instance DIA_Jack_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_PICKPOCKET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 900;
	condition = DIA_Jack_PICKPOCKET_Condition;
	information = DIA_Jack_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Jack_PICKPOCKET_Condition()
{
	return C_Beklauen(50,100);
};

func void DIA_Jack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
	Info_AddChoice(DIA_Jack_PICKPOCKET,Dialog_Back,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};


instance DIA_Jack_GREET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 4;
	condition = DIA_Jack_GREET_Condition;
	information = DIA_Jack_GREET_Info;
	important = TRUE;
};


func int DIA_Jack_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_GREET_Info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Привет, сухопутная крыса, похоже, ты сейчас на мели.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//У тебя жабры какие-то бледные.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Не бери в голову, парень. Все, что тебе нужно - это крепкий морской бриз.
};


instance DIA_Jack_Job(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_Job_Condition;
	information = DIA_Jack_Job_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Jack_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_GREET))
	{
		return TRUE;
	};
};

func void DIA_Jack_Job_Info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Когда я был еще юношей, я отправился странствовать по морям, и пережил много сильных штормов.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Но много лет назад, я осел здесь, и с тех пор работал смотрителем маяка Хориниса.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//В этом нет ничего сложного. Совсем. Но этот старый маяк стал мне родным домом.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Но я так давно уже не был в нем.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Почему?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//С тех пор, как эти подонки захватили мой маяк, я не осмеливаюсь подойти к нему ближе, чем на двадцать футов. Это очень плохие люди.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Они преступники из Долины Рудников, понимаешь?
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//По другую сторону гор раздался оглушительный взрыв, а затем они налетели на эту землю как мухи на дерьмо. Теперь они скрываются здесь повсюду - даже на моем маяке.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//Я думаю, они поджидают корабль, на котором могли бы уплыть.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ха! Пусть плывут куда хотят. Тогда, по крайней мере, они уберутся с моего маяка.
	Log_CreateTopic(TOPIC_KillLighthouseBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits,LOG_Running);
	B_LogEntry(TOPIC_KillLighthouseBandits,"Старый морской волк Джек не может вернуться на свой маяк, так как там засели бандиты.");
	MIS_Jack_KillLighthouseBandits = LOG_Running;
};


instance DIA_Jack_City(C_Info)
{
	npc = VLK_444_Jack;
	nr = 6;
	condition = DIA_Jack_City_Condition;
	information = DIA_Jack_City_Info;
	description = "Ты часто бываешь в городе?";
};


func int DIA_Jack_City_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_Job))
	{
		return TRUE;
	};
};

func void DIA_Jack_City_Info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Ты часто бываешь в городе?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Я всегда говорю: город настолько хорош, насколько хорош его порт.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Порт - это ворота в мир. Здесь все встречаются, и все начинается здесь.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//А когда в порту царит запустение, город неминуемо ждет та же участь.
};


instance DIA_Jack_Harbor(C_Info)
{
	npc = VLK_444_Jack;
	nr = 70;
	condition = DIA_Jack_Harbor_Condition;
	information = DIA_Jack_Harbor_Info;
	permanent = TRUE;
	description = "Расскажи мне об этом порте.";
};


func int DIA_Jack_Harbor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_City) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Harbor_Info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Расскажи мне об этом порте.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Порт Хориниса сейчас не тот, что был раньше.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Здесь никого не осталось, кроме праздношатающегося сброда, корабли сюда больше не заходят, и торговля пришла в упадок. Этому порту, похоже, скоро придет конец.
	Info_ClearChoices(DIA_Jack_Harbor);
	Info_AddChoice(DIA_Jack_Harbor,Dialog_Back,DIA_Jack_Harbor_Back);
	Info_AddChoice(DIA_Jack_Harbor,"Почему корабли больше не приходят сюда?",DIA_Jack_Harbor_Ships);
	Info_AddChoice(DIA_Jack_Harbor,"Что ты имеешь в виду под сбродом?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice(DIA_Jack_Harbor,"Так почему ты не уедешь отсюда?",DIA_Jack_Harbor_Leave);
};

func void DIA_Jack_Harbor_Back()
{
	Info_ClearChoices(DIA_Jack_Harbor);
};

func void DIA_Jack_Harbor_Ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Почему корабли больше не приходят сюда?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//Здесь говорят, что когда война будет окончена, все вернется на круги своя. Это все чушь собачья.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Уверяю тебя, настоящий матрос всегда первым понимает, что город приходит в упадок.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Матрос чувствует это своим нутром. И я говорю тебе, забудь об этом порте, его лучшие дни давно позади.
};

func void DIA_Jack_Harbor_Rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Что ты имеешь в виду под сбродом?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Посмотри на них, это же сборище лодырей. Большинство из них даже не знает, что такое работа. Они только и делают, что пьют все дни напролет и относят свои последние гроши в бордель.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Говорю тебе, держись от них подальше.
};

func void DIA_Jack_Harbor_Leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Так почему ты не уедешь отсюда?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Сегодня никто не возьмет на корабль старого морского волка вроде меня.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Большинство полагает, что Старый Джек ни на что не годен, и что его старые кости разъедает подагра.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//И? Они правы?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Вздор. Как только я опять почувствую под своими ногами палубу, я дам фору любому из этих нахальных юнцов.
};


instance DIA_Jack_BANDITENWEG(C_Info)
{
	npc = VLK_444_Jack;
	nr = 7;
	condition = DIA_Jack_BANDITENWEG_Condition;
	information = DIA_Jack_BANDITENWEG_Info;
	description = "Бандитов, которые захватили твой маяк, больше нет.";
};


func int DIA_Jack_BANDITENWEG_Condition()
{
	if(Npc_IsDead(LeuchtturmBandit_1021) && Npc_IsDead(LeuchtturmBandit_1022) && Npc_IsDead(LeuchtturmBandit_1023) && (MIS_Jack_KillLighthouseBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jack_BANDITENWEG_Info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Бандитов, которые захватили твой маяк, больше нет.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Это правда? Наконец-то я смогу опять вернуться к своей работе.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Пойдем со мной к маяку. Оттуда ты сможешь насладиться потрясающим видом на море.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillLighthouseBandits);
};


instance DIA_Jack_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_444_Jack;
	nr = 8;
	condition = DIA_Jack_LIGHTHOUSEFREE_Condition;
	information = DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "Мне нравится твой маяк.";
};


func int DIA_Jack_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKnowsWayToIrdorath == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//Мне нравится твой маяк.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Спасибо. Поднимись по лестнице наверх, оттуда открывается такой потрясающий вид. Чувствуй себя здесь как дома.
};


instance DIA_Jack_KAP3_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP3_EXIT_Condition;
	information = DIA_Jack_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP4_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP4_EXIT_Condition;
	information = DIA_Jack_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP5_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP5_EXIT_Condition;
	information = DIA_Jack_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_BEMYCAPTAIN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 51;
	condition = DIA_Jack_BEMYCAPTAIN_Condition;
	information = DIA_Jack_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "Ты бы не хотел опять выйти в море?";
};


func int DIA_Jack_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (MIS_Jack_NewLighthouseOfficer == 0))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Ты бы не хотел опять выйти в море?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Я бы с радостью отдал свою правую руку только за то, чтобы кто-нибудь нанял меня на большую шхуну, хотя бы ненадолго.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Но для старого морского волка вроде меня это не так-то легко, приятель. Да и к тому же, кто тогда будет присматривать за маяком?
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Забудь. Это я просто так сказал.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Я нуждаюсь в твоем опыте моряка.",DIA_Jack_BEMYCAPTAIN_seaman);
};

func void DIA_Jack_BEMYCAPTAIN_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Я нуждаюсь в твоем опыте моряка.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//Черт меня побери! Что ты задумал, приятель? Ты же не собираешься захватить королевскую военную галеру, а?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Кто знает?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(смеется) Это будет что-то! Ох, черт. Но я не могу вот так взять и бросить свой маяк. Ммм. Что же нам с этим делать?
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Джек, старый морской волк из гавани, мог бы стать хорошим капитаном. Но сначала я должен найти кого-нибудь, кто посторожит его маяк.");
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Забудь. Это я просто так сказал.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"А что если я приведу к тебе кого-нибудь ...?",DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer);
};

func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//А что если я приведу к тебе кого-нибудь, кто позаботился бы о маяке в твое отсутствие?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//Неплохая идея, приятель. И у меня есть подходящая кандидатура.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//У Гарада, кузнеца, есть подмастерье по имени Брайан. Я много раз беседовал с ним.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Я бы хотел доверить свой маяк ему. Я думаю, он лучше всего подходит для этого.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Иди, поговори с ним. Возможно, нам повезет, и этот парень согласится помочь нам.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_Running;
};

func void DIA_Jack_BEMYCAPTAIN_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Забудь. Это я просто так сказал.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
};


instance DIA_Jack_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_444_Jack;
	nr = 52;
	condition = DIA_Jack_BEMYCAPTAIN2_Condition;
	information = DIA_Jack_BEMYCAPTAIN2_Info;
	description = "Насчет Брайана ...";
};


func int DIA_Jack_BEMYCAPTAIN2_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) || ((MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_IsDead(Brian)))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN2_Info()
{
	if(Npc_IsDead(Brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Брайан мертв.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Ох. Ужасные времена. Он был таким хорошим парнем.
		MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Брайан позаботится о твоем маяке.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Я надеялся, что ты скажешь это.
		B_GivePlayerXP(XP_Jack_NewLighthouseOfficer);
		if(SCGotCaptain == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Я тебе все еще нужен?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Посмотрим, выйдет ли из этого парня толк.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Jack_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_444_Jack;
	nr = 53;
	condition = DIA_Jack_BEMYCAPTAIN3_Condition;
	information = DIA_Jack_BEMYCAPTAIN3_Info;
	description = "Будь моим капитаном.";
};


func int DIA_Jack_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_BEMYCAPTAIN2) && (SCGotCaptain == FALSE) && (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Я переплыл семь морей, приятель, но еще никогда я не был капитаном корабля.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//Я ничего не знаю о навигации. Ты должен взять на себя эти обязанности.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Я сделаю все, что будет в моих силах.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//А теперь, покажи мне мой корабль и твою команду. А ты, вообще, знаешь, куда направляешься? Я имею в виду, у тебя есть морская карта?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Подожди меня в порту. А об остальном не волнуйся.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Ну, как скажешь.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jack_LOSFAHREN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 59;
	condition = DIA_Jack_LOSFAHREN_Condition;
	information = DIA_Jack_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Отлично, старик. Поднять паруса!";
};


func int DIA_Jack_LOSFAHREN_Condition()
{
	if((JackIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Отлично, старик. Поднять паруса!
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Все в полном порядке. А теперь покажи мне свою морскую карту.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//Это будет нелегкое плавание. Но я все же надеюсь, что мы доберемся туда целыми и невредимыми.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//У тебя действительно есть все, что тебе нужно? Мы не станем возвращаться назад только потому, что ты что-то забыл.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Если ты уверен, что у тебя есть все необходимое, иди в капитанскую каюту и вздремни немного. Силы тебе скоро понадобятся.
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Полегче, приятель. Я еще даже не видел это корыто. Так не пойдет.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Сначала, ты должен укомплектовать команду, не менее чем из 5 человек, получить доступ на корабль и достать морскую карту. В противном случае, забудь об этом.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Jack_PERM5_NOTCAPTAIN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 59;
	condition = DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "И что дальше?";
};


func int DIA_Jack_PERM5_NOTCAPTAIN_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_BEMYCAPTAIN2) && (SCGotCaptain == TRUE) && (JackIsCaptain == FALSE)) || (MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//И что дальше?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//Я передумал. Я все же решил остаться здесь и охранять свой маяк.
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP6_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP6_EXIT_Condition;
	information = DIA_Jack_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

