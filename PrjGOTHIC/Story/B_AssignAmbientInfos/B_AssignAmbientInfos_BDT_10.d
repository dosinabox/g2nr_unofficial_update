
instance DIA_BDT_10_EXIT(C_Info)
{
	nr = 999;
	condition = dia_bdt_10_exit_condition;
	information = dia_bdt_10_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bdt_10_exit_condition()
{
	return TRUE;
};

func void dia_bdt_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_10_STANDARD(C_Info)
{
	nr = 2;
	condition = dia_bdt_10_standard_condition;
	information = dia_bdt_10_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_10_standard_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_bdt_10_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		B_Say(self,other,"$WHATSTHISSUPPOSEDTOBE");
	};
	if(randy == 1)
	{
		B_Say(self,other,"$GETOUTOFHERE");
	};
	if(randy == 2)
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_BDT_10(var C_Npc slf)
{
	dia_bdt_10_exit.npc = Hlp_GetInstanceID(slf);
	dia_bdt_10_standard.npc = Hlp_GetInstanceID(slf);
};

