
func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//�� ������ �� �����. ����� �� ����.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//�� �������� ����� �������, ������?
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//���� �� ����� �������� �����, �����?
		};
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(Schiffswache,60);
		Npc_SetRefuseTalk(PAL_220_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_221_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_222_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_223_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_224_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_225_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_226_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_227_Schiffswache,60);
		Npc_SetRefuseTalk(PAL_228_Schiffswache,60);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(PAL_220_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_221_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_222_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_223_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_224_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_225_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_226_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_227_Schiffswache,20);
		Npc_SetRefuseTalk(PAL_228_Schiffswache,20);
	};
};

func void B_AssignSchiffswachenInfos(var C_Npc Schiffswache)
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_GateOpen))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//��� ��������� ���� �������� ����� �������. �� ������ ����������� ����������.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//���� �� ��� ������� ����� ����� ���������, ��� ������ ������� ������ �����, �� �� ��� ��������!
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//�� �� ����� ����� ������. ����� ������ � ������ �������� ����� ������, ����� ���������� �� ��������� ������ �����.
		};
	}
	else
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//������ ������� �������� �����������. �� ����� ������������ � ������ ��������.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//����� ����� ����������� ����.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//� �� ���� ���������, ����� ��, �������, ������� ���� �����. �� ������, ����� �� ������ ������� ��.
		};
	};
	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if(Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos(Schiffswache);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if((Kapitel < 5) && !Npc_RefuseTalk(self) && (MIS_SCvisitShip != LOG_Running))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

