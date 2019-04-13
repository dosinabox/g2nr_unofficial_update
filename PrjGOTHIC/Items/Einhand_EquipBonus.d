
var int hero_1h_max_bonus;

func void Equip_1H_01()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_01) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_01);
			b_meleeweaponchange(Waffenbonus_01,0,0);	
		};
	};
};

func void UnEquip_1H_01()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_01);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_02()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_02) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_02);
			b_meleeweaponchange(Waffenbonus_02,0,0);
		};
	};
};

func void UnEquip_1H_02()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_02);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_03()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_03) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_03);
			b_meleeweaponchange(Waffenbonus_03,0,0);
		};
	};
};

func void UnEquip_1H_03()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_03);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_04()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_04) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_04);
			b_meleeweaponchange(Waffenbonus_04,0,0);
		};
	};
};

func void UnEquip_1H_04()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_04);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_05()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_05) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_05);
			b_meleeweaponchange(Waffenbonus_05,0,0);
		};
	};
};

func void UnEquip_1H_05()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_05);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_06()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_06) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_06);
			b_meleeweaponchange(Waffenbonus_06,0,0);
		};
	};
};

func void UnEquip_1H_06()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_06);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};


func void Equip_1H_07()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_07) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_07);
			b_meleeweaponchange(Waffenbonus_07,0,0);
		};
	};
};

func void UnEquip_1H_07()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_07);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_08()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_08) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_08);
			b_meleeweaponchange(Waffenbonus_08,0,0);
		};
	};
};

func void UnEquip_1H_08()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_08);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_09()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_09) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_09);
			b_meleeweaponchange(Waffenbonus_09,0,0);
		};
	};
};

func void UnEquip_1H_09()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_09);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

func void Equip_1H_10()
{
	if(Npc_IsPlayer(self))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_10) > 100)
		{
			hero_1h_max_bonus = 100-self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_10);
			b_meleeweaponchange(Waffenbonus_10,0,0);
		};
	};
};

func void UnEquip_1H_10()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if (hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_10);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
	};
};

