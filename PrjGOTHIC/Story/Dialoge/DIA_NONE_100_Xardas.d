
instance DIA_Xardas_FirstEXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 990;
	condition = DIA_Xardas_FirstEXIT_Condition;
	information = DIA_Xardas_FirstEXIT_Info;
	permanent = FALSE;
	description = "Я немедленно отправляюсь в путь!";
};


func int DIA_Xardas_FirstEXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Я немедленно отправляюсь в путь!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Хорошо! И еще одно: не говори никому, что разговаривал со мной. И, прежде всего, не говори об этом магам!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//С тех пор, как я отошел от них, Круг Огня считает меня мертвым - и это очень хорошо.
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


var int Xardas_GoodLevelComment;

instance DIA_Xardas_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_EXIT_Condition;
	information = DIA_Xardas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	if((other.guild == GIL_NONE) && (other.level > 10) && (Xardas_GoodLevelComment == FALSE))
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_02_add");	//Ты скоро восстановишь свои силы.
		Xardas_GoodLevelComment = TRUE;
	};
	B_ClearFakeItems(other);
	AI_StopProcessInfos(self);
};


var int Addon_zuerst;

func void B_Xardas_SoLittleTime()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(задумчиво) У нас очень мало времени.
};

instance DIA_Xardas_Hello(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Hello_Condition;
	information = DIA_Xardas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Hello_Info()
{
	NewLogEnabled = TRUE;
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//Наконец-то! (улыбается) Я и не думал, что нам с тобой доведется встретиться снова.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//Я чувствую себя так, будто три недели пролежал под кучей камней.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//Так оно и было. Ты выжил только благодаря магии твоих доспехов.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//Я уже начал опасаться, что не смогу вытащить тебя из-под развалин храма.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//Но хватит об этом. Сейчас-то ты здесь.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//И над нами нависла новая угроза.
	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello,"Ну, по крайней мере, у нас сейчас достаточно времени. Я сделал это. Спящий уничтожен.",DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello,"Что это за НОВАЯ угроза, о которой ты говоришь?",DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	PlayVideo("Intro_ADDON.BIK");
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_01");	//(пренебрежительно) Люди слабы.
	AI_Output(other,self,"DIA_Addon_AddonIntro_15_00");	//(ошеломлен) ...люди?
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_02");	//(пренебрежительно) Они слишком легко поддаются соблазнам Зла.
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_03");	//Таким образом они вовлекаются в дела, которые не могут понять и уж тем более не могут контролировать.
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_04");	//Твердые в своей вере уже начали сражение с врагом.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_10");	//Ты должен стать их союзником! Это единственный способ остановить Белиара.
	Addon_zuerst = TRUE;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//Ну, по крайней мере, у нас сейчас достаточно времени. Я сделал это. Спящий...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... был изгнан. Ты победил его, да, это так - но не в наших силах остановить войну, которая разгорается сейчас.
	AI_Output(other,self,"DIA_Xardas_Hello_15_05");	//Ты говоришь об орках?
	AI_Output(self,other,"DIA_Xardas_Hello_14_06");	//Я говорю о гораздо более ужасных созданиях.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Своим последним яростным воплем Спящий привел в движение армии Тьмы.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Это был приказ всем созданиям Тьмы. Слово силы, которому они все обязаны повиноваться.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Его последним приказом было: ИДИТЕ! И они пошли. Все. Даже драконы.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(изумленно) Драконы?
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Это творения древней силы. Я чувствую их присутствие - даже здесь.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//И они собрали вокруг себя целую армию из низших существ.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//И где эта армия сейчас?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Лагерь этой армии находится недалеко отсюда, в Долине Рудников около Хориниса, и она готовится к атаке.
	if(Addon_zuerst == TRUE)
	{
		B_Xardas_SoLittleTime();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//Но это еще не все. Есть еще кое-что, что угрожает нам. Об этом я узнал лишь недавно.
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello,"Что это за НОВАЯ угроза, о которой ты говоришь?",DIA_Addon_Xardas_Hello_Man);
	};
};


instance DIA_Xardas_AWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_AWAY_Condition;
	information = DIA_Xardas_AWAY_Info;
	permanent = FALSE;
	description = "Тогда давай побыстрее уносить отсюда ноги!";
};


