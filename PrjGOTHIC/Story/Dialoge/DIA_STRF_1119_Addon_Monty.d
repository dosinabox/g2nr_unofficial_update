
instance DIA_Addon_Monty_EXIT(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 999;
	condition = DIA_Addon_Monty_EXIT_Condition;
	information = DIA_Addon_Monty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Monty_einmal;

instance DIA_Addon_Monty_Hi(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hi_Condition;
	information = DIA_Addon_Monty_Hi_Info;
	permanent = FALSE;
	description = "Как идут дела?";
};


func int DIA_Addon_Monty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_Hi_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Addon_Monty_Hi_08_01");	//Я жив - и это все, что имеет для меня значение.
	if(Monty_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Monty_Hi_08_02");	//Если ты хочешь что-либо обсудить, тебе нужен Патрик.
		Monty_einmal = TRUE;
	};
};


instance DIA_Addon_Monty_Hacken(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hacken_Condition;
	information = DIA_Addon_Monty_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Monty_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_00");	//Для эффективной работы очень важен угол удара.
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_01");	//Угол должен быть не слишком тупым и не слишком острым. Тогда ты добудешь самородки и не выронишь кирку.
	B_Upgrade_Hero_HackChance(5);
};

