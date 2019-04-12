
instance DIA_BridgeDementor_EXIT(C_Info)
{
	npc = DMT_1200_Dementor;
	nr = 999;
	condition = DIA_BridgeDementor_EXIT_Condition;
	information = DIA_BridgeDementor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BridgeDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BridgeDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
	B_Attack(self,other,AR_NONE,1);
	Snd_Play("MFX_FEAR_CAST");
};


instance DIA_BridgeDementor(C_Info)
{
	npc = DMT_1200_Dementor;
	nr = 1;
	condition = DIA_BridgeDementor_Condition;
	information = DIA_BridgeDementor_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BridgeDementor_Condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_BridgeDementor_Info()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_BridgeDementor_19_00");	//Мы знали, что ты придешь!
	AI_Output(self,other,"DIA_BridgeDementor_19_01");	//Мой Хозяин одержит победу и склонит весь мир к своим ногам.
	AI_Output(self,other,"DIA_BridgeDementor_19_02");	//Ты наивный идиот! Ты понятия не имеешь, на что ты замахнулся, и я накажу тебя за это здесь и сейчас!
	Npc_SetRefuseTalk(self,30);
};