func int DIA_Xardas_AWAY_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Xardas_TODO))
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Тогда давай побыстрее уносить отсюда ноги!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Если мы сбежим сейчас, это всего лишь отсрочит нашу встречу с драконами.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//При помощи солдат и магов, живущих здесь, мы можем остановить их до того, как армия Тьмы будет полностью сформирована.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//У нас не будет лучшего шанса для этого.
};


instance DIA_Xardas_TODO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_TODO_Condition;
	information = DIA_Xardas_TODO_Info;
	permanent = FALSE;
	description = "Что мы можем сделать?";
};


func int DIA_Xardas_TODO_Condition()
{
	return TRUE;
};

func void DIA_Xardas_TODO_Info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//На этот раз самим нам не справиться. Только сила Инноса может помочь нам в борьбе против этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//В городе Хоринис, что неподалеку отсюда, остановился отряд паладинов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Они обладают сильным артефактом, который может помочь нам победить этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//Они называют его 'Глаз Инноса'. Ты должен завладеть этим артефактом.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Расскажи паладинам о надвигающейся угрозе. Ты должен убедить их предводителя поддержать нас!
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_07");	//А после этого ты должен найти артефакт Белиара.
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_08");	//Это противоположность Глаза Инноса. Он не должен попасть в руки Зла.
	if(C_WorldIsFixed())
	{
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_017");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_018");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_019");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_019");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_021");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_021");
		Wld_InsertNpc(Keiler,"SOME_NW_WAYPOINT_029");
		Wld_InsertNpc(Keiler,"SOME_NW_WAYPOINT_029");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_054");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_054");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_061");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_061");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_041");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_041");
		Wld_InsertNpc(Giant_Rat,"SOME_NW_WAYPOINT_049");
		Wld_InsertNpc(Giant_Rat,"SOME_NW_WAYPOINT_049");
		Wld_InsertNpc(Meatbug,"SOME_NW_WAYPOINT_037");
		Wld_InsertNpc(Meatbug,"SOME_NW_WAYPOINT_037");
		Wld_InsertNpc(YGiant_Bug,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_03");
	}
	else
	{
		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_02");
		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_01");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_07");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_08");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_09");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_10");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(YGiant_Bug,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02");
	};
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_Running);
	B_LogEntry(TOPIC_INNOSEYE,"В городе Хоринис расположился отряд паладинов. Они обладают сильным артефактом: Глазом Инноса. Его сила должна помочь нам избавиться от драконов. Я должен убедить паладинов, что нам нужно объединить наши усилия.");
};


instance DIA_Addon_Xardas_StonePlate(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Addon_Xardas_StonePlate_Condition;
	information = DIA_Addon_Xardas_StonePlate_Info;
	description = "Что ты можешь сказать об этой каменной табличке?";
};


func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//Что ты можешь сказать об этой каменной табличке?
	//AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_01");	//Ich habe so eine unten in der Hцhlen vor meinem Turm gefunden.
	//AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_02");	//Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//Сначала я подозревал, что это магический артефакт, но потом пришел к выводу, что никакой ценности она не имеет.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//Я не смог полностью расшифровать надписи на табличке, но, похоже, они относятся к истории какой-то древней культуры.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//Если хочешь, можешь забрать табличку себе. Мне она ни к чему.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Xardas_Portal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_Portal_Condition;
	information = DIA_Addon_Xardas_Portal_Info;
	description = "Маги Воды нашли портал, ведущий в неисследованную часть острова...";
};


