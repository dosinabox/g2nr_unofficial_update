
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_PICKPOCKET(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 900;
	condition = DIA_Addon_Scatty_PICKPOCKET_Condition;
	information = DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	return C_Beklauen(60,90);
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,Dialog_Back,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//С тех пор как гробница была открыта, покупателей не так много.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Ворону больше не нужны рабы, поэтому они теперь добывают золото. По приказу Бладвина.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//Рудокопы не слишком усердствуют. (бормочет) А рудокопам, которые не усердствуют, не так много и нужно.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Скатти продает различные товары.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "Бладвин? Он сейчас командует?";
};


func int DIA_Addon_Scatty_last_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Бладвин? Он сейчас командует?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Он старший по шахте. Но сам он почти никогда не спускается. Большинство времени он проводит в храме с Вороном.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//'Почти никогда' - это как часто, если быть точным?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Последний раз я видел его, когда он выходил из гробницы...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(быстро) ...Хотя нет, подожди! Последний раз был, когда он посылал рабов добывать золото.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//В отличие от Ворона, его ОЧЕНЬ интересует золото.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "А что это за гробница?";
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//А что это за гробница?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Проклятая, роковая гробница! Ее хранители убили множество народу!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Хранители? Ты имеешь в виде таких каменных существ? Плоских и с круглой головой?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//В точности! Они выходят из глубин камня целыми дюжинами.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Я с самого начала знал, что раскапывать гробницу - плохая идея.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Но Ворон был просто одержим идеей копать здесь. А когда гробницу все-таки раскопали, он пошел туда со своими охранниками.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "Что Ворону нужно в гробнице?";
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Что Ворону нужно в гробнице?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(резко останавливается) Хм... ты очень любопытен. Ты напоминаешь мне одного парня, что я когда-то знал.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Он был таким же любопытным. И в какой-то момент это стало причиной его гибели.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Давай-ка к делу. Что случилось в гробнице?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Ну... Э-э... Что-то у меня горло пересохло...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Эй, Скатти, НЕ СЕЙЧАС. Это важно, так что Ворону там нужно?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Ладно. (глубокий вдох) Он... он звал... призывал кого-то. Он произносил слова на чужом языке.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Яркий свет вырвался из гробницы, и я услышал вопль, который пробрал меня до костей - демонический вопль.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//А потом?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//Это все, что я знаю. После этого Бладвин вышел из гробницы и сказал, чтобы я проваливал. Что я и сделал.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Через короткое время Ворон со своими людьми вернулся в храм. И с тех пор никто не видел Ворона.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "Хочешь выпить?";
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Хочешь выпить?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Хорошо бы... пива. Но вряд ли в лагере есть пиво.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Но, может быть, у Люсии есть бутылочка...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "За твое здоровье. (дать пиво)";
};


func int DIA_Addon_Scatty_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken) && Npc_HasItems(other,ItFo_Beer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Вот, пожалуйста.
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//О, спасибо, это вкусно. Спасибо. Ты - мой герой.
	B_GivePlayerXP(XP_Ambient * 5);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Возьми кирку в руки и рубани по золотой жиле - каждый может это сделать.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Но, если так сделать, разлетится много самородков. Поэтому копать должны люди, которые понимают в этом деле.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Я смогу рассказать тебе больше, когда у тебя будет больше опыта.
	B_Upgrade_Hero_HackChance(5);
};


var int Scatty_teach_perm;

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
	description = "Научиться добывать золото (2 LP/10 процентов)";
};


func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Scatty_teach_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Расскажи мне еще что-нибудь о том, как копать золото.
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//В первую очередь ты должен знать, что золото - это не руда. Оно мягкое, как масло. Если ты ударишь слишком сильно, все разлетится.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//У каждого рудокопа есть свои приемы, позволяющие ему отделить самородки от породы.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//В конечном итоге, эти приемы и отличают просто рудокопа от хорошего рудокопа.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Кроме этого, повторенье - мать ученья. Только работая ты станешь хорошим рудокопом.
		other.lp = other.lp - 1;
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = "Бладвин мертв.";
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Бладвин мертв.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Хм, есть не так много людей, чьей смерти я бы желал... но мертвый Бладвин лучше живого.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_1");
};

