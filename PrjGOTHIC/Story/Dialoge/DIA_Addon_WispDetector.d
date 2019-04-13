
func void B_FollowMe_Wisp()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_FollowMe_Wisp_15_00");	//—ледуй за мной.
};


instance DIA_Addon_WispDetector_EXIT(C_Info)
{
	npc = Wisp_Detector;
	nr = 999;
	condition = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_DetectItems(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_DetectItems_Condition;
	information = DIA_Addon_WispDetector_DetectItems_Info;
	permanent = TRUE;
	description = "Ќачинай поиски!";
};


func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Ќачинай поиски!
	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"—ледуй за мной.",DIA_Addon_WispDetector_DetectItems_Follow);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи руны и свитки.",DIA_Addon_WispDetector_DetectItems_RUNE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи золото, ключи и прочую утварь.",DIA_Addon_WispDetector_DetectItems_NONE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи оружие дальнего бо€ и боеприпасы.",DIA_Addon_WispDetector_DetectItems_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи оружие ближнего бо€.",DIA_Addon_WispDetector_DetectItems_NF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи еду и растени€.",DIA_Addon_WispDetector_DetectItems_FOOD);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи кольца и амулеты.",DIA_Addon_WispDetector_DetectItems_MAGIC);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи любые зель€.",DIA_Addon_WispDetector_DetectItems_POTIONS);
	};
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"»щи все, что можешь найти!",DIA_Addon_WispDetector_DetectItems_ALL);
};

func void DIA_Addon_WispDetector_DetectItems_Follow()
{
	B_FollowMe_Wisp();
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
	WispSearching = WispSearch_Follow;
};

func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//»щи все, что можешь найти!
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//»щи любые зель€.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//»щи кольца и амулеты.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//»щи еду и растени€.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//»щи оружие ближнего бо€.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//»щи оружие дальнего бо€ и боеприпасы.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//»щи золото, ключи и прочую утварь.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//»щи руны и свитки.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_Follow(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_Follow_Condition;
	information = DIA_Addon_WispDetector_Follow_Info;
	permanent = TRUE;
	description = "—ледуй за мной.";
};


func int DIA_Addon_WispDetector_Follow_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_Follow_Info()
{
	B_FollowMe_Wisp();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