func int DIA_Addon_Xardas_Portal_Condition()
{
	if((SC_KnowsPortal == TRUE) && !C_ScHasMeleeBeliarsWeapon() && !C_SCHasBeliarsRune() && (Saturas_KlaueInsMeer == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//Маги Воды нашли портал, ведущий в неисследованную часть острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//Как интересно...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//Как только ты узнаешь что-нибудь, что действительно сможет нам помочь, дай мне знать!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//Где-то там может быть спрятан артефакт Белиара. Ты должен найти его!
};


instance DIA_Addon_Xardas_PortalAgain(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_PortalAgain_Condition;
	information = DIA_Addon_Xardas_PortalAgain_Info;
	permanent = TRUE;
	description = "Насчет этой неизвестной части острова...";
};


func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_Portal) && !C_ScHasMeleeBeliarsWeapon() && !C_SCHasBeliarsRune() && (Saturas_KlaueInsMeer == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//Насчет этой неизвестной части острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//Меня не интересуют детали. Возвращайся, если узнаешь что-нибудь действительно полезное.
};


func void B_Xardas_ClawIsLost()
{
	if(XardasKnowsAboutDestroyedClaw == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(кричит) Ты сошел с ума?! Да ты хотя бы понимаешь, что ты отдал?
	};
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//Это оружие могло бы сослужить нам огромную службу!
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//Я думаю, что я сделал правильный выбор.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(вздыхает) Пути богов неисповедимы...
};

func void B_Xardas_ClawReaction()
{
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(жадно) Как интересно...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//Это оружие может нам очень помочь. Но оно также и очень опасно.
	B_GivePlayerXP(XP_Ambient * 3);
};

instance DIA_Addon_Xardas_AddonSuccess(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_AddonSuccess_Condition;
	information = DIA_Addon_Xardas_AddonSuccess_Info;
	description = "Я исследовал неизвестную часть острова...";
};


func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//Я исследовал неизвестную часть острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//И что ты нашел?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//Все кончилось тем, что в мои руки попал Коготь Белиара.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Коготь Белиара?! Где он сейчас? Он у тебя с собой?
	if(C_ScHasMeleeBeliarsWeapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Да, вот он.
		CreateInvItem(other,ItMw_BeliarWeapon_Fake);
		AI_UseItem(other,ItMw_BeliarWeapon_Fake);
		AI_Wait(other,0.5);
		AI_WaitTillEnd(self,other);
		B_Xardas_ClawReaction();
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//Будь осторожнее! И самое главное, не потеряй Коготь!
	}
	else if(C_SCHasBeliarsRune())
	{
		AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Я создал руну.
		B_Xardas_ClawReaction();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//У меня его больше нет...
		if(Saturas_KlaueInsMeer == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Я отдал его магам Воды, чтобы они утопили его в море...
			XardasKnowsAboutDestroyedClaw = TRUE;
		};
		B_Xardas_ClawIsLost();
	};
};


instance DIA_Xardas_WhereIsClaw(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 77;
	condition = DIA_Xardas_WhereIsClaw_Condition;
	information = DIA_Xardas_WhereIsClaw_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_WhereIsClaw_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_AddonSuccess) && (XardasKnowsAboutDestroyedClaw == FALSE) && (Saturas_KlaueInsMeer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereIsClaw_Info()
{
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Коготь Белиара?! Где он сейчас? Он у тебя с собой?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Я отдал его магам Воды, чтобы они утопили его в море...
	XardasKnowsAboutDestroyedClaw = TRUE;
	B_Xardas_ClawIsLost();
};


instance DIA_Xardas_WEAPON(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_WEAPON_Condition;
	information = DIA_Xardas_WEAPON_Info;
	permanent = FALSE;
	description = "Мне нужно оружие.";
};


func int DIA_Xardas_WEAPON_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Мне нужно оружие.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//Я могу дать тебе только то немногое, что у меня есть здесь.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Посмотри в моей башне. Ты можешь взять все, что покажется тебе полезным.
};


instance DIA_Xardas_ARTEFAKT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_ARTEFAKT_Condition;
	information = DIA_Xardas_ARTEFAKT_Info;
	permanent = FALSE;
	description = "А что такое этот 'Глаз Инноса'?";
};


func int DIA_Xardas_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//А что такое этот 'Глаз Инноса'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Это амулет. Легенды гласят, что сам Иннос вложил часть своей силы в этот амулет.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Он восстановит часть твоей потерянной силы и поможет нам победить драконов.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Также он обладает и другими скрытыми возможностями. Я расскажу тебе больше, когда этот амулет будет у тебя в руках.
};


