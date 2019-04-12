
instance DIA_GERNOD_EXIT(C_Info)
{
	npc = VLK_466_Gernod;
	nr = 999;
	condition = dia_gernod_exit_condition;
	information = dia_gernod_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gernod_exit_condition()
{
	return FALSE;
};

func void dia_gernod_exit_info()
{
	AI_StopProcessInfos(self);
};

