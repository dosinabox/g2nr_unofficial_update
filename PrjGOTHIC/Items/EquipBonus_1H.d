
/*var int hero_1h_max_bonus;

func void Equip_1H_01()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_01) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_01);
			b_meleeweaponchange(Waffenbonus_01,0,0);
		};
		Current1HBonus = 1;
	};
};

func void UnEquip_1H_01()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_01);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_02()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_02) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_02);
			b_meleeweaponchange(Waffenbonus_02,0,0);
		};
		Current1HBonus = 2;
	};
};

func void UnEquip_1H_02()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_02);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_03()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_03) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_03);
			b_meleeweaponchange(Waffenbonus_03,0,0);
		};
		Current1HBonus = 3;
	};
};

func void UnEquip_1H_03()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_03);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_04()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_04) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_04);
			b_meleeweaponchange(Waffenbonus_04,0,0);
		};
		Current1HBonus = 4;
	};
};

func void UnEquip_1H_04()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_04);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_05()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_05) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_05);
			b_meleeweaponchange(Waffenbonus_05,0,0);
		};
		Current1HBonus = 5;
	};
};

func void UnEquip_1H_05()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_05);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_06()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_06) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_06);
			b_meleeweaponchange(Waffenbonus_06,0,0);
		};
		Current1HBonus = 6;
	};
};

func void UnEquip_1H_06()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_06);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};


func void Equip_1H_07()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_07) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_07);
			b_meleeweaponchange(Waffenbonus_07,0,0);
		};
		Current1HBonus = 7;
	};
};

func void UnEquip_1H_07()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_07);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_08()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_08) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_08);
			b_meleeweaponchange(Waffenbonus_08,0,0);
		};
		Current1HBonus = 8;
	};
};

func void UnEquip_1H_08()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_08);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_09()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_09) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_09);
			b_meleeweaponchange(Waffenbonus_09,0,0);
		};
		Current1HBonus = 9;
	};
};

func void UnEquip_1H_09()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_09);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};

func void Equip_1H_10()
{
	if(Npc_IsPlayer(self) && (self.HitChance[NPC_TALENT_1H] < 100))
	{
		if((self.HitChance[NPC_TALENT_1H] + Waffenbonus_10) > 100)
		{
			hero_1h_max_bonus = 100 - self.HitChance[NPC_TALENT_1H];
			B_AddFightSkill(self,NPC_TALENT_1H,hero_1h_max_bonus);
			b_meleeweaponchange(hero_1h_max_bonus,0,0);
		}
		else
		{
			hero_1h_max_bonus = -1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_10);
			b_meleeweaponchange(Waffenbonus_10,0,0);
		};
		Current1HBonus = 10;
	};
};

func void UnEquip_1H_10()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(hero_1h_max_bonus < 0)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_10);
			b_meleeweaponundochange();
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-hero_1h_max_bonus);
			b_meleeweaponundochange();
		};
		Current1HBonus = 0;
	};
};*/

func void Equip_1H(var int value)
{
	B_ChangeTalent(self,NPC_TALENT_1H,value,TS_TempBonus);
};

func void UnEquip_1H(var int value)
{
	B_ChangeTalent(self,NPC_TALENT_1H,-value,TS_TempBonus);
};


func void Equip_1H_01()
{
	Equip_1H(Waffenbonus_01);
};

func void UnEquip_1H_01()
{
	UnEquip_1H(Waffenbonus_01);
};

func void Equip_1H_02()
{
	Equip_1H(Waffenbonus_02);
};

func void UnEquip_1H_02()
{
	UnEquip_1H(Waffenbonus_02);
};

func void Equip_1H_03()
{
	Equip_1H(Waffenbonus_03);
};

func void UnEquip_1H_03()
{
	UnEquip_1H(Waffenbonus_03);
};

func void Equip_1H_04()
{
	Equip_1H(Waffenbonus_04);
};

func void UnEquip_1H_04()
{
	UnEquip_1H(Waffenbonus_04);
};

func void Equip_1H_05()
{
	Equip_1H(Waffenbonus_05);
};

func void UnEquip_1H_05()
{
	UnEquip_1H(Waffenbonus_05);
};

func void Equip_1H_06()
{
	Equip_1H(Waffenbonus_06);
};

func void UnEquip_1H_06()
{
	UnEquip_1H(Waffenbonus_06);
};

func void Equip_1H_07()
{
	Equip_1H(Waffenbonus_07);
};

func void UnEquip_1H_07()
{
	UnEquip_1H(Waffenbonus_07);
};

func void Equip_1H_08()
{
	Equip_1H(Waffenbonus_08);
};

func void UnEquip_1H_08()
{
	UnEquip_1H(Waffenbonus_08);
};

func void Equip_1H_09()
{
	Equip_1H(Waffenbonus_09);
};

func void UnEquip_1H_09()
{
	UnEquip_1H(Waffenbonus_09);
};

func void Equip_1H_10()
{
	Equip_1H(Waffenbonus_10);
};

func void UnEquip_1H_10()
{
	UnEquip_1H(Waffenbonus_10);
};

