
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
	description = "„ем ты занимаешьс€ здесь?";
};


func int DIA_Haupttorwache_AUFGABE_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//„ем ты занимаешьс€ здесь?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//ћо€ задача проста. я должен следить, чтобы орки не приближались ближе, чем на 30 футов к воротам.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//≈сли ты попытаешьс€ подн€ть решетку, € подниму тревогу. ¬от и все.
};


instance DIA_Haupttorwache_TOROEFFNEN(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 5;
	condition = DIA_Haupttorwache_TOROEFFNEN_Condition;
	information = DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent = TRUE;
	description = "„то нужно сделать, чтобы открыть главные ворота?";
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
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//„то нужно сделать, чтобы открыть главные ворота?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//–ади всего св€того! «ачем тебе знать это?
	self.flags = 0;
	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"я беспокоюсь о безопасности замка.",DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"ƒа € просто так спросил.",DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//я беспокоюсь о безопасности замка.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//я тоже, поверь мне.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//я очень добросовестный стражник, и √аронд даже доверил мне ключ от привратницкой.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(гордо) Ёто больша€ ответственность. я буду бережно хранить его. я покл€лс€ в этом √аронду.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//ƒа. “олько представь, что кто-нибудь придет и поднимет рычаг, чтобы открыть ворота, а эту ржавую старую решетку вдруг заклинит.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Ќикто тогда не сможет закрыть эти ворота. ћне даже думать не хочетс€, что произойдет дальше. ’орошо, что никто не знает, что у мен€ есть ключ.
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//ƒа € просто так спросил.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//¬ следующий раз думай, что спрашиваешь. ” теб€ могут быть большие проблемы из-за этого. —ам знаешь, какие сейчас времена. ј теперь уходи. я зан€т.
	AI_StopProcessInfos(self);
};

