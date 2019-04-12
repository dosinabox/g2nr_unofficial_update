
instance DIA_Pal_212_Schiffswache_EXIT(C_Info)
{
	npc = PAL_212_Schiffswache;
	nr = 999;
	condition = DIA_Pal_212_Schiffswache_EXIT_Condition;
	information = DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pal_212_Schiffswache_WERSEIDIHR(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information = DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;
	description = "Кто ты?";
};


func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Кто вы?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Мы эмиссары короля Робара и слуги Инноса. Также нас еще называют паладинами.
};


instance DIA_Pal_212_Schiffswache_WASMACHSTDU2(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Что вы делаете здесь?
	if(MIS_ShipIsFree == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Тебе не попасть на этот корабль. Это все, что тебе нужно знать.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Мы стоим здесь на страже. Никто не может взойти на этот корабль. Ты в том числе. Извини.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Из-за таких, как ты, мне приходится тратить мое время попусту. Я бы уж лучше отправился с нашими братьями в Долину Рудников.
	};
	AI_StopProcessInfos(self);
};

