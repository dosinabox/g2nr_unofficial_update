
instance DIA_Pedro_DI_EXIT(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 999;
	condition = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_DI_YOU(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 2;
	condition = DIA_Pedro_DI_YOU_Condition;
	information = DIA_Pedro_DI_YOU_Info;
	description = "Предатель!";
};


func int DIA_Pedro_DI_YOU_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Предатель! Наконец-то я нашел тебя.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Ты можешь не надеяться, что я пощажу тебя, потому что я паладин.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Многие из нас, наемников, продали свою душу Белиару, и зачастую я чувствую вину, когда убиваю их. Но для тебя, подлая свинья, я сделаю исключение!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Из всех бездушных ублюдков, что я встречал в своей жизни, ты худший. Ты позор для нашего ордена.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Я должен убить тебя на месте.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//Подожди. Умоляю. На меня наложили заклинание. Я никогда бы не предал монастырь по своей воле.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Ты не представляешь, через что я прошел за последние несколько дней. Они поместили этот голос в мою голову. Я не смог защититься от него.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Полковник орков допрашивал меня несколько дней. Он постоянно бил меня. Пощади. Я не виновен. Ты должен поверить мне.
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Рассказывай, что ты знаешь.",DIA_Pedro_DI_YOU_verschon);
	Info_AddChoice(DIA_Pedro_DI_YOU,"И слышать ничего не хочу. Я убью тебя.",DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Назови хотя бы одну причину, по которой я должен поверить тебе.",DIA_Pedro_DI_YOU_grund);
	if(MIS_Gorax_KillPedro == LOG_Running)
	{
		Info_AddChoice(DIA_Pedro_DI_YOU,"Серпентес дал мне приказ убить тебя.",DIA_Pedro_DI_YOU_Serpentes);
	};
};

func void DIA_Pedro_DI_YOU_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Назови хотя бы одну причину, по которой я должен поверить тебе.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(умоляюще) Оставь меня в живых. Я могу рассказать кое-что, что поможет тебе выбраться отсюда. Ты должен выслушать меня.
};


var int PedroDI_Flee;

func void DIA_Pedro_DI_YOU_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//И слышать ничего не хочу. Я убью тебя.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//Умоляю всеми богами...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	B_Attack(self,other,AR_NONE,1);
	PedroDI_Flee = LOG_Running;
};

func void DIA_Pedro_DI_YOU_Serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Серпентес дал мне приказ убить тебя. Это вопрос принципа. И я сделаю то, что мне приказано.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(умоляюще) Пожалуйста, нет. Ты не можешь сделать это. Я могу очень пригодиться тебе. Ты увидишь это.
	B_GivePlayerXP(XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;
};

func void DIA_Pedro_DI_YOU_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Рассказывай, что ты знаешь.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//(облегченно) Да, конечно. Я расскажу тебе все, что ты хочешь знать. Но при одном условии. Ты должен забрать меня с этого проклятого острова, слышишь?
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU,"И слышать ничего не хочу. Я убью тебя.",DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Хорошо. Иди за мной, я отведу тебя на корабль.",DIA_Pedro_DI_YOU_FollowShip);
};


var int MIS_Pedro_DI_FollowShip;

func void DIA_Pedro_DI_YOU_FollowShip()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//Хорошо. Иди за мной, я отведу тебя на корабль.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Спасибо. Ты не пожалеешь об этом.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_Running;
};


instance DIA_Pedro_DI_ArrivedAtShip(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 4;
	condition = DIA_Pedro_DI_ArrivedAtShip_Condition;
	information = DIA_Pedro_DI_ArrivedAtShip_Info;
	description = "Пришли!";
};


func int DIA_Pedro_DI_ArrivedAtShip_Condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_Pedro_DI_FollowShip == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Пришли!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//Потрясающий корабль у тебя. Ты настоящий генерал.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Хватит болтать. Рассказывай, что я должен узнать?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Да, конечно. С чего мне начать?
	Info_ClearChoices(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Я услышал достаточно.",DIA_Pedro_DI_ArrivedAtShip_Back);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Как мне попасть внутрь этого острова?",DIA_Pedro_DI_ArrivedAtShip_Innere);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"А какие еще монстры населяют этот остров?",DIA_Pedro_DI_ArrivedAtShip_Monster);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Что там насчет этого полковника орков?",DIA_Pedro_DI_ArrivedAtShip_OrkOberst);
};

func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Что там насчет этого полковника орков?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Он отнял у меня последний лучик надежды когда-либо увидеть мою родную землю.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//С тех пор, как я прибыл сюда, он допрашивал меня о стратегическом размещении паладинов на Хоринисе.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Конечно, я не мог рассказать ему много. Откуда мне знать об этом, черт возьми? Я послушник Огня.
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	{
		Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Полковник орков мертв.",DIA_Pedro_DI_ArrivedAtShip_OberstTot);
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//А какие еще монстры населяют этот остров?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//Днем можно часто увидеть людей-ящеров, идущих к берегу. Обычно они несут с собой очень большие яйца.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Мне было плохо видно из моей камеры, но я думаю, они готовятся покинуть остров.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Как мне попасть внутрь этого острова?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//В тронном зале полковника орков есть секретный проход.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Меня тащили через него каждый раз, когда хотели допросить. Я видел, как он работает.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Один из шаманов запускал механизм, поворачивая факелы, висящие на стенах этого холла.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//М-м-м. Мне кажется, он сначала поворачивал левый факел, а затем правый, но я точно не помню.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//И тогда внезапно открывался секретный проход, ведущий глубоко в горы.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Где кончается этот проход, я не знаю.
};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Полковник орков мертв.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Мертв? Хвала Инносу. Я никогда не забуду его ужасное лицо.
};

func void DIA_Pedro_DI_ArrivedAtShip_Back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Я услышал достаточно. Иди, найди себе место на моем корабле. А мне еще кое-что нужно сделать.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Да пребудет с тобой сила Инноса. Я буду молиться за тебя.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Pedro_DI_PERM(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 5;
	condition = DIA_Pedro_DI_PERM_Condition;
	information = DIA_Pedro_DI_PERM_Info;
	permanent = TRUE;
	description = "Устал?";
};


var int PedroDI_TalkNomore;

func int DIA_Pedro_DI_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU) && (PedroDI_TalkNomore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_PERM_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Устал?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PedroDI_Flee == LOG_Running)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Хочешь, я принесу тебе подушку?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Пощади меня, пожалуйста. Я буду сидеть здесь очень тихо и не издам ни звука.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//М-м-м.
			B_GivePlayerXP(XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if(Npc_IsDead(Dragon_Undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Я полностью измотан.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Поспи немного. Скоро мы опять выйдем в море.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Спасибо. Я уже чуть не падаю. Спокойной ночи.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//Все в порядке. Спасибо.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//Пожалуйста, не убивай меня!
		AI_StopProcessInfos(self);
	};
};

