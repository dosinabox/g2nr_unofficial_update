
instance DIA_BDT_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BDT_4_EXIT_Condition;
	information = DIA_BDT_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_4_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_BDT_4_STANDARD_Condition;
	information = DIA_BDT_4_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_4_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_4_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		B_Say(self,other,"$WHATSTHISSUPPOSEDTOBE");
	}
	else if(randy == 1)
	{
		B_Say(self,other,"$GETOUTOFHERE");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_BDT_4(var C_Npc slf)
{
	DIA_BDT_4_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BDT_4_STANDARD.npc = Hlp_GetInstanceID(slf);
};

