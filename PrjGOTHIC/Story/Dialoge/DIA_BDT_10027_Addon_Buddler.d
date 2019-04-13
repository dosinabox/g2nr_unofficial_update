
instance DIA_Addon_BDT_10027_Buddler_EXIT(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10027_Buddler_EXIT_Condition;
	information = DIA_Addon_10027_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10027_Buddler_Hi(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10027_Buddler_Hi_Condition;
	information = DIA_Addon_10027_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Как дела?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Я работаю на железных баронов уже очень долго. Хорошо, что теперь работают другие.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Черт. Теперь нам снова придется копать самим, да?
	};
};


instance DIA_Addon_10027_Buddler_Hacken(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 3;
	condition = DIA_Addon_10027_Buddler_Hacken_Condition;
	information = DIA_Addon_10027_Buddler_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_10027_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//Работай головой, парень. Добыча золота - чисто интеллектуальный процесс. Не пытайся победить камень - он сильнее тебя.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Освободи свой разум и попробуй стать единым с золотом. Это как медитация, как молитва.
	B_Upgrade_Hero_HackChance(10);
};

