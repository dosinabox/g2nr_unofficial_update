
var int AntiPaladinTalkcount;

func void B_AssignORC_AntiPaladinTalk(var C_Npc Antipaladin)
{
	if(AntiPaladinTalkcount == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//КХРОКГНАР! Мы убивать тебя, паладин.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//Хаген и его люди будут уничтожены. Даже ты не смочь помочь им.
		B_GivePlayerXP(XP_Ambient);
	}
	else if(AntiPaladinTalkcount == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//КХРОКГНАР! Хозяин говорить ты паладин теперь! Хозяин прав. Хозяин всегда прав.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//Мы, предводители гордой армии орков, теперь сами прийти убивать великий паладин.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//Мы, предводители орков, теперь сами идти убивать тебя, паладин.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Хозяин говорить предводителям орков, принесите голову великого паладина. Ты умирать от моей руки. КХРОКГНАР!
	};
	AntiPaladinTalkcount += 1;
	TalkedTo_AntiPaladin = TRUE;
	AI_StopProcessInfos(Antipaladin);
	Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
	Npc_SetRefuseTalk(Antipaladin,20);
};

