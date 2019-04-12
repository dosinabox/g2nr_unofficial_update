
instance DIA_Dragon_Rock_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Rock_Exit_Condition;
	information = DIA_Dragon_Rock_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Rock_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Но хватит болтать. Твоя временная сила иссякла. Глаз потерял свою силу. Приготовься умереть.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Rock_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Rock_Hello_Condition;
	information = DIA_Dragon_Rock_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Rock_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Rock_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Еще один самонадеянный человечишка осмелился взобраться на мою скалу. Вы, люди, такие жалкие. Такие мужественные и такие слабые.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Смотри-ка, действительно разговаривает.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Я вырву твои внутренности и скормлю их крысам.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Не так быстро. Со мной Глаз Инноса. Ты будешь повиноваться мне и отвечать на мои вопросы.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(ревет) Ах-х. Задавай свои вопросы.
};


instance DIA_Dragon_Rock_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Rock_WERBISTDU_Condition;
	information = DIA_Dragon_Rock_WERBISTDU_Info;
	description = "Кто ты?";
};


func int DIA_Dragon_Rock_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Меня зовут Педракан, и я медленно-медленно буду снимать с тебя шкуру, когда доберусь до тебя.
};


instance DIA_Dragon_Rock_HIERARCHIE(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Rock_HIERARCHIE_Condition;
	information = DIA_Dragon_Rock_HIERARCHIE_Info;
	description = "Кто самый сильный из вас, драконов?";
};


func int DIA_Dragon_Rock_HIERARCHIE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Кто самый сильный из вас, драконов?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Мы черпаем нашу силу из стихий этого мира. Иерархия очевидна и проста.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Земля, покрытая мягкой почвой, дарует жизнь всем созданиям, живущим под солнцем. Но она может раскрыться и поглотить тебя целиком, если ты подойдешь слишком близко.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Скала, которая скорее расколется, нежели поддастся, гордо возвышается над всем и похоронит беспечных под собой. А еще она дает лучшую защиту от прилива.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Искры жизни живут в глубоких огнях этого мира. А еще огонь обжигает все своим дыханием, не оставляя за собой ничего, кроме пепла.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Все эти стихии сохраняют и уничтожают. Но только в воде, которая стала твердой как скала, все превращается в вечную колонну из соли, где жизнь едва ли возможна.
};

func void B_AssignDragonTalk_Rock(var C_Npc slf)
{
	DIA_Dragon_Rock_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

