
instance DIA_Rick_EXIT(C_Info)
{
	npc = MIL_336_Rick;
	nr = 999;
	condition = DIA_Rick_EXIT_Condition;
	information = DIA_Rick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rick_HALLO(C_Info)
{
	npc = MIL_336_Rick;
	nr = 1;
	condition = DIA_Rick_HALLO_Condition;
	information = DIA_Rick_HALLO_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Rick_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rick_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rick_HALLO_15_00");	//Как дела?
	if(Hlp_IsValidNpc(Rumbold) && !Npc_IsDead(Rumbold) && (MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (ScaredRick == FALSE) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Rick_HALLO_10_01");	//Если тебе хочется поговорить, говори с Румболдом. Я здесь просто на случай, если кто-нибудь вздумает бунтовать.
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopProcessInfos(self);
};

