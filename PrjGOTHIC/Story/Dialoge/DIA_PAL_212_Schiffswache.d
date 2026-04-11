
instance DIA_PAL_212_Schiffswache_EXIT(C_Info)
{
	npc = PAL_212_Schiffswache;
	nr = 999;
	condition = DIA_Common_EXIT_Condition;
	information = DIA_Common_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


instance DIA_PAL_212_Schiffswache_WERSEIDIHR(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_PAL_212_Schiffswache_WERSEIDIHR_Condition;
	information = DIA_PAL_212_Schiffswache_WERSEIDIHR_Info;
	description = "Кто вы?";
};


func int DIA_PAL_212_Schiffswache_WERSEIDIHR_Condition()
{
	if((other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_PAL_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other,self,"DIA_PAL_212_Schiffswache_WERSEIDIHR_15_00");	//Кто вы?
	AI_Output(self,other,"DIA_PAL_212_Schiffswache_WERSEIDIHR_08_01");	//Мы эмиссары короля Робара и слуги Инноса. Также нас еще называют паладинами.
};


instance DIA_PAL_212_Schiffswache_WASMACHSTDU2(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_PAL_212_Schiffswache_WASMACHSTDU2_Condition;
	information = DIA_PAL_212_Schiffswache_WASMACHSTDU2_Info;
	description = "Что вы делаете здесь?";
};


func int DIA_PAL_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_PAL_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other,self,"DIA_PAL_212_Schiffswache_WASMACHSTDU2_15_00");	//Что вы делаете здесь?
	if(MIS_ShipIsFree == FALSE)
	{
		if((other.guild != GIL_PAL) && (other.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_PAL_212_Schiffswache_WASMACHSTDU2_08_01");	//Тебе не попасть на этот корабль. Это все, что тебе нужно знать.
		}
		else
		{
			AI_Output(self,other,"DIA_PAL_212_Schiffswache_WASMACHSTDU2_08_02");	//Мы стоим здесь на страже. Никто не может взойти на этот корабль. Ты в том числе. Извини.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_212_Schiffswache_WASMACHSTDU2_08_03");	//Из-за таких, как ты, мне приходится тратить мое время попусту. Я бы уж лучше отправился с нашими братьями в Долину Рудников.
	};
	AI_StopProcessInfos(self);
};

