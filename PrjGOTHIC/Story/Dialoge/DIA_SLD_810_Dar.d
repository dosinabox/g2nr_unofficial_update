
instance DIA_Dar_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_Hallo(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent = FALSE;
	description = "Что ты куришь?";
};


func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Что ты куришь?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Хочешь затянуться?
	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hallo,"Нет.",DIA_Dar_Hallo_Nein);
	Info_AddChoice(DIA_Dar_Hallo,"Конечно.",DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Конечно.
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Неплохо, да?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Где ты взял эту траву?
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(усмехается) У меня свои источники.
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Нет.
	Info_ClearChoices(DIA_Dar_Hallo);
};


var int Dar_einmal;

instance DIA_Dar_PERM(C_Info)
{
	npc = Sld_810_Dar;
	nr = 2;
	condition = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent = TRUE;
	description = "Ты чувствуешь что-нибудь кроме дыма?";
};


func int DIA_Dar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Ты чувствуешь что-нибудь кроме дыма?
	if((Dar_LostAgainstCipher == TRUE) && (Dar_einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(саркастически) Иногда я позволяю всяким мстительным болотным наркоманам задать мне взбучку...
		Dar_einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//Но не сейчас.
	};
};


instance DIA_Dar_WannaJoin(C_Info)
{
	npc = Sld_810_Dar;
	nr = 3;
	condition = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к наемникам. Ты не возражаешь?";
};


func int DIA_Dar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo) && (other.guild == GIL_NONE) && (Dar_LostAgainstCipher == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Я хочу присоединиться к наемникам. Ты не возражаешь?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Мне все равно.
};


instance DIA_Dar_DuDieb(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent = FALSE;
	description = "Сифер сказал мне, что кто-то украл у него тюк болотной травы...";
};


func int DIA_Dar_DuDieb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Сифер сказал мне, что кто-то украл у него тюк болотной травы...
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(смеется идиотским приглушенным смехом)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Ты ничего не знаешь об этом?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(очень коротко) Нет.
	Dar_Verdacht = TRUE;
};


instance DIA_Dar_WoPaket(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent = TRUE;
	description = "Где тюк?";
};


func int DIA_Dar_WoPaket_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_WoPaket_Info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(угрожающе) Где тюк?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Хорошо, хорошо, хорошо. Я продал его какому-то идиоту в городе.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Это было в гавани. Я не помню, как он выглядел.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Может, тебе нужна еще одна хорошая встряска?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Если честно, я был обкуренный в хлам. Я совершенно не представляю, как этот парень выглядел.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Это было в гавани около кораблестроителей. Это все, что я помню.
		Dar_Dieb = TRUE;
		B_LogEntry(Topic_CipherPaket,"Дар признал, что украл тюк с травой. Он продал ее в портовом квартале Хориниса, около кораблестроителей.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Что я могу знать?
	};
};


instance DIA_Dar_AufsMaul(C_Info)
{
	npc = Sld_810_Dar;
	nr = 5;
	condition = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent = FALSE;
	description = "Я вышибу эту информацию из тебя!";
};


func int DIA_Dar_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Я вышибу эту информацию из тебя!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Расслабься. Я слишком обкурился, чтобы драться с тобой!
	B_GiveInvItems(self,other,ItMi_Joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Вот, затянись!
};


instance DIA_Dar_Kameradenschwein(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dar_Kameradenschwein_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE;
		return TRUE;
	};
};

func void DIA_Dar_Kameradenschwein_Info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Трепач! Ты сказал Сиферу, что я взял его траву!
	if(Npc_KnowsInfo(other,DIA_Dar_WannaJoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Я ни за что не проголосую за тебя.
	};
};


instance DIA_Dar_Pilztabak(C_Info)
{
	npc = Sld_810_Dar;
	nr = 6;
	condition = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent = FALSE;
	description = "Ты когда-нибудь пробовал грибной табак?";
};


