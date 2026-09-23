
instance DIA_Liesel_EXIT(C_Info)
{
	npc = Follow_Sheep;
	nr = 999;
	condition = DIA_Common_EXIT_Condition;
	information = DIA_Common_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


instance DIA_Liesel_Hallo(C_Info)
{
	npc = Follow_Sheep;
	nr = 1;
	condition = DIA_Liesel_Hallo_Condition;
	information = DIA_Liesel_Hallo_Info;
	description = "Здравствуй, овечка.";
};


func int DIA_Liesel_Hallo_Condition()
{
	if(Liesel_Giveaway == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Liesel_Hallo_Info()
{
	AI_Output(other,self,"DIA_Liesel_Hallo_15_00");	//Здравствуй... (прочищает горло) овечка.
	B_LieselMaeh();
};


instance DIA_Liesel_KommMit(C_Info)
{
	npc = Follow_Sheep;
	nr = 1;
	condition = DIA_Liesel_KommMit_Condition;
	information = DIA_Liesel_KommMit_Info;
	permanent = TRUE;
	description = "Пойдем со мной!";
};


func int DIA_Liesel_KommMit_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,DIA_Liesel_Hallo) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Liesel_KommMit_Info()
{
	AI_Output(other,self,"DIA_Liesel_KommMit_15_00");	//Пойдем со мной!
	B_LieselMaeh();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_Liesel_WarteHier(C_Info)
{
	npc = Follow_Sheep;
	nr = 1;
	condition = DIA_Liesel_WarteHier_Condition;
	information = DIA_Liesel_WarteHier_Info;
	permanent = TRUE;
	description = "Подожди здесь!";
};


func int DIA_Liesel_WarteHier_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_KnowsInfo(other,DIA_Liesel_Hallo) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Liesel_WarteHier_Info()
{
	DIA_Common_WaitHere();
	B_LieselMaeh();
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

