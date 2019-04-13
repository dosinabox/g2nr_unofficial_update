
instance DIA_Abuyin_EXIT(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 999;
	condition = DIA_Abuyin_EXIT_Condition;
	information = DIA_Abuyin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Abuyin_PICKPOCKET(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 900;
	condition = DIA_Abuyin_PICKPOCKET_Condition;
	information = DIA_Abuyin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Abuyin_PICKPOCKET_Condition()
{
	return C_Beklauen(75,200);
};

func void DIA_Abuyin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,Dialog_Back,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};


instance DIA_Abuyin_Hallo(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Hallo_Condition;
	information = DIA_Abuyin_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Abuyin_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(задумчиво) ...Как странно... Мне кажется, что мы с тобой уже встречались, путник...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//Что ж... велики загадки нашего мира... О, прошу простить мою грубость, сын терпения, я даже не поприветствовал тебя.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Добро пожаловать, друг мой, присядь на мой скромный ковер и выкури трубку, наслаждаясь покоем.
};


instance DIA_Abuyin_du(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_du_Condition;
	information = DIA_Abuyin_du_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Меня зовут Абуин ибн Джадир ибн Омар Халид бен Хаджи аль Шариди. Я пророк и предсказатель, астролог и торговец табаком.
};


instance DIA_Abuyin_Kraut(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Kraut_Condition;
	information = DIA_Abuyin_Kraut_Info;
	permanent = FALSE;
	description = "Что за табак ты предлагаешь?";
};


func int DIA_Abuyin_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Что за табак ты предлагаешь?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Мои трубки набиты острым, освежающим яблочным табаком.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Выбирай, что хочешь, Сын Приключений.
};


instance DIA_Abuyin_anderen(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_anderen_Condition;
	information = DIA_Abuyin_anderen_Info;
	permanent = FALSE;
	description = "А у тебя есть другой табак?";
};


func int DIA_Abuyin_anderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//А у тебя есть другой табак?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Я предлагаю только лучший табак. Эта яблочная смесь - симфония моей родины - южных островов.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Но, конечно же, я всегда готов попробовать другой сорт табака - если кто-нибудь сумеет приготовить действительно хороший табак.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//А как это делается?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Возьми за основу яблочный табак. И попробуй добавлять в него различные ингредиенты.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Это делается на алхимическом столе, если, конечно ты имеешь навыки в алхимии.
};


instance DIA_Abuyin_Woher(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Woher_Condition;
	information = DIA_Abuyin_Woher_Info;
	permanent = FALSE;
	description = "Где мне взять яблочный табак?";
};


func int DIA_Abuyin_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Woher_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Где мне взять яблочный табак?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Я дам тебе две порции. А там делай с ними, что тебе захочется.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Если тебе понадобится еще табак, то направь свои стопы к Зурису, Мастеру Зелий. Он производит это табак и продает его.
	B_GiveInvItems(self,other,ItMi_ApfelTabak,2);
};

func void B_TabakProbieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Позволь мне попробовать твой табак.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Нет, этот аромат мне не очень нравится. Но, может быть, ты найдешь кого-нибудь, кто оценит его... э-э... утонченность.
};


instance DIA_Abuyin_Mischung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 10;
	condition = DIA_Abuyin_Mischung_Condition;
	information = DIA_Abuyin_Mischung_Info;
	permanent = TRUE;
	description = "Я принес новый сорт табака...";
};


