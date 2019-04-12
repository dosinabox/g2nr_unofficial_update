
instance DIA_Dragon_Fire_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Fire_Exit_Condition;
	information = DIA_Dragon_Fire_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Глаз потерял свою силу, и тебе не дожить до следующей зари.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};


instance DIA_Dragon_Fire_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Fire_Hello_Condition;
	information = DIA_Dragon_Fire_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Fire_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Fire_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Поверить не могу, что еще находятся люди, готовые отдать свою жизнь за то, чтобы просто увидеть живого дракона.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Ты довольно чисто говоришь для такого громоздкого монстра.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Я пришел не затем, чтобы увидеть тебя. Боюсь, цели мои несколько более радикальны.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Ты хочешь сказать, что готов вызвать меня на бой?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ха-ха-ха. Я сломаю твою хлипкую шею.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Не так быстро, дружок. Со мной Глаз Инноса. Ты не можешь сопротивляться моей воле. Отвечай на мои вопросы, иначе тебя ждет невыносимая агония.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(ревет) Ах-х. Тогда задавай свои глупые вопросы, пока еще можешь. Твоя сила долго не продлится.
};


instance DIA_Dragon_Fire_WerBistDu(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_WerBistDu_Condition;
	information = DIA_Dragon_Fire_WerBistDu_Info;
	description = "Кто ты?";
};


func int DIA_Dragon_Fire_WerBistDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Меня зовут Феоматар, и это все, что ты узнаешь обо мне.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Когда меня отпустят чары Глаза, ты сгоришь в огне.
};


instance DIA_Dragon_Fire_HORT(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_HORT_Condition;
	information = DIA_Dragon_Fire_HORT_Info;
	description = "Где твоя сокровищница?";
};


func int DIA_Dragon_Fire_HORT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_HORT_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//У каждого дракона есть сокровищница, где он хранит свои сокровища. А где твоя сокровищница?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//В месте, которое будет недоступно для тебя, когда я освобожусь от уз Глаза.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Я храню свои сокровища высоко в этих горячих утесах, куда практически невозможно добраться такому бескрылому созданию вроде тебя.
};

func void B_AssignDragonTalk_Fire(var C_Npc slf)
{
	DIA_Dragon_Fire_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

