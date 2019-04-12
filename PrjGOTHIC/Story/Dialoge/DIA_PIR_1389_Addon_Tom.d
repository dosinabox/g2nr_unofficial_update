
instance DIA_ADDON_PIR_1389_TOM_EXIT(C_Info)
{
	npc = PIR_1389_Addon_Tom;
	nr = 999;
	condition = dia_addon_pir_tom_exit_condition;
	information = dia_addon_pir_tom_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_pir_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_pir_tom_exit_info()
{
	AI_StopProcessInfos(self);
};

