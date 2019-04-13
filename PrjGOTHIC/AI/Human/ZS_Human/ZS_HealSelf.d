
func void ZS_HealSelf()
{
	Perception_Set_Minimal();
};

func int ZS_HealSelf_Loop()
{
	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		return LOOP_END;
	};
	if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(self.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		{
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("spellFX_Heal_ORIGIN",self,self,0,0,0,FALSE); 
			self.attribute[ATR_MANA] -= SPL_Cost_FullHeal;
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			return LOOP_CONTINUE;
		};
	}
	else if(self.guild == GIL_PAL)
	{
		if(self.attribute[ATR_MANA] >= SPL_Cost_PalFullHeal)
		{
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",self,self,0,0,0,FALSE); 
			self.attribute[ATR_MANA] -= SPL_Cost_PalFullHeal;
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalFullHeal);
			return LOOP_CONTINUE;
		};
	}
	else if(Npc_HasItems(self,ItPo_Health_Addon_04))
	{
		AI_UseItem(self,ItPo_Health_Addon_04);
		return LOOP_END;
	}
	else if(Npc_HasItems(self,ItPo_Health_03))
	{
		AI_UseItem(self,ItPo_Health_03);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,ItPo_Health_02))
	{
		AI_UseItem(self,ItPo_Health_02);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,ItPo_Health_01))
	{
		AI_UseItem(self,ItPo_Health_01);
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
};

func void ZS_HealSelf_End()
{
	Npc_ClearAIQueue(self);
};

