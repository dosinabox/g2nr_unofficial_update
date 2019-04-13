
const int SPL_Cost_Fear = 50;
const int SPL_TIME_Fear = 5;

instance Spell_Fear(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Fear(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Fear)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Fear()
{
	//if(other.guild != GIL_DRAGON)
	/*if((other.guild != GIL_DRAGON) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Vatras))
	{
		//AI_SetNpcsToState(self,ZS_MagicFlee,1000);
		AI_SetNpcsToState(other,ZS_MagicFlee,1000);
	};*/
	//Npc_ClearAIQueue(self);
	//B_ClearPerceptions(self);
	//Npc_SetTarget(self,other);
	if((other.guild < GIL_SEPERATOR_HUM) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Vatras)))
	{
		//AI_StartState(other,ZS_MagicFlee,0,"");
		AI_SetNpcsToState(self,ZS_MagicFlee,1000);
		//return;
	}
	else if((other.guild > GIL_SEPERATOR_HUM) && (other.guild != GIL_DRAGON) && (other.guild != GIL_TROLL) && (other.guild != GIL_STONEGOLEM) && (other.guild != GIL_ICEGOLEM) && (other.guild != GIL_FIREGOLEM))
	{
		//AI_StartState(other,ZS_MM_Flee,0,"");
		AI_SetNpcsToState(self,ZS_MM_Flee,1000);
		//return;
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Fear;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