instance DIA_Xardas_PALADIN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_PALADIN_Condition;
	information = DIA_Xardas_PALADIN_Info;
	permanent = FALSE;
	description = "А почему паладины должны отдать мне этот Глаз Инноса?";
};


func int DIA_Xardas_PALADIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//А почему паладины должны отдать мне этот Глаз Инноса?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Потому что ты тот, кому судьбой предназначено носить его.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//А откуда тебе это известно?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Есть несколько причин полагать это. Вот самая важная из них: ты победил Спящего. Если бы тебе не благоволили боги, ты бы давно уже был мертв.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Предположим, что ты прав, и мне действительно предначертано носить Глаз Инноса. А откуда паладины узнают, что это правда?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Глаз сам выбирает того, кто может носить его. Когда ты наденешь его, все сомнения паладинов рассеются.
};


instance DIA_Xardas_Khorinis(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 4;
	condition = DIA_Xardas_Khorinis_Condition;
	information = DIA_Xardas_Khorinis_Info;
	permanent = FALSE;
	description = "А как мне добраться до города?";
};


func int DIA_Xardas_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (PlayerEnteredCity == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//А как мне добраться до города?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Просто иди по тропинке, ведущей отсюда через горы. Город большой, ты его не пропустишь.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Но будь осторожен! Путь в город полон опасностей. А ты сейчас далеко не так силен, как был раньше.
};


instance DIA_Xardas_WhereEx(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 6;
	condition = DIA_Xardas_WhereEx_Condition;
	information = DIA_Xardas_WhereEx_Info;
	permanent = FALSE;
	description = "А где именно мы сейчас находимся?";
};


func int DIA_Xardas_WhereEx_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//А где именно мы сейчас находимся?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Как я уже сказал, неподалеку от города Хоринис.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Я отстроил мою башню здесь.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Но ведь прошло всего несколько дней с тех пор, как мы были в Долине Рудников...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Слуги, которых я вызвал для строительства моей башни, проделали потрясающую работу...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Да, похоже на это.
};


instance DIA_Xardas_EQUIPMENT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 7;
	condition = DIA_Xardas_EQUIPMENT_Condition;
	information = DIA_Xardas_EQUIPMENT_Info;
	permanent = FALSE;
	description = "А где я смогу найти снаряжение получше?";
};


func int DIA_Xardas_EQUIPMENT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_WEAPON) && Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//А где я смогу найти снаряжение получше?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Ближайшее место, где ты сможешь раздобыть приличное оружие и доспехи - город Хоринис.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Но внизу, в долине, ты сможешь найти целебные травы, которые помогут тебе, если ты будешь ранен в бою.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Видишь озеро справа от моей башни? Оттуда в долину ведет секретный проход.
};


instance DIA_Xardas_ABOUTLESTER(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_ABOUTLESTER_Condition;
	information = DIA_Xardas_ABOUTLESTER_Info;
	permanent = FALSE;
	description = "Ты уже поговорил с Лестером?";
};


