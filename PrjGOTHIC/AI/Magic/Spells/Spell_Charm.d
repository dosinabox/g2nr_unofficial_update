
const int SPL_Cost_Charm = 50;
const int SPL_Damage_Charm = 0;

instance Spell_Charm(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
	damage_per_level = SPL_Damage_Charm;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Charm(var int manaInvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Charm))
	{
		if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Ignaz))
		{
			if((other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE) && (MIS_Ignaz_Charm == LOG_Running))
			{
				if(Charm_Test == FALSE)
				{
					B_LogEntry(TOPIC_Ignaz,"Кажется, заклинание сработало! И, похоже, обошлось без свидетелей.");
				};
				Charm_Test = TRUE;
			};
			B_DeletePetzCrime(other);
			other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
			other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
			other.aivar[AIV_CommentedPlayerCrime] = FALSE;
			if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
			{
				if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
				{
					Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
				};
			};
		};
		if(Undercover_Failed == FALSE)
		{
			if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Borka))
			{
				Undercover_Failed_Borka = FALSE;
				Borka_RefuseToTalk = FALSE;
			}
			else if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Nadja))
			{
				Undercover_Failed_Nadja = FALSE;
				Nadja_BuyHerb_Failed = FALSE;
			};
		};
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Meldor))
		{
			Undercover_Failed_Meldor = FALSE;
			Meldor_Busted = FALSE;
		}
		else if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Kardif))
		{
			Undercover_Failed_Kardif = FALSE;
			Kardif_Busted = FALSE;
		}
		else if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Canthar))
		{
			if(other.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
			{
				other.aivar[AIV_LastFightComment] = TRUE;
			};
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Charm()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Charm;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