func int DIA_Dar_Pilztabak_Condition()
{
	if(Npc_HasItems(other,ItMi_PilzTabak) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//Ты когда-нибудь пробовал грибной табак?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//Звучит интересно. Дай его сюда.
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Так, попробуем...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//Ты когда-нибудь курил его САМ?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Ну...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Курил или нет?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Мне было некогда...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Ох, черт!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Святой Робар!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Это дерьмо слишком крутое! Даже и не вздумай пробовать!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dar_KAP3_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP3_EXIT_Condition;
	information = DIA_Dar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP4_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP4_EXIT_Condition;
	information = DIA_Dar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_ORCRING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_ORCRING_Condition;
	information = DIA_Dar_ORCRING_Info;
	description = "Похоже, часть наемников исчезла.";
};


func int DIA_Dar_ORCRING_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Похоже, часть наемников исчезла.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Конечно. Это так. Сильвио сейчас очень далеко, и он увел с собой половину людей.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//Мне плевать. У меня будет больше шансов показать себя и заслужить уважение Ли. Для этого нужно сделать что-нибудь громкое.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Если я смогу принести доказательство, что действительно крутой парень, возможно, я даже смогу стать одним из телохранителей Ли.
	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING,"Меня это не интересует.",DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING,"Крутой парень? Ты?",DIA_Dar_ORCRING_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(DIA_Dar_ORCRING,"Как это должно выглядеть?",DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Крутой парень? Ты?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(злобно) Ох, ладно, заткнись. Ты-то вообще кто такой?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//Какой-то надутый простофиля из города. Тебе вообще ничего не светит.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Ты здесь всего пару дней и уже задрал нос выше облаков.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Кого ты хочешь напугать этой своей магической чушью? Только не меня.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//И даже, если подумать, раскроить твой череп - именно то, что мне нужно, чтобы заслужить уважение Ли и его парней.
		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING,"У меня нет времени на эту чушь.",DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING,"Ладно. Попробуй.",DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Ты подожди. Я найду способ произвести впечатление на Ли.
	};
};


var int Dar_FightAgainstPaladin;

func void DIA_Dar_ORCRING_necken_schlagen()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Ладно. Попробуй.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ох, я не могу ждать.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//У меня нет времени на эту чушь.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//О, да. Ты же рыцарь правосудия, как я мог забыть. Жаль. Я думал, что у тебя больше мужества.
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Как это должно выглядеть?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Я не знаю точно. Какой-нибудь трофей орков вполне подошел бы.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Что-нибудь вроде эмблемы лидера орков, ну или что-то вроде. Знамя, нарукавная нашивка или кольцо, ну, ты понял.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//Я не смогу произвести впечатление без этого. Это очевидно.
	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing,LOG_Running);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing,"Дар хочет стать важной шишкой в рядах наемников. Он хочет заполучить трофей орков. Знамя, нарукавную нашивку, кольцо, или еще что-нибудь.");
	MIS_Dar_BringOrcEliteRing = LOG_Running;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//Меня это не интересует.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(злобно) Конечно нет. Я бы очень удивился, если бы это было не так.
	Info_ClearChoices(DIA_Dar_ORCRING);
};


instance DIA_Dar_FIGHTAGAINSTPALOVER(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information = DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important = TRUE;
};


func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if((Dar_FightAgainstPaladin == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Хорошо, я знаю, что Ли не особенно разозлится, если я опять сцеплюсь с тобой.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Я не хочу заводить себе здесь врагов. Так что забудем об этом, хорошо?
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Dar_BRINGORCELITERING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_BRINGORCELITERING_Condition;
	information = DIA_Dar_BRINGORCELITERING_Info;
	description = "Я принес трофей орков, который ты искал.";
};


func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if((MIS_Dar_BringOrcEliteRing == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Я принес трофей орков, который ты искал.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Что ты там принес мне?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Кольцо предводителя орков.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//Ух ты, в таком случае... Что ты хочешь за него?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Что ты можешь предложить мне?",DIA_Dar_BRINGORCELITERING_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Заплати мне золотом.",DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Заплати мне золотом.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Ммм. 600 золотых монет?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Что?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//Ладно. Я дам тебе 1200 монет.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Забирай их или оставь себе это кольцо.
	};
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Этого недостаточно.",DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Договорились.",DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Договорились. Держи кольцо.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Спасибо. Не терпится услышать, что другие скажут об этом.
	CreateInvItems(self,ItMi_Gold,1200);
	B_GiveInvItems(self,other,ItMi_Gold,1200);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//А я думаю, что это слишком много. Этот бизнес не нравится мне. Не хочу обидеть.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Что ты можешь предложить мне?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Либо забирай деньги, либо этот амулет, который я... ну, скажем, приобрел недавно.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Он повысит твою ловкость. Я сам испытывал его.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Заплати мне золотом.",DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Давай мне амулет.",DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Давай мне амулет.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Конечно. Пусть он доставит тебе радость. Теперь давай мне это кольцо.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Теперь я счастлив.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};


instance DIA_Dar_KAP5_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP5_EXIT_Condition;
	information = DIA_Dar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP6_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP6_EXIT_Condition;
	information = DIA_Dar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_PICKPOCKET(C_Info)
{
	npc = Sld_810_Dar;
	nr = 900;
	condition = DIA_Dar_PICKPOCKET_Condition;
	information = DIA_Dar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Dar_PICKPOCKET_Condition()
{
	return C_Beklauen(67,35);
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET,Dialog_Back,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

