
func void ZS_CommentFakeGuild()
{
	Perception_Set_Minimal();
	AI_Standup(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		B_TurnToNpc(self,other);
	};
	if(!C_BodyStateContains(other,BS_SIT))
	{
		B_TurnToNpc(other,self);
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Martin)) && (other.guild != GIL_MIL))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR");
	}
	else if((self.guild == GIL_MIL) || (self.guild == GIL_PAL))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR_MIL");
	}
	else if((self.guild == GIL_NOV) || (self.guild == GIL_KDF))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR_KDF");
	}
	else if((self.guild == GIL_SLD) || (self.guild == GIL_DJG))
	{
		if(Npc_HasEquippedArmor(other))
		{
			B_Say(self,other,"$ADDON_WRONGARMOR_SLD");
		}
		else
		{
			B_Say(self,other,"$ADDON_NOARMOR_BDT");
		};
	}
	else
	{
		B_Say(self,other,"$ADDON_WRONGARMOR");
	};
};

