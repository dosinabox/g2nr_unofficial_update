
func void ZS_Circle()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int ZS_Circle_Loop()
{
	var int random;
	if(self.guild == GIL_DMT)
	{
		random = Hlp_Random(3000);
		if(Npc_GetStateTime(self) > random)
		{
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
		};
	}
	else if(self.guild == GIL_KDW)
	{
		random = Hlp_Random(2500);
		if(Npc_GetStateTime(self) > random)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			Wld_PlayEffect("spellFX_RingRitual2",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			random = Hlp_Random(2);
			if(random == 0)
			{
				Wld_PlayEffect("spellFX_RingRitual1",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			};
		};
	}
	else if(MIS_RitualInnosEyeRepair != LOG_SUCCESS)
	{
		random = Hlp_Random(1000);
		if(Npc_GetStateTime(self) > random)
		{
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xardas))
			{
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pyrokar))
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Circle_End()
{
};

