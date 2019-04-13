
instance DIA_AmbientDementor_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_AmbientDementor_EXIT_Condition;
	information = DIA_AmbientDementor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AmbientDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	B_SCIsObsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	}
	else
	{
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
	};
};


instance DIA_AmbientDementor(C_Info)
{
	nr = 1;
	condition = DIA_AmbientDementor_Condition;
	information = DIA_AmbientDementor_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_AmbientDementor_Condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_AmbientDementor_Info()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random(4);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//Ты пришел расстроить наш ритуал? Его душа принадлежит нам. Тебе не спасти его, маг.
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//(смеется) Ты пришел, чтобы бросить вызов мне и моей работе? Ты обречен на поражение.
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//Никому еще не удавалось пройти мой склеп. Поворачивай назад. Тебе никогда не добраться до священных Чертогов Ирдората.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//Ты уже зашел слишком далеко, презренный червь. Тебе никогда не добраться до внутреннего святилища.
			};
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//Стой, где стоишь. Ни шагу дальше!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//Да, тебе удалось добраться сюда, но мимо меня тебе не пройти.
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//Ты пришел, чтоб бросить вызов Хозяину, но сначала тебе придется пройти мимо меня.
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//Жалкий маг, тебе никогда не сравниться с силой Хозяина.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//Ты выбрал путь магии, чтобы противостоять нам. Умный ход. Но даже это тебе не поможет.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//Даже будучи магом, тебе не остановить нас.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//Мой Хозяин раздавит тебя. Твоя жалкая магия не спасет тебя.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//Сдайся на нашу милость, пока еще можешь. Тебе отсюда не уйти.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//Теперь ты познаешь силу Хозяина. Тебе не уйти от него.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//Хозяин хочет получить твою голову. Ничто не спасет тебя теперь.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//Мы поймали тебя в ловушку, и теперь уничтожим тебя.
		};
	};
};

func void B_AssignDementorTalk(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) && (slf.npcType == NPCTYPE_AMBIENT))
	{
		DIA_AmbientDementor_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc = Hlp_GetInstanceID(slf);
	};
};