func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if((Lester_SentToXardas == TRUE) && (Kapitel < 3))
	{
		if(!Npc_IsDead(Lester))
		{
			if(Npc_GetDistToWP(Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Ты уже поговорил с Лестером?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Да, я просто засыпал его вопросами. Он многое смог рассказать мне, но он полностью вымотан.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Это почти чудо, что ему удалось выжить. Я отправил его в постель.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Что он рассказал тебе?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Боюсь, что ничего хорошего. Он видел не только дракона, но еще и людей в черных плащах с капюшонами.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//И?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Если эти люди существуют, то их присутствие несет определенную угрозу.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//И мне это не нравится. Вот, возьми кольцо. Оно защитит тебя от магии.
	B_GiveInvItems(self,other,ItRi_Prot_Mage_03,1);
	B_GivePlayerXP(XP_AmbientKap2);
};


instance DIA_Xardas_FirstPal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = DIA_Xardas_FirstPal_Condition;
	information = DIA_Xardas_FirstPal_Info;
	permanent = TRUE;
	description = "Я был в городе...";
};


func int DIA_Xardas_FirstPal_Condition()
{
	if((PlayerEnteredCity == TRUE) && (Kapitel < 3) && (XardasKnowsAboutProof == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Я был в городе...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//И? Ты смог поговорить с предводителем паладинов?
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Меня к нему не пропустят...
		AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Чушь! Должен быть способ увидеться с ним.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Если все остальное не получится, вступи в монастырь.
			AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Это, возможно, сомнительная затея с точки зрения морали, но это даст тебе то, что тебе нужно.
		};
		AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Если ты будешь магом, ему придется встретиться с тобой.
	}
	else if(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		DIA_Common_Yes();
		if(Kapitel == 2)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Но он отправил меня в Долину Рудников, чтобы я добыл ему доказательства своих слов!
			AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Что еще за доказательство?
			AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Я должен доставить лорду Хагену доказательства существования драконов.
			AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Мы должны действовать согласно нашему плану. Другого пути нет.
			XardasKnowsAboutProof = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//Хорошо. Что он сказал?
			DIA_Common_NothingImportantYet();
			B_Xardas_SoLittleTime();
		};
	}
	else
	{
		DIA_Common_NoNotYet();
		B_Xardas_SoLittleTime();
	};
	if((LesterMovedToXardas == FALSE) && (Lester_SentToXardas == TRUE))
	{
		AI_Teleport(Lester,"NW_XARDAS_TOWER_IN1_14");
		B_StartOtherRoutine(Lester,"XARDAS");
		LesterMovedToXardas = TRUE;
		//сброс диалога, иначе DIA_Xardas_ABOUTLESTER становится доступным и ломает остальные опции
		AI_StopProcessInfos(self);
	};
};


instance DIA_Xardas_Weiter(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = DIA_Xardas_Weiter_Condition;
	information = DIA_Xardas_Weiter_Info;
	permanent = TRUE;
	description = "И что нам делать дальше?";
};


func int DIA_Xardas_Weiter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Weiter_Info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//И что нам делать дальше?
	if(XardasKnowsAboutProof == FALSE)
	{
		AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Мы должны действовать согласно нашему плану. Другого пути нет.
	};
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ты должен добыть Глаз Инноса, а я буду продолжать искать ответы.
};


instance DIA_Xardas_KdfSecret(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 9;
	condition = DIA_Xardas_KdfSecret_Condition;
	information = DIA_Xardas_KdfSecret_Info;
	permanent = FALSE;
	description = "Почему Круг Огня не должен знать о тебе?";
};


func int DIA_Xardas_KdfSecret_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && !Npc_KnowsInfo(other,DIA_Pyrokar_SPOKETOVATRAS))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Почему Круг Огня не должен знать о тебе?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Когда-то я был высшим членом Круга. Даже тогда я подозревал, что демоническая магия может быть ключом к этому магическому барьеру.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Но мне было ни за что не убедить остальных членов Круга последовать этому пути.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Поэтому я покинул Круг, чтобы изучать черную магию.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//Это преступление, которому в глазах магов Огня, (язвительно) 'Посвященных Инноса', всегда таких 'Добрых' и 'Добродетельных', никогда не будет оправдания.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Они уверены, что я все еще жив, но они понятия не имеют, где искать меня - и это хорошо.
};


instance DIA_Xardas_HelloKap3(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_HelloKap3_Condition;
	information = DIA_Xardas_HelloKap3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_HelloKap3_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_HelloKap3_Info()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_00");	//Наконец-то! Я много дней пытался вызвать тебя сюда.
};


instance DIA_Xardas_BACKFROMOW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 31;
	condition = DIA_Xardas_BACKFROMOW_Condition;
	information = DIA_Xardas_BACKFROMOW_Info;
	description = "Я вернулся из Долины Рудников.";
};


func int DIA_Xardas_BACKFROMOW_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Я вернулся из Долины Рудников.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Давно пора. И что ты там видел?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Ты был прав. Там все кишит врагами, даже яблоку упасть негде.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Орки осаждают замок, а драконы опустошают все вокруг.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Осталось недолго, прежде чем они нападут на Хоринис, если я не ошибаюсь.
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Xardas_DMTSINDDA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 32;
	condition = DIA_Xardas_DMTSINDDA_Condition;
	information = DIA_Xardas_DMTSINDDA_Info;
	description = "Что, черт возьми, произошло здесь?";
};


