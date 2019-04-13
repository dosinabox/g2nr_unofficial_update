
var int hero_2h_max_bonus;

func void Equip_2H_01()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_01) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_01);
			b_meleeweaponchange(0,Waffenbonus_01,0);
		};
	};
};

func void UnEquip_2H_01()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_01);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_02()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_02) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_02);
			b_meleeweaponchange(0,Waffenbonus_02,0);
		};
	};
};

func void UnEquip_2H_02()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_02);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_03()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_03) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_03);
			b_meleeweaponchange(0,Waffenbonus_03,0);
		};
	};
};

func void UnEquip_2H_03()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_03);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_04()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_04) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_04);
			b_meleeweaponchange(0,Waffenbonus_04,0);
		};
	};
};

func void UnEquip_2H_04()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_04);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_05()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_05) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_05);
			b_meleeweaponchange(0,Waffenbonus_05,0);
		};
	};
};

func void UnEquip_2H_05()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_05);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_06()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_06) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_06);
			b_meleeweaponchange(0,Waffenbonus_06,0);
		};
	};
};

func void UnEquip_2H_06()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_06);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_07()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_07) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_07);
			b_meleeweaponchange(0,Waffenbonus_07,0);
		};
	};
};

func void UnEquip_2H_07()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_07);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_08()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_08) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_08);
			b_meleeweaponchange(0,Waffenbonus_08,0);
		};
	};
};

func void UnEquip_2H_08()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_08);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_09()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_09) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_09);
			b_meleeweaponchange(0,Waffenbonus_09,0);
		};
	};
};

func void UnEquip_2H_09()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_09);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_2H_10()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_2H] + Waffenbonus_10) > 100)
		{
			hero_2h_max_bonus = 100 - self.HitChance[NPC_TALENT_2H];
			B_AddFightSkill(self,NPC_TALENT_2H,hero_2h_max_bonus);
			b_meleeweaponchange(0,hero_2h_max_bonus,0);
		}
		else
		{
			hero_2h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_10);
			b_meleeweaponchange(0,Waffenbonus_10,0);
		};
	};
};

func void UnEquip_2H_10()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_2h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_10);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_2H,-hero_2h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};