
func void ZS_Stand_WP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_WP_Loop()
{
	var int random;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(self.guild != GIL_FRIENDLY_ORC)
		{
			AI_PlayAni(self,"T_STAND_2_LGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(10);
		if(random == 0)
		{
			if(self.guild == GIL_FRIENDLY_ORC)
			{
				AI_PlayAni(self,"R_ROAM1");
			}
			else
			{
				AI_PlayAni(self,"T_LGUARD_SCRATCH");
			};
		}
		else if(random == 1)
		{
			if(self.guild == GIL_FRIENDLY_ORC)
			{
				AI_PlayAni(self,"R_ROAM2");
			}
			else
			{
				AI_PlayAni(self,"T_LGUARD_STRETCH");
			};
		}
		else if(random == 2)
		{
			if(self.guild == GIL_FRIENDLY_ORC)
			{
				AI_PlayAni(self,"R_ROAM3");
			}
			else
			{
				AI_PlayAni(self,"T_LGUARD_CHANGELEG");
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_End()
{
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

