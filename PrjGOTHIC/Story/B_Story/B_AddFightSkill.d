
func void B_AddFightSkill(var C_Npc slf,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		slf.HitChance[NPC_TALENT_1H] = slf.HitChance[NPC_TALENT_1H] + percent;
		if(slf.HitChance[NPC_TALENT_1H] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
		};
		if(slf.HitChance[NPC_TALENT_1H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
		};
		if(slf.HitChance[NPC_TALENT_1H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		slf.HitChance[NPC_TALENT_2H] = slf.HitChance[NPC_TALENT_2H] + percent;
		if(slf.HitChance[NPC_TALENT_1H] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
		};
		if(slf.HitChance[NPC_TALENT_2H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
		};
		if(slf.HitChance[NPC_TALENT_2H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		slf.HitChance[NPC_TALENT_BOW] = slf.HitChance[NPC_TALENT_BOW] + percent;
		if(slf.HitChance[NPC_TALENT_BOW] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
		};
		if(slf.HitChance[NPC_TALENT_BOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
		};
		if(slf.HitChance[NPC_TALENT_BOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		slf.HitChance[NPC_TALENT_CROSSBOW] = slf.HitChance[NPC_TALENT_CROSSBOW] + percent;
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
		};
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
		};
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
		};
	};
};

