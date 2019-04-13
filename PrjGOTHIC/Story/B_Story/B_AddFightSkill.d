
func void B_AddFightSkill(var C_Npc slf,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		slf.HitChance[NPC_TALENT_1H] += percent;
		if(slf.HitChance[NPC_TALENT_1H] > 100)
		{
			slf.HitChance[NPC_TALENT_1H] = 100;
		};
		if(slf.HitChance[NPC_TALENT_1H] < 0)
		{
			slf.HitChance[NPC_TALENT_1H] = 0;
		};
		if(slf.HitChance[NPC_TALENT_1H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
			Mdl_ApplyOverlayMds(slf,"humans_1hST2.mds");
		}
		else if(slf.HitChance[NPC_TALENT_1H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
			Mdl_ApplyOverlayMds(slf,"humans_1hST1.mds");
		}
		else
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
			Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		slf.HitChance[NPC_TALENT_2H] += percent;
		if(slf.HitChance[NPC_TALENT_2H] > 100)
		{
			slf.HitChance[NPC_TALENT_2H] = 100;
		};
		if(slf.HitChance[NPC_TALENT_2H] < 0)
		{
			slf.HitChance[NPC_TALENT_2H] = 0;
		};
		if(slf.HitChance[NPC_TALENT_2H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
			Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
		}
		else if(slf.HitChance[NPC_TALENT_2H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
			Mdl_ApplyOverlayMds(slf,"humans_2hST1.mds");
		}
		else
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
			Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		slf.HitChance[NPC_TALENT_BOW] += percent;
		if(slf.HitChance[NPC_TALENT_BOW] > 100)
		{
			slf.HitChance[NPC_TALENT_BOW] = 100;
		};
		if(slf.HitChance[NPC_TALENT_BOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
			Mdl_ApplyOverlayMds(slf,"humans_bowT2.mds");
		}
		else if(slf.HitChance[NPC_TALENT_BOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
			Mdl_ApplyOverlayMds(slf,"humans_bowT1.mds");
		}
		else
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
			Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		slf.HitChance[NPC_TALENT_CROSSBOW] += percent;
		if(slf.HitChance[NPC_TALENT_CROSSBOW] > 100)
		{
			slf.HitChance[NPC_TALENT_CROSSBOW] = 100;
		};
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
			Mdl_ApplyOverlayMds(slf,"humans_cbowT2.mds");
		}
		else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
			Mdl_ApplyOverlayMds(slf,"humans_cbowT1.mds");
		}
		else
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
			Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
		};
	};
};

