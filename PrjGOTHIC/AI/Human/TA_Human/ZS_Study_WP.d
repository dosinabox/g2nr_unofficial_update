
func void ZS_Study_WP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Study_WP_loop()
{
	var int randy;
	var int Eventrandy;
	var int randystatetime;
	var int wait;
	var float waittime;
	randystatetime = randy + 25;
	randy = Hlp_Random(10);
	Eventrandy = Hlp_Random(100);
	wait = randy + 5;
	waittime = IntToFloat(wait);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	if(Npc_GetStateTime(self) >= randystatetime)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,hero);
		};
		AI_RemoveWeapon(self);
		if(randy <= 3)
		{
			if(randy == 0)
			{
				AI_PlayAni(self,"T_LGUARD_SCRATCH");
			}
			else if(randy == 1)
			{
				AI_PlayAni(self,"T_LGUARD_STRETCH");
			}
			else if(randy == 2)
			{
				AI_PlayAni(self,"T_LGUARD_CHANGELEG");
			};
		}
		else
		{
			AI_PlayAni(self,"T_LGUARD_2_STAND");
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
			if(Npc_HasItems(self,Fakescroll_Addon) == FALSE)
			{
				CreateInvItem(self,Fakescroll_Addon);
			};
			B_StopLookAt(self);
			AI_UseItemToState(self,Fakescroll_Addon,1);
			AI_Wait(self,waittime);
			AI_UseItemToState(self,Fakescroll_Addon,-1);
			Npc_SetStateTime(self,0);
			if((((Eventrandy < 5) && (CurrentLevel == NEWWORLD_ZEN)) || ((Eventrandy == 1) && (CurrentLevel == ADDONWORLD_ZEN))) && (self.guild == GIL_KDW) && (RavenIsDead == FALSE))
			{
				b_event_portal_earthquake();
			};
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Study_WP_end()
{
	Npc_RemoveInvItems(self,Fakescroll_Addon,Npc_HasItems(other,Fakescroll_Addon));
};

