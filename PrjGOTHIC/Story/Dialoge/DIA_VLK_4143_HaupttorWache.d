
instance DIA_Haupttorwache_EXIT(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 999;
	condition = DIA_Haupttorwache_EXIT_Condition;
	information = DIA_Haupttorwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_AUFGABE(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 4;
	condition = DIA_Haupttorwache_AUFGABE_Condition;
	information = DIA_Haupttorwache_AUFGABE_Info;
	permanent = TRUE;
	description = "Чем ты занимаешься здесь?";
};


func int DIA_Haupttorwache_AUFGABE_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//Чем ты занимаешься здесь?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//Моя задача проста. Я должен следить, чтобы орки не приближались ближе, чем на 30 футов к воротам.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//Если ты попытаешься поднять решетку, я подниму тревогу. Вот и все.
};


instance DIA_Haupttorwache_TOROEFFNEN(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 5;
	condition = DIA_Haupttorwache_TOROEFFNEN_Condition;
	information = DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent = TRUE;
	description = "Что нужно сделать, чтобы открыть главные ворота?";
};


func int DIA_Haupttorwache_TOROEFFNEN_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_TOROEFFNEN_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//Что нужно сделать, чтобы открыть главные ворота?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//Ради всего святого! Зачем тебе знать это?
	self.flags = 0;
	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"Я беспокоюсь о безопасности замка.",DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"Да я просто так спросил.",DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//Я беспокоюсь о безопасности замка.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//Я тоже, поверь мне.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//Я очень добросовестный стражник, и Гаронд даже доверил мне ключ от привратницкой.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(гордо) Это большая ответственность. Я буду бережно хранить его. Я поклялся в этом Гаронду.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//Да. Только представь, что кто-нибудь придет и поднимет рычаг, чтобы открыть ворота, а эту ржавую старую решетку вдруг заклинит.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Никто тогда не сможет закрыть эти ворота. Мне даже думать не хочется, что произойдет дальше. Хорошо, что никто не знает, что у меня есть ключ.
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//Да я просто так спросил.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//В следующий раз думай, что спрашиваешь. У тебя могут быть большие проблемы из-за этого. Сам знаешь, какие сейчас времена. А теперь уходи. Я занят.
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_PICKPOCKET(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 900;
	condition = DIA_Haupttorwache_PICKPOCKET_Condition;
	information = DIA_Haupttorwache_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть этот ключ легче легкого)";
};


func int DIA_Haupttorwache_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (Kapitel >= 5) && (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET,Dialog_Back,DIA_Haupttorwache_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Haupttorwache_PICKPOCKET_DoIt);
};

func void DIA_Haupttorwache_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self,other,itke_oc_maingate_mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Haupttorwache_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
};