func int DIA_Xardas_DMTSINDDA_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Что, черт возьми, произошло здесь?
	if(Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Лестер сказал, что ты хотел видеть меня как можно быстрее.
	};
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Враг узнал, кем ты являешься на самом деле, и планирует завладеть Глазом Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Он распознал эту угрозу. Это заставило его выйти из тени и решиться на открытую атаку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Игра в прятки окончена. Вчера еще никто не знал, какова будет атака врага. Но теперь это становится слишком очевидно.
	B_LogEntry(TOPIC_INNOSEYE,"Врагу теперь известно, что я ищу Глаз Инноса. Мне нужно побыстрее найти его, пока еще не слишком поздно.");
	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	if((Lester_SentToXardas == TRUE) && !Npc_KnowsInfo(other,DIA_Xardas_ABOUTLESTER))
	{
		Info_AddChoice(DIA_Xardas_DMTSINDDA,"Ты уже поговорил с Лестером?",DIA_Xardas_ABOUTLESTER_Info);
	};
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Меня атаковали маги в черных мантиях.",DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Я, наконец, добыл доказательство, которое требовал от меня лорд Хаген.",DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Меня атаковали маги в черных мантиях.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//У врага много обличий. Ищущие - одно из них. Они те, кто подготавливает плацдарм для врага.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Они заняли позиции в стратегических местах, и теперь только ждут возможности захлопнуть ловушку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Держись от них подальше. Они сильные маги, и они попытаются во что бы то ни стало остановить тебя.
	if(hero.guild == GIL_KDF)
	{
		if(MIS_DementorsOrigins == FALSE)
		{
			Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
			MIS_DementorsOrigins = LOG_Running;
		};
		B_LogEntry(TOPIC_DEMENTOREN,"Ксардас знает, кто такие эти люди в черных рясах. Похоже, именно Ищущие заправляют всем во вражеских рядах, и они очень опасны.");
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Я, наконец, добыл доказательство, которое требовал от меня лорд Хаген.
	if(XardasKnowsAboutProof == FALSE)
	{
		AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Что еще за доказательство?
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Я получил письмо от Гаронда, предводителя паладинов в Долине Рудников. В нем он просит о подкреплении.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//Этого должно быть достаточно, чтобы убедить воинственного ветерана. Отлично.
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"И каков будет наш следующий шаг?",DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	XardasKnowsAboutProof = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//И каков будет наш следующий шаг?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Иди и отнеси лорду Хагену письмо от Гаронда, и добейся от него, чтобы он позволил тебе взять Глаз Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Затем иди в монастырь, и поговори с Пирокаром. Он должен дать тебе Глаз.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Сейчас нет ничего более важного, чем обеспечить безопасность этого артефакта.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Иди, пока еще не слишком поздно. Враг также попытается наложить на него свои лапы.
	B_LogEntry(TOPIC_INNOSEYE,"Глаз находится в монастыре магов Огня. Я надеюсь, что лорд Хаген предоставит мне доступ к нему, когда я принесу ему письмо от лорда Гаронда. Верховный маг Пирокар не позволит мне надеть этот амулет без одобрения Хагена.");
};


instance DIA_Xardas_INNOSEYEBROKEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 33;
	condition = DIA_Xardas_INNOSEYEBROKEN_Condition;
	information = DIA_Xardas_INNOSEYEBROKEN_Info;
	description = "Глаз Инноса был уничтожен.";
};


func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA) && (Npc_HasItems(other,ItMi_InnosEye_Broken_MIS) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Глаз Инноса был уничтожен.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Что ты говоришь? Уничтожен!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Я нашел его в северных лесах - к сожалению, мне удалось найти только фрагменты.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Это был наш единственный шанс противостоять этим драконам. И мы провалили его!
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN,"И что теперь?",DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//И что теперь?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//Это болезненный удар. Мы должны перестроиться. Я должен уединиться, и все взвесить.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//А тем временем, ты отправляйся в город и поговори с Ватрасом, магом Воды. Возможно, он знает, что нужно делать.
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас остался не очень доволен уничтожением Глаза Инноса. Маг Воды Ватрас в городе Хоринис, возможно, наша единственная надежда.");
	MIS_Xardas_GoToVatrasInnoseye = LOG_Running;
};


