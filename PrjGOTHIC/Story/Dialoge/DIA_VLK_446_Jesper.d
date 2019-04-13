
instance DIA_Jesper_EXIT(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 999;
	condition = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesper_PICKPOCKET(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 900;
	condition = DIA_Jesper_PICKPOCKET_Condition;
	information = DIA_Jesper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Jesper_PICKPOCKET_Condition()
{
	return C_Beklauen(80,180);
};

func void DIA_Jesper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,Dialog_Back,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};

func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};


instance DIA_Jesper_Hallo(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jesper_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Эй, Что ты тут делаешь? Тебе тут не место!
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Так что выкладывай, что ты делаешь здесь?
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Я пришел убить тебя.",DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo,"Я просто прогуливаюсь здесь.",DIA_Jesper_Hallo_NurSo);
	if(Attila_Key == TRUE)
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Аттила дал мне ключ ...",DIA_Jesper_Hallo_Willkommen);
	}
	else
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Я прикончил Аттилу ...",DIA_Jesper_Hallo_Umgelegt);
	};
	DG_gefunden = TRUE;
};

func void DIA_Jesper_Hallo_Kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Я пришел убить тебя.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//Чудесная идея. Ты что думаешь, я здесь один? Ах, ладно. Сейчас мы решим этот вопрос.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Я просто прогуливаюсь здесь.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Здесь не стоит гулять. Это слишком опасно, понятно?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Так что оставь свое оружие на месте и скажи мне, зачем ты здесь?
};

func void DIA_Jesper_Hallo_Willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Аттила дал мне ключ. Вот почему я здесь. Так что вам нужно от меня?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Разве ты не хочешь узнать это? Не горячись.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Иди к Кассии. Тебя ждут.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Я прикончил Аттилу. При нем был ключ от канализации.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(с недоверием) ТЫ убил Аттилу?! (презрительно) А, ладно, он все равно был никчемным псом.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Но я хочу предупредить тебя. Если ты нападешь на МЕНЯ, я тебя убью.
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Что ты делаешь здесь ...",DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo,"Отведи меня к вашему главарю.",DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Что ты делаешь в этой темной вонючей дыре?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(рычит) Я живу здесь. Еще один глупый вопрос, и в твоей шкуре появятся дырки.
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Отведи меня к вашему главарю.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(грязный смех) ХА - к главарю? Я уверен, Кассия захочет поговорить с тобой.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Иди вперед - и не пытайся провести меня.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Jesper_Bezahlen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Jesper_Bezahlen_Condition()
{
	if((Join_Thiefs == TRUE) && (Jesper_TeachSneak == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Ты можешь научить меня чему-нибудь?
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Конечно, я покажу, как нужно красться - для тебя бесплатно.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Ты хочешь узнать, как двигаться, не издавая ни единого звука? Это обойдется тебе в 100 золотых монет.
		B_Say_Gold(self,other,Jesper_Cost);
		Info_ClearChoices(DIA_Jesper_Bezahlen);
		Info_AddChoice(DIA_Jesper_Bezahlen,"Может быть, позже ...(НАЗАД)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Jesper_Bezahlen,"Хорошо, я хочу научиться красться (заплатить 100 золотых).",DIA_Jesper_Bezahlen_Okay);
	};
};

func void DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Jesper_Bezahlen);
};

func void DIA_Jesper_Bezahlen_Okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Хорошо, я хочу научиться красться.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Вот золото.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Скажешь, когда будешь готов.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Без золота ты не сможешь ничему научиться.
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	};
};


instance DIA_Jesper_Schleichen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent = TRUE;
	description = "Научи меня красться.";
};


var int DIA_Jesper_Schleichen_permanent;

func int DIA_Jesper_Schleichen_Condition()
{
	if((Jesper_TeachSneak == TRUE) && (DIA_Jesper_Schleichen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Schleichen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Научи меня красться.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Умение красться очень важно для любого вора. Особенно, если ты ходишь по чужому дому.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Там нельзя топать, как ты это делаешь сейчас. Большинство людей спит очень чутким сном.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Только когда ты крадешься, никто не услышит тебя, и ты сможешь работать беспрепятственно.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};


instance DIA_Jesper_Killer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Killer_Condition()
{
	if(Npc_IsDead(Cassia) || Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if(Npc_IsDead(Cassia) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Ты убил моих друзей. Зачем ты сделал это, убийца?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Я отправлю тебя в царство Белиара.
	}
	else if(Npc_IsDead(Cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Убийца! Ты убил Кассию! Но от меня тебе не уйти!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Я давно работаю с Рамирезом и добыл для него больше золота, чем ты можешь себе представить.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//А ты взял и убил его, грязный пес! Но сейчас пришло время расплаты!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Jesper_Bogen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent = FALSE;
	description = "Скажи, ты ничего не знаешь о луке Боспера?";
};


func int DIA_Jesper_Bogen_Condition()
{
	if((Npc_HasItems(other,ItRw_Bow_L_03_MIS) < 1) && (MIS_Bosper_Bogen == LOG_Running) && (Join_Thiefs == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Скажи, ты ничего не знаешь о луке Боспера?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Ты имеешь в виду лук этого ремесленника? Да, я упаковал его в один из сундуков.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Но там полно крыс вокруг. Ты можешь забрать его, если не боишься этих тварей.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Ох, да, конечно же, этот сундук заперт. Тебе придется взломать замок. (ухмыляется) Надеюсь, у тебя есть отмычки.
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_Jesper_Tuer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent = FALSE;
	description = "А что за этой закрытой дверью?";
};


func int DIA_Jesper_Tuer_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//А что за этой закрытой дверью?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(ухмыляется) За ней находится сундук - сундук мастера-медвежатника Фингера.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Он поставил такой невероятно сложный замок на него, что до сих пор никому не удалось открыть его.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//К сожалению, он как-то попался - и его засунули за Барьер, где он, вероятно, и умер.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Но если ты хочешь попытаться открыть его сундук, вот ключ от этой комнаты.
	B_GiveInvItems(self,other,ItKe_Fingers,1);
};


instance DIA_Jesper_Truhe(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent = FALSE;
	description = "Мне удалось открыть сундук.";
};


func int DIA_Jesper_Truhe_Condition()
{
	if((Mob_HasItems("MOB_FINGERS",ItMi_Gold) < 300) || (Mob_HasItems("MOB_FINGERS",ItMi_SilverCup) < 5) || (Mob_HasItems("MOB_FINGERS",ItMi_GoldCup) < 1) || (Mob_HasItems("MOB_FINGERS",ItAm_Strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",ItPo_Perm_DEX) < 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Truhe_Info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Мне удалось открыть сундук.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//Это невозможно! Похоже, у нас появился новый мастер-медвежатник.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Поздравляю!
	B_GivePlayerXP(XP_JesperTruhe);
};

