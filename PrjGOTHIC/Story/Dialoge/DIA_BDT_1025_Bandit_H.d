
instance DIA_NAME_BANDIT_EXIT(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 999;
	condition = DIA_NAME_BANDIT_EXIT_Condition;
	information = DIA_NAME_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NAME_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_EXIT_Info()
{
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};


instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition;
	information = DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info;
	important = TRUE;
};


func int DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00");	//Эй ты, кретин! Ты пришел сюда случайно не за овцой, а?
	if(MIS_Akil_SchafDiebe == 0)
	{
		AI_Output(other,self,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01");	//Овцой? Какой овцой?
		AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02");	//Это хорошо. А теперь проваливай. Здесь тебе нечего делать.
	};
};


instance DIA_NAME_BANDIT_SchafKlau(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_SchafKlau_Condition;
	information = DIA_NAME_BANDIT_SchafKlau_Info;
	important = TRUE;
};


func int DIA_NAME_BANDIT_SchafKlau_Condition()
{
	if(Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01") < (hero.aivar[AIV_LastDistToWP] - 50))
	{
		return TRUE;
	};
};

func void DIA_NAME_BANDIT_SchafKlau_Info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SchafKlau_09_00");	//Эй! Я с тобой говорю.
	Info_AddChoice(DIA_NAME_BANDIT_SchafKlau,Dialog_Ende,DIA_NAME_BANDIT_SchafKlau_weiter);
};

func void DIA_NAME_BANDIT_SchafKlau_weiter()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition;
	information = DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info;
	permanent = TRUE;
	description = "Вы украли овцу у фермера Акила.";
};


func int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition()
{
	if((MIS_Akil_SchafDiebe == LOG_Running) && (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm == FALSE))
	{
		return TRUE;
	};
};


var int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm;

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00");	//Вы украли овцу у фермера Акила.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01");	//И что? Что ты будешь делать?
	Info_ClearChoices(dia_name_bandit_rueckdasschafraus);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"Ничего. И зачем мне эта тупая овца?",DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"Отдай мне эту овцу, или в глаз получишь.",DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf);
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00");	//Отдай мне эту овцу, или в глаз получишь.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01");	//Тогда берегись, приятель. Сейчас тебе придется несладко.
	AI_StopProcessInfos(self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00");	//Ничего. И зачем мне эта тупая овца?
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01");	//Тогда не играй меня на нервах. Проваливай!
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};

