
instance DIA_PAL_263_EXIT(C_Info)
{
	npc = PAL_263_Wache;
	nr = 999;
	condition = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_Condition;
	information = DIA_PAL_263_PERM_Info;
	permanent = TRUE;
	description = "Докладывай, солдат!";
};


func int DIA_PAL_263_PERM_Condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Докладывай, солдат!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Есть, сэр! Удерживаю позицию, как приказано. Потери минимальны. Провизия кончается, орки спокойны.
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Последняя атака дракона полностью уничтожила внешнюю стену. Но с тех пор не происходило ничего необычного.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//Хорошо, держись.
};


instance DIA_PAL_263_PERM_OTH(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_OTH_Condition;
	information = DIA_PAL_263_PERM_OTH_Info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int DIA_PAL_263_PERM_OTH_Condition()
{
	if((hero.guild != GIL_MIL) || (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_OTH_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//Мы держим ситуацию под контролем. Тебе не о чем беспокоиться, гражданский. Все будет хорошо.
};