func void B_XardasGivesProofForPyrokar()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Пирокар отказывается принять участие в ритуале.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Сначала он хочет получить доказательства того, что он может доверять тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//Ах, неужели! Пирокар. Как интересно.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Этот старый чудак становится совершенно невыносимым. Но я думаю, у меня есть кое-что, что поможет тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Когда я покидал орден магов Огня, я взял с собой из монастыря несколько вещей.
	/*if(Npc_GetDistToWP(self,"NW_XARDAS_START") <= 2000)
	{
		AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_05");	//Now that I've built my tower so close to town, I have to be prepared. Someone could come here and look for them at anytime.
	};*/
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Я не хотел, чтобы паладины или маги Огня перевернули все в моей башне вверх дном, и нашли эти вещи.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Поэтому я спрятал их в надежном месте, где магам никогда не придет в голову искать их.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//И где же?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Некоторые из них лежат в запертом сундуке на ферме Секоба.
	Wld_AssignRoomToGuild("grpbauer01",GIL_NONE);
	Sekob_RoomFree = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Ты доверяешь этому Секобу?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Нет. Но его можно купить и он не будет задавать глупых вопросов. К тому же, этот сундук заперт. Вот ключ.
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Там, среди прочего, есть очень старая книга. Когда Пирокар увидит эту книгу, он поймет, что она от меня.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Она больше не нужна мне. Поэтому пусть она послужит хоть такой цели.
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас дал мне ключ от сундука на ферме Секоба. Я должен отнести книгу, находящуюся в нем, Пирокару.");
};

func void B_XardasGoesToRitual()
{
	if(Pyrokar_DeniesInnosEyeRitual == TRUE)
	{
		B_XardasGivesProofForPyrokar();
	};
	AI_StopProcessInfos(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
	};
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас согласился участвовать в ритуале в Круге Солнца.");
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	Xardas_GoesToRitualInnosEye = TRUE;
};

instance DIA_Xardas_RITUALREQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_RITUALREQUEST_Condition;
	information = DIA_Xardas_RITUALREQUEST_Info;
	description = "Ватрас отправил меня к тебе.";
};


func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && Npc_KnowsInfo(other,DIA_Xardas_INNOSEYEBROKEN) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Ватрас отправил меня к тебе.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//Хорошо. Что он сказал?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Он сказал что-то о ритуале обращения в Круге Солнца.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(смеется) Вот старый дьявол. Думаю, я знаю, что он затеял. Ты пришел, чтобы призвать меня к нему.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Похоже на то. Когда ты отправляешься?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (GuildlessMode == TRUE))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Не стоит заставлять Ватраса ждать. Я отправляюсь немедленно. А ты должен выполнить свою задачу, а затем присоединиться ко мне опять.
		B_GivePlayerXP(XP_AmbientKap3 * 2);
		B_XardasGoesToRitual();
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Я буду помогать в этом ритуале только когда буду уверен, что ты готов к встрече с драконами.
		B_LogEntry(TOPIC_INNOSEYE,"Ксардас считает, что я еще не готов к встрече с драконами.");
		B_GivePlayerXP(XP_AmbientKap3);
	};
};


instance DIA_Xardas_WARUMNICHTJETZT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_WARUMNICHTJETZT_Condition;
	information = DIA_Xardas_WARUMNICHTJETZT_Info;
	description = "Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?";
};


