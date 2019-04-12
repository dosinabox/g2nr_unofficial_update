
func void B_AssessMurder()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(other))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other) && !Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if((victim.guild == GIL_SHEEP) && (victim.aivar[AIV_ToughGuy] == FALSE))
	{
		if(C_WantToAttackSheepKiller(self,other))
		{
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		else if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
		};
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		B_Attack(self,other,AR_MonsterMurderedHuman,0);
		return;
	};
	if(victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		return;
	};
	if(((Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY)) && ((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return;
	};
	if(!C_WantToAttackMurder(self,other))
	{
		if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_MURDER);
		};
		return;
	};
	if((other.aivar[AIV_DropDeadAndKill] == TRUE) || (victim.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return;
	};
	if((victim.guild == GIL_DMT) || ((victim.guild == GIL_BDT) && !C_NpcBelongsToBL(victim)))
	{
		return;
	};
	B_Attack(self,other,AR_HumanMurderedHuman,0);
};

