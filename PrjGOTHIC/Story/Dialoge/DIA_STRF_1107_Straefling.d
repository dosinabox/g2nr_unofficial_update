
instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Руки прочь от моих горшков! Никому не позволено притрагиваться к моим горшкам, понятно?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Я отвечаю за пищу, и это означает, что никто другой не лезет в мои дела! Надеюсь, я понятно выражаюсь!
};


instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "Кто назначил тебя поваром?";
};


func int DIA_STRF_1107_COOK_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Кто назначил тебя поваром?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Командующий Гаронд. До того, как я стал заключенным, я был поваром в 'Яростном Кабане'.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//И за что тебя посадили?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Ну, между одним из посетителей, дровосеком, и мной произошло недоразумение.
};


instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};


func int DIA_STRF_1107_PERM_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_PERM_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Если ты хочешь узнать новости, спроси у рыцарей. А я всего лишь простой повар-заключенный.
};

