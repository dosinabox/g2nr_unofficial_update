
instance DIA_Richter_EXIT(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Что тебе от меня нужно? Кто ты вообще такой?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Я, э-э...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//Скажи, мы раньше нигде не встречались?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello,"Я такого не помню.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello,"Может и так.",DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Я такого не помню.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//Забавно. Готов поклясться, что где-то видел тебя раньше.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Ладно, все вы, отбросы общества, похожи друг на друга.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Может и так.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Ты совсем обнаглел?! Ты хоть знаешь, с кем ты разговариваешь?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//По крайней мере, ты мог бы обращаться ко мне более почтительно.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//А теперь убирайся с глаз моих!
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Richter_Perm_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Как дела?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Тебе лучше убраться отсюда, грязный наемник, пока я не позвал стражу.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Расслабься. Я здесь не для того, чтобы обокрасть тебя. Я ищу работу.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ах. Так ты хочешь работать на меня. Хмм. Это, конечно, меняет дело.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Да, у меня есть небольшая проблема. Но я не знаю, могу ли я доверять тебе. Сначала ты должен доказать, что на тебя можно положиться.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Разве я уже не сказал, что не хочу иметь с тобой никаких дел?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Нет, по крайней мере, не так подробно.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Но теперь, я надеюсь, до тебя, наконец, это дошло.
	};
};


instance DIA_Richter_RichtersLakai(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = "Испытай меня.";
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter != 0)) && (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Испытай меня.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//М-м-м. Хорошо. Слушай. Принеси мне священный молот Магов Огня. Они хранят его где-то в подвалах монастыря.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Если тебе удастся это, я подумаю насчет того, чтобы принять тебя в телохранители.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai,"Я должен украсть у магов? Да у тебя крыша поехала.",DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai,"Хорошо.",DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai,"Судья не доверяет мне. Я должен доказать свою верность ему. Я должен украсть священный молот из подвала монастыря магов огня и принести молот ему.");
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//Я должен украсть у магов? Да у тебя крыша поехала.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//Тогда проваливай к черту. Хватит тратить мое время попусту.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Хорошо.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Отлично. Но помни - если тебя поймают, я никогда не слышал о тебе.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = "Вот священный молот магов.";
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Вот священный молот магов.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Я поражен. Похоже, у тебя действительно серьезные намерения. Вот твое вознаграждение.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Отлично. Так как все прошло хорошо, у меня есть для тебя еще одно задание.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Несколько дней назад, из местной тюрьмы сбежали несколько заключенных.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Эти сукины дети отправились в горы. Скорее всего, по направлению к новой башне Ксардаса.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Их главаря зовут Моргахард. Я хочу, чтобы ты убил его.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Поторопись, пока они не исчезли куда-нибудь еще.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai,"Несколько заключенных сбежали от судьи. Я должен найти их и прикончить, а также прикончить их главаря - МОРГАХАРДА. Они, предположительно, скрываются в горах, где-то по направлению к новой башне Ксардаса.");
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = "Моргахард мертв.";
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Моргахард мертв.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Ах! Ты отличный парень. Вот твоя награда.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai,"Судью, похоже, огорчила новость о смерти Моргахарда. А, ладно, мне до этого нет дела. Моя основная цель - выполнение задания Ли.");
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = "Могу я еще что-нибудь сделать для тебя?";
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Могу я еще что-нибудь сделать для тебя?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Пока нет. Возможно, позже.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = "Дай мне письменное подтверждение полномочий распоряжаться кораблем паладинов.";
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Дай мне письменное подтверждение полномочий распоряжаться кораблем паладинов.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(смеется) Ты, должно быть, тронулся рассудком. Что ты хочешь, чтобы я сделал?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Ты уже слышал. Либо ты дашь мне эту бумагу, либо я сдам тебя ополчению.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(рычит) Никто не смеет меня шантажировать! Тем более ты! Я скормлю тебя волкам, презренный кусок дерьма!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Моргахард убил губернатора по твоему приказу. У меня есть документ, подтверждающий это.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(Рычит) Ах-х.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Ты пожалеешь об этом. Этот шантаж не сойдет тебе с рук просто так.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Вот твоя бумага. А теперь проваливай. Я разберусь с тобой позже.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship,"Письмо о подтверждении полномочий должно позволить без проблем завладеть кораблем. Интересно, что скажет на это Ли.");
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Убирайся с глаз моих.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть этот ключ будет легко)";
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};

