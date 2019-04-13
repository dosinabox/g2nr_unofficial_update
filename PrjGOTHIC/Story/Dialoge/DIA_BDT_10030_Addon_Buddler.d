
instance DIA_Addon_BDT_10030_Buddler_EXIT(C_Info)
{
	npc = BDT_10030_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10030_Buddler_EXIT_Condition;
	information = DIA_Addon_10030_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10030_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10030_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10030_Buddler_Hi(C_Info)
{
	npc = BDT_10030_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10030_Buddler_Hi_Condition;
	information = DIA_Addon_10030_Buddler_Hi_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Addon_10030_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10030_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10030_Buddler_Hi_15_00");	//С тобой все в порядке?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_01");	//Рабы убирают большие глыбы с дороги.
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_02");	//(усмехается) А после мы соберем золотые яблоки.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_03");	//Вот теперь мы получим сладкое золото.
		AI_StopProcessInfos(self);
	};
};

