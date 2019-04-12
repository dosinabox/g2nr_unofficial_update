
func void B_AssignDementorTalk_Ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Ты пришел слишком поздно.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Мы уничтожили Глаз Инноса, и теперь ему никогда не вернуть былую силу.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Теперь мы продемонстрируем всю тщетность твоих попыток бросить вызов Хозяину.
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry(TOPIC_INNOSEYE,"Эти жуткие ребята действуют мне на нервы. Они испортили Глаз Инноса. И теперь я не знаю, как мне починить его.");
		B_LogEntry(TOPIC_TraitorPedro,"Я нашел Глаз Инноса. Но что-то нигде не видно Педро. Эти черные маги в сговоре с ним.");
		B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Почувствуй нашу силу!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//За Хозяина!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Тебе нигде не скрыться.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Мы убьем тебя.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void B_AssignDementorTalk_Ritual_Exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_EnemyOverride] = FALSE;
};

