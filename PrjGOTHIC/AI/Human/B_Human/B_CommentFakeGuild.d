
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
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if(C_IsNpc(self,VLK_410_Baltram))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR_SLD");
	}
	else if(C_IsNpc(self,MIL_350_Addon_Martin) && (other.guild != GIL_MIL))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR");
	}
	else if(C_IsNpc(self,SLD_805_Cord) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
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
	else if(C_IsNpc(self,KDF_511_Daron) || C_IsNpc(self,NOV_602_Ulf))
	{
		B_Say(self,other,"$ADDON_WRONGARMOR_KDF");
	}
	else
	{
		B_Say(self,other,"$ADDON_WRONGARMOR");
	};
};