func int DIA_Xardas_WARUMNICHTJETZT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//Иногда я просто не понимаю тебя.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(раздраженно) Не смей говорить со мной в таком тоне. Если бы не я, твое ни на что не годное тело до сих пор бы гнило в этом храме.
	AI_Output(other,self,"Extro_Tempel_15_01");	//Ксардас! Что...
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Не волнуйся! Просто скажи, что мне нужно сделать.",DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Тогда, по крайней мере, объясни мне, почему ты колеблешься.",DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WARUMNICHTJETZT_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Тогда, по крайней мере, объясни мне, почему ты колеблешься.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//С тех пор, как я отошел от магов Огня, я старался держаться от них подальше.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//И я не собираюсь изменять этой привычке, если только у меня совсем уж не будет выбора.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Но прежде, чем я предстану перед укоризненным взором этих магов, я сначала хочу убедиться, что у тебя есть хоть какие-то шансы противостоять драконам.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//С твоим жалким снаряжением, впрочем, тебе далеко не продвинуться. Возвращайся, когда станешь достаточно силен.
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Не волнуйся! Просто скажи, что мне нужно сделать.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Ты все еще слишком слаб, чтобы сражаться с драконами. С этим снаряжением у тебя нет никаких шансов.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Не возвращайся ко мне, пока не будешь полностью готов. Вот тогда я пойду, и присоединюсь к Ватрасу.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BEREIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = DIA_Xardas_BEREIT_Condition;
	information = DIA_Xardas_BEREIT_Info;
	description = "Я готов к сражению с драконами.";
};


func int DIA_Xardas_BEREIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Я готов к сражению с драконами.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//Тогда не будем терять времени. Я немедленно отправлюсь к Кругу Солнца. А ты выполни свои задачи. Я встречу тебя там.
	B_GivePlayerXP(XP_AmbientKap3);
	B_XardasGoesToRitual();
};


instance DIA_Xardas_BINGESPANNT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 35;
	condition = DIA_Xardas_BINGESPANNT_Condition;
	information = DIA_Xardas_BINGESPANNT_Info;
	permanent = TRUE;
	description = "Этот ритуал обращения сработает?";
};


func int DIA_Xardas_BINGESPANNT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3) && (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Этот ритуал обращения сработает?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//Я не совсем уверен. Это зависит от того, что именно собирается сделать Ватрас.
};


instance DIA_Xardas_PYROWILLNICHT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 37;
	condition = DIA_Xardas_PYROWILLNICHT_Condition;
	information = DIA_Xardas_PYROWILLNICHT_Info;
	description = "Пирокар отказывается принять участие в ритуале.";
};


func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if((Pyrokar_DeniesInnosEyeRitual == TRUE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Kapitel == 3) && (Sekob_RoomFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNICHT_Info()
{
	B_XardasGivesProofForPyrokar();
};


instance DIA_Xardas_RitualInnosEyeRepairImportant(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information = DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important = TRUE;
};


func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Теперь, когда Глаз Инноса восстановлен, ты должен предстать перед драконами!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Все они служат Белиару, богу тьмы.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Но должна быть также земная сила, которая контролирует их. Теперь это стало очевидным для меня.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Найди источник этой силы.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//А как только ты выяснишь это, сразу же возвращайся ко мне!
	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant,Dialog_Ende,DIA_Xardas_RitualInnosEyeRepairImportant_weiter);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Vatras,"START");
};


instance DIA_Xardas_WASNUN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_WASNUN_Condition;
	information = DIA_Xardas_WASNUN_Info;
	permanent = TRUE;
	description = "Глаз Инноса восстановлен. Что дальше?";
};


func int DIA_Xardas_WASNUN_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Глаз Инноса восстановлен. Что дальше?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Не забудь надеть его, когда ты, наконец, предстанешь перед драконами.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Не теряй времени. Отправляйся в Долину Рудников и убей этих драконов.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Иди к Пирокару, и пусть он объяснит тебе, как пользоваться Глазом.
	};
};


instance DIA_Xardas_PERM4(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 40;
	condition = DIA_Xardas_PERM4_Condition;
	information = DIA_Xardas_PERM4_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_Xardas_PERM4_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA))
	{
		return TRUE;
	};
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Что нового?
	if(Kapitel == 3)
	{
		if(MIS_Ulthar_HeileSchreine_PAL == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_06");	//Приспешники Белиара оскверняют древнейшие алтари богов.
			AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_03");	//Именно это и произошло.
		}
		else
		{
			AI_Output(self,other,"OUTRO_Xardas_14_10");	//Даже боги не знают, какая судьба нас ждет...
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Ищущие еще не ушли. Они не остановятся, пока не прикончат тебя.
		AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Убей драконов в Долине Рудников и выясни, кто стоит за этими нападениями. В противном случае, их сила только вырастет еще больше.
	};
};

