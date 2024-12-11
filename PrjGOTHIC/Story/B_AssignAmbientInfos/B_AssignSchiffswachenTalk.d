
func void B_AssignSchiffswachenGuard()
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Мы следим за тобой. Помни об этом.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Не создавай здесь проблем, хорошо?
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Даже не думай воровать здесь, понял?
		};
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,60);
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
		Npc_SetRefuseTalk(self,20);
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

func void B_AssignSchiffswachenInfos()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_GateOpen))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Эти проклятые орки штурмуют замок Гаронда. Мы должны действовать немедленно.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Если бы нам удалось найти этого предателя, что открыл главные ворота замка, мы бы ему показали!
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Мы не можем ждать дольше. Нашим парням в Долине Рудников нужна помощь, чтобы справиться со следующей волной орков.
		};
	}
	else
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Гаронд объявил всеобщую мобилизацию. Мы скоро отправляемся в Долину Рудников.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Оркам нужно преподнести урок.
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Я не могу дождаться, когда мы, наконец, покажем этим оркам. Ну ничего, скоро мы начнем теснить их.
		};
	};
	AI_StopProcessInfos(self);
};

func void B_AssignSchiffswachenTalk()
{
	if(Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos();
	}
	else
	{
		B_AssignSchiffswachenGuard();
	};
};

func int B_AssignSchiffswachenInfoConditions()
{
	if((Kapitel < 5) && !Npc_RefuseTalk(self) && (MIS_SCvisitShip != LOG_Running))
	{
		return TRUE;
	};
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

