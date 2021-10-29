
func void ZS_Obesession()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4))
	{
		if(!Npc_IsDead(Vino))
		{
			AI_TurnToNPC(self,Vino);
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
	{
		if(!Npc_IsDead(DMT_Vino4))
		{
			AI_UnequipWeapons(self);
			AI_TurnToNPC(self,DMT_Vino4);
		};
	};
};

func int ZS_Obesession_Loop()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4))
	{
		if(!Npc_IsDead(Vino))
		{
			AI_PlayAni(self,"S_SCKSHOOT");
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
	{
		if(!Npc_IsDead(DMT_Vino4))
		{
			Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"S_SUCKENERGY_VICTIM");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Obesession_End()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
	{
		AI_EquipBestMeleeWeapon(self);
	};
};

