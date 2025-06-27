
instance DIA_Dragon_Swamp_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Swamp_Exit_Condition;
	information = DIA_Dragon_Swamp_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Swamp_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Сила Глаза иссякла. Твоя жизнь закончится здесь, человек.
	B_EndDragonTalk();
	if((DJG_SwampParty_GoGoGo == TRUE) && (DJG_SwampParty == TRUE))
	{
		if(!Npc_IsDead(DJG_Cipher))
		{
			B_StartOtherRoutine(DJG_Rod,"SWAMPDRAGON");
			B_StartOtherRoutine(DJG_Cipher,"SWAMPDRAGON");
		};
	};
};


instance DIA_Dragon_Swamp_Hello(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Swamp_Hello_Condition;
	information = DIA_Dragon_Swamp_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Swamp_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Горе тебе, если ты сделаешь еще один шаг вперед!
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ах. Глаз Инноса, похоже, работает.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//Многие из вас приходили сюда. Я смел их всех.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Хватит болтать. Твои громкие слова не пугают меня, вонючее порождение болота.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Скажи мне то, что я хочу знать, или я утоплю тебя в твоей же крови.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ха-ха! Ты смеешь угрожать мне, жалкий червь? Назови хотя бы одну причину, почему мне не разорвать тебя на мелкие клочки прямо сейчас.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Я посланник Инноса, и со мной его Глаз. У тебя нет выбора. Ты должен подчиниться моей воле, или ты будешь уничтожен.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(ревет) Ах-х. Говори, что тебе нужно от меня.
};


instance DIA_Dragon_Swamp_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Swamp_WERBISTDU_Condition;
	information = DIA_Dragon_Swamp_WERBISTDU_Info;
	description = "Кто ты?";
};


func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Меня зовут Пандродор. И лучше всего тебе побыстрее уползти обратно под камень, из которого ты выполз.
};


instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description = "Где мне найти остальных из вас, омерзительных созданий?";
};


func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Где мне найти остальных из вас, омерзительных созданий?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Стихии, из которых состоит все, поддерживают целостность этого мира.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Каждая из них отвечает за свою часть мира.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Ищи стихии и ты найдешь остальных.
};

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

