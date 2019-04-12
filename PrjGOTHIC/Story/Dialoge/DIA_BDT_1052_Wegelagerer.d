
instance DIA_1052_Wegelagerer_EXIT(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 999;
	condition = DIA_1052_Wegelagerer_EXIT_Condition;
	information = DIA_1052_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1052_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1052_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1052_Wegelagerer_Hello(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 1;
	condition = DIA_1052_Wegelagerer_Hello_Condition;
	information = DIA_1052_Wegelagerer_Hello_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_1052_Wegelagerer_Hello_Condition()
{
	var C_Npc Pal;
	Pal = Hlp_GetNpc(BDT_1051_Wegelagerer);
	if(C_NpcIsDown(Pal) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_1052_Wegelagerer_Hello_Info()
{
	AI_Output(other,self,"DIA_1052_Wegelagerer_Hello_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_01");	//Что это? Допрос?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_02");	//Мне нечего сказать тебе, но ты, возможно, захочешь поговорить с моим приятелем.
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_03");	//Но будь осторожен, он не любит чужаков.
};


instance DIA_Wegelagerer_ANGRIFF2(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 2;
	condition = DIA_Wegelagerer_ANGRIFF2_Condition;
	information = DIA_Wegelagerer_ANGRIFF2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Wegelagerer_ANGRIFF2_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && C_NpcIsDown(BDT_1051_Wegelagerer))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_ANGRIFF2_Info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF2_06_00");	//Ладно, приятель. Сейчас ты получишь.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1051_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE;
};