func int DIA_Abuyin_Mischung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen) && (Abuyin_Honigtabak == FALSE) && ((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) || (Npc_HasItems(other,ItMi_PilzTabak) >= 1) || (Npc_HasItems(other,ItMi_DoppelTabak) >= 1) || (Npc_HasItems(other,ItMi_Honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Я принес новый сорт табака...
	Info_ClearChoices(DIA_Abuyin_Mischung);
	Info_AddChoice(DIA_Abuyin_Mischung,Dialog_Back,DIA_Abuyin_Mischung_BACK);
	if(Npc_HasItems(other,ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if(Npc_HasItems(other,ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if(Npc_HasItems(other,ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if(Npc_HasItems(other,ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};

func void DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Sumpf()
{
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Pilz()
{
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Doppel()
{
	B_GiveInvItems(other,self,ItMi_DoppelTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Super()
{
	B_GiveInvItems(other,self,ItMi_Honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Давай я попробую твой табак.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Это невероятно! В жизни ничего подобного не пробовал!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Как ты приготовил его?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Я смешал обычный табак с медом.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//Ты хорошо поработал, о, Отец Искусства Смешения. Я с превеликим удовольствием набью им свои презренные трубки.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Ну, набей.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Спасибо тебе, о, Сын Великодушия. Ни одна другая смесь не сравнится с твоим творением. Я готов покупать все, что ты сможешь принести мне.
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Info_ClearChoices(DIA_Abuyin_Mischung);
};


instance DIA_Abuyin_Trade(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Trade_Condition;
	information = DIA_Abuyin_Trade_Info;
	permanent = TRUE;
	description = "Я принес тебе медового табака.";
};


func int DIA_Abuyin_Trade_Condition()
{
	if((Abuyin_Honigtabak == TRUE) && (Npc_HasItems(other,ItMi_Honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	Abuyin_Score = 0;
	Abuyin_Score = Npc_HasItems(other,ItMi_Honigtabak) * VALUE_ItMi_HonigTabak;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Я принес тебе медового табака.
	B_GiveInvItems(other,self,ItMi_Honigtabak,Npc_HasItems(other,ItMi_Honigtabak));
	B_GiveInvItems(self,other,ItMi_Gold,Abuyin_Score);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Для меня огромное удовольствие иметь с тобой дело.
};


instance DIA_Abuyin_Herb(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Herb_Condition;
	information = DIA_Abuyin_Herb_Info;
	permanent = FALSE;
	description = "Тебя не заинтересует этот тюк травы?";
};


func int DIA_Abuyin_Herb_Condition()
{
	if(Npc_HasItems(other,ItMi_HerbPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Тебя не заинтересует этот тюк травы?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Тюк трав - это не болотная трава, нет? Ох, убери ее, о, Сын Недальновидности.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Если городская стража увидит ее у меня, они бросят меня в тюрьму - а тебя будет ждать не лучшая судьба!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Если тебе так хочется продать эту траву, послушай моего совета - покинь этот город.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Попробуй избавиться от нее где-нибудь за пределами городских стен. А здесь тебя ждет с ней одна головная боль.
};


instance DIA_Abuyin_Weissagung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung_Condition;
	information = DIA_Abuyin_Weissagung_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Я к твоим услугам за скромное вознаграждение, о, Отец Щедрости.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//За какие-то 25 монет, я рискну заглянуть для тебя в будущее.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Но помни - будущее всегда неопределенно. Все, что в моих силах - это уловить лишь крошечные фрагменты времени.
};


instance DIA_Abuyin_Zukunft(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft_Condition;
	information = DIA_Abuyin_Zukunft_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 25 золотых).";
};


var int DIA_Abuyin_Zukunft_permanent;

func int DIA_Abuyin_Zukunft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung) && (DIA_Abuyin_Zukunft_permanent == FALSE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Хорошо, о, Жаждущий Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft,"Я готов!",DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//О, Отец Монет, я прошу у тебя 25 золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(в трансе) Орки... они охраняют вход... старый туннель... Долина Рудников...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(в трансе) Люди в сверкающих доспехах... маг... твой друг с ними... он ждет тебя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(в трансе) Огонь! Нападение... могучего существа... пламя... многие... погибнут...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(в трансе) ...Что это?.. Город... Руины... Куарходрон из Яркендара...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(в трансе) ...Он был призван... Куарходрон из Яркендара!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Извини - видение кончилось. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft_permanent = TRUE;
	Abuyin_Zukunft = 1;
	Info_ClearChoices(DIA_Abuyin_Zukunft);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Nochmal(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Nochmal_Condition;
	information = DIA_Abuyin_Nochmal_Info;
	permanent = TRUE;
	description = "Ты можешь дать мне еще одно пророчество?";
};


func int DIA_Abuyin_Nochmal_Condition()
{
	if(Kapitel == Abuyin_Zukunft)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Ты можешь дать мне еще одно пророчество?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//О, Сын Загадочного Будущего, сейчас я не в силах приподнять завесу времени.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Только когда время подаст мне очередной знак, я смогу помочь тебе еще раз.
	if(Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//А когда это будет?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Когда будущее станет настоящим, и ты продолжишь свой путь.
		Abuyin_Erzaehlt = TRUE;
	};
};

func void B_Abuyin_Weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Да, время ушло вперед, и я могу сделать еще одно пророчество, если у тебя найдется несколько монет.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Сколько?
};


instance DIA_Abuyin_Weissagung2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung2_Condition;
	information = DIA_Abuyin_Weissagung2_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//За какие-то 100 монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft2_Condition;
	information = DIA_Abuyin_Zukunft2_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 100 золотых).";
};


var int DIA_Abuyin_Zukunft2_permanent;

func int DIA_Abuyin_Zukunft2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung2) && (DIA_Abuyin_Zukunft2_permanent == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Хорошо, о, Сын Мужества. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2,"Я готов!",DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//О, Отец Монет, я прошу у тебя 100 золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(в трансе) Наемник... ему нужен ты... ужасное убийство... Глаз...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(в трансе) Зловещие приспешники... они идут... ищут тебя... страж падет...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(в трансе) ...но трое должны объединиться... только тогда ты получишь то, что должно принадлежать тебе...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft2_permanent = TRUE;
	Abuyin_Zukunft = 2;
	Info_ClearChoices(DIA_Abuyin_Zukunft2);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung3_Condition;
	information = DIA_Abuyin_Weissagung3_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//За какие-то 250 монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft3_Condition;
	information = DIA_Abuyin_Zukunft3_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 250 золотых).";
};


var int DIA_Abuyin_Zukunft3_permanent;

func int DIA_Abuyin_Zukunft3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung3) && (DIA_Abuyin_Zukunft3_permanent == FALSE) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3,"Я готов!",DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//О, Отец Монет, я прошу у тебя 250 золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(в трансе) Ты должен пробиться... это суждено только тебе...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(в трансе) ...сквозь огонь и снег... сквозь лед и пламя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(в трансе) Люди в странных доспехах... болото... ящеры... они ждут тебя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft3_permanent = TRUE;
	Abuyin_Zukunft = 3;
	Info_ClearChoices(DIA_Abuyin_Zukunft3);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung4_Condition;
	information = DIA_Abuyin_Weissagung4_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//За какие-то 500 монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft4_Condition;
	information = DIA_Abuyin_Zukunft4_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 500 золотых).";
};


var int DIA_Abuyin_Zukunft4_permanent;

func int DIA_Abuyin_Zukunft4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung4) && (DIA_Abuyin_Zukunft4_permanent == FALSE) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4,"Я готов!",DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//О, Отец Монет, я прошу у тебя 500 золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(в трансе) Место знаний... другая страна... темное место далеко-далеко...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(в трансе) Мужественные спутники... ты должен сделать выбор...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(в трансе) Храм... стоит одиноко в царстве Аданоса... покрытый туманом...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft4_permanent = TRUE;
	Abuyin_Zukunft = 4;
	Info_ClearChoices(DIA_Abuyin_Zukunft4);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung5_Condition;
	information = DIA_Abuyin_Weissagung5_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//За какую-то 1000 монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft5_Condition;
	information = DIA_Abuyin_Zukunft5_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 1000 золотых).";
};


var int DIA_Abuyin_Zukunft5_permanent;

func int DIA_Abuyin_Zukunft5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung5) && (DIA_Abuyin_Zukunft5_permanent == FALSE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5,"Я готов!",DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//О, Отец Монет, я прошу у тебя 1000 золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(в трансе) Тьма опустилась на землю... зло торжествует...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(в трансе) Король проиграет войну против орков...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(в трансе) Ты вернешься, но не найдешь покоя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft5_permanent = TRUE;
	Abuyin_Zukunft = 5;
	Info_ClearChoices(DIA_Abuyin_Zukunft5);
	B_GivePlayerXP(XP_Ambient * 4);
};

