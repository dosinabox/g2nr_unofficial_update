
func void B_AssignDementorTalk_Ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_DementorToldInnosEyeIsBroken == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//�� ������ ������� ������.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//�� ���������� ���� ������, � ������ ��� ������� �� ������� ����� ����.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//������ �� ���������������� ��� ��������� ����� ������� ������� ����� �������.
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		MIS_DementorToldInnosEyeIsBroken = TRUE;
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//���������� ���� ����!
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//�� �������!
		}
		else if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//���� ����� �� ��������.
		}
		else
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//�� ����� ����.
		};
	};
	Npc_SetRefuseTalk(self,30);
	if(DementorsDialogeAutoEndDisabled == FALSE)
	{
		AI_StartState(self,B_AssignDementorTalk_Ritual_Exit,1,"");
	};
};

func void B_AssignDementorTalk_Ritual_Exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_EnemyOverride] = FALSE;
};

