
instance DIA_Sld_820_EXIT(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 999;
	condition = DIA_Sld_820_EXIT_Condition;
	information = DIA_Sld_820_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_Halt(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_Halt_Condition;
	information = DIA_Sld_820_Halt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sld_820_Halt_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Sld_820_Halt_Info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//И куда ты идешь?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//В дом, конечно же.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Онар платит нам за то, чтобы мы не пускали в дом парней вроде тебя!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Здесь не место ополчению! Он именно так и сказал.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Я хочу поговорить с Ли!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Что тебе нужно от него?
	Info_ClearChoices(DIA_Sld_820_Halt);
	Info_AddChoice(DIA_Sld_820_Halt,"Он и я давние знакомые...",DIA_Sld_820_Halt_KenneLee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Sld_820_Halt,"Я хочу присоединиться к наемникам!",DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Ли в правом крыле. И даже не пытайся заглянуть куда-либо еще!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Ах, свежее пушечное мясо! Добро пожаловать.
	B_Sld_820_LeeIsRight();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Но только предупреждаю: оставь Онара в покое! Он очень не любит, когда с ним заговаривают посторонние. Особенно парни вроде тебя.
	AI_StopProcessInfos(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//Он и я давние знакомые...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//ТЫ приятель Ли? Я не верю в это! Но все равно, проходи, и если он не узнает тебя, тогда держись... (смеется)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_PERM(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_PERM_Condition;
	information = DIA_Sld_820_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Проходи, если хочешь, но не надо трепаться здесь.
	AI_StopProcessInfos(self);
};

