
var int HitChanceBackupOneH;
var int HitChanceBackupTwoH;
var int ManaMaxBackup;
var int MeleeWeaponChangedHero;
var int ChangedManaHero;
var int ChangedOneHHero;
var int ChangedTwoHHero;
var int ScriptPatchWeaponChange;
var int PlayerIsTransformed;
var int Saved_exp_next;
var int Morgan_Bonus;
var int MorgansRingEquipped;
var int MorgansRingEquippedAt90;
var int MorgansRingEquippedAt100;
var int KeuleEquipped;
var int Keule_Bonus;
var int Keule_Fix_Needed;

func void b_meleeweaponchange(var int oneh,var int twoh,var int manamax)
{
	MeleeWeaponChangedHero = TRUE;
	ChangedManaHero = manamax;
	ChangedOneHHero = oneh;
	ChangedTwoHHero = twoh;
	ScriptPatchWeaponChange = TRUE;
};

func void b_meleeweaponundochange()
{
	MeleeWeaponChangedHero = FALSE;
	ChangedManaHero = 0;
	ChangedOneHHero = 0;
	ChangedTwoHHero = 0;
	ScriptPatchWeaponChange = TRUE;
};

func void Equip_MorgansRing()
{
	Morgan_Bonus = 100 - self.HitChance[NPC_TALENT_1H];
	if(self.HitChance[NPC_TALENT_1H] >= 100)
	{
		if(ChangedOneHHero > 0)
		{
			MorgansRingEquippedAt90 = TRUE;
		}
		else if(ChangedOneHHero == 0)
		{
			MorgansRingEquippedAt100 = TRUE;
		};
	}
	else if(self.HitChance[NPC_TALENT_1H] == 90)
	{
		if(KeuleEquipped == TRUE)
		{
			MorgansRingEquippedAt100 = TRUE;
		}
		else
		{
			MorgansRingEquippedAt90 = TRUE;
		};
		B_AddFightSkill(self,NPC_TALENT_1H,Morgan_Bonus);
	}
	else if(self.HitChance[NPC_TALENT_1H] > 90)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,Morgan_Bonus);
		MorgansRingEquippedAt90 = TRUE;
	}
	else if(self.HitChance[NPC_TALENT_1H] < 90)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,10);
		MorgansRingEquipped = TRUE;
	};
	MorgansRing = TRUE;
};

func void UnEquip_MorgansRing()
{
	if(MorgansRingEquippedAt100 == TRUE)
	{
		MorgansRingEquippedAt100 = FALSE;
	}
	else if(MorgansRingEquippedAt90 == TRUE)
	{
		if(self.HitChance[NPC_TALENT_1H] == 100)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Morgan_Bonus);
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Morgan_Bonus);
		};
		MorgansRingEquippedAt90 = FALSE;
	}
	else if(MorgansRingEquipped == TRUE)
	{
		if(Keule_Fix_Needed == TRUE)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Keule_Bonus);
		}
		else
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-10);
		};
		MorgansRingEquipped = FALSE;
	};
	MorgansRing = FALSE;
};

func void Equip_1H_Keule()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10);
		b_meleeweaponchange(-10,0,0);
		KeuleEquipped = TRUE;
	};
};

func void UnEquip_1H_Keule()
{
	Keule_Bonus = 100 - self.HitChance[NPC_TALENT_1H];
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		if(self.HitChance[NPC_TALENT_1H] > 90)
		{
			if(MorgansRingEquipped == TRUE)
			{
				B_AddFightSkill(self,NPC_TALENT_1H,Keule_Bonus);
				Keule_Fix_Needed = TRUE;
				//Print("тест 1");
			}
			else if(self.HitChance[NPC_TALENT_1H] <= 90)
			{
				B_AddFightSkill(self,NPC_TALENT_1H,10);
			};
		};
		B_AddFightSkill(self,NPC_TALENT_1H,10);
		b_meleeweaponundochange();
		KeuleEquipped = FALSE;
	};
};

func void Equip_2H_Keule()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-10);
		b_meleeweaponchange(0,-10,0);
	};
};

func void UnEquip_2H_Keule()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,10);
		b_meleeweaponundochange();
	};
};

func void b_startmagictransform(var int Level)
{
	if(PlayerIsTransformed == FALSE)
	{
		HitChanceBackupOneH = hero.HitChance[NPC_TALENT_1H] - ChangedOneHHero;
		HitChanceBackupTwoH = hero.HitChance[NPC_TALENT_2H] - ChangedTwoHHero;
		ManaMaxBackup = hero.attribute[ATR_MANA_MAX] - ChangedManaHero;
		b_meleeweaponundochange();
		MonsterTransformLevel = Level;
		//bugfix: перед превращением в зверя добавить в инвентарь ГГ дополнительные свитки
		if(Level == 1)
		{
			CreateInvItem(hero,ItSc_TrfSheep);
		}
		else if(Level == 7)
		{
			CreateInvItem(hero,ItSc_TrfScavenger);
		}
		else if(Level == 3)
		{
			CreateInvItem(hero,ItSc_TrfGiantRat);
		}
		else if(Level == 8)
		{
			CreateInvItem(hero,ItSc_TrfGiantBug);
		}
		else if(Level == 6)
		{
			CreateInvItem(hero,ItSc_TrfWolf);
		}
		else if(Level == 12)
		{
			CreateInvItem(hero,ItSc_TrfWaran);
			CreateInvItem(hero,ItSc_TrfSnapper);
			CreateInvItem(hero,ItSc_TrfLurker);
		}
		else if(Level == 30)
		{
			CreateInvItem(hero,ItSc_TrfWarg);
			CreateInvItem(hero,ItSc_TrfFireWaran);
			CreateInvItem(hero,ItSc_TrfShadowbeast);
		}
		else if(Level == 40)
		{
			CreateInvItem(hero,ItSc_TrfDragonSnapper);
		};
		//при превращении в зверя запомнить уровень ГГ, порог опыта для level up и заменить его уровнем зверя
		hero.aivar[REAL_LEVEL] = hero.level;
		Saved_exp_next = hero.exp_next;
		hero.level = Level;
		LevelUpsDuringTransform = 0;
		PlayerIsTransformed = TRUE;
	};
};

func void b_stopmagictransform()
{
	if(PlayerIsTransformed == TRUE)
	{
		if(HitChanceBackupOneH != hero.HitChance[NPC_TALENT_1H])
		{
			B_AddFightSkill(hero,NPC_TALENT_1H,(HitChanceBackupOneH - hero.HitChance[NPC_TALENT_1H]) + ChangedOneHHero);
		};
		if(HitChanceBackupTwoH != hero.HitChance[NPC_TALENT_2H])
		{
			B_AddFightSkill(hero,NPC_TALENT_2H,(HitChanceBackupTwoH - hero.HitChance[NPC_TALENT_2H]) + ChangedTwoHHero);
		};
		if(ManaMaxBackup != hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA_MAX] = ManaMaxBackup + ChangedManaHero;
		};
		AI_UnequipWeapons(hero);
		//bugfix: отменить экипировку ГГ арбалетом в дополнение к луку
		AI_UnequipWeapons(hero);
		//bugfix: после возврата ГГ в облик человека удалить из его инвентаря дополнительные свитки
		if(MonsterTransformLevel == 1)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfSheep);
		}
		else if(MonsterTransformLevel == 7)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfScavenger);
		}
		else if(MonsterTransformLevel == 3)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfGiantRat);
		}
		else if(MonsterTransformLevel == 8)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfGiantBug);
		}
		else if(MonsterTransformLevel == 6)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfWolf);
		}
		else if(MonsterTransformLevel == 12)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfWaran);
			Npc_RemoveInvItem(hero,ItSc_TrfSnapper);
			Npc_RemoveInvItem(hero,ItSc_TrfLurker);
		}
		else if(MonsterTransformLevel == 30)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfWarg);
			Npc_RemoveInvItem(hero,ItSc_TrfFireWaran);
			Npc_RemoveInvItem(hero,ItSc_TrfShadowbeast);
		}
		else if(MonsterTransformLevel == 40)
		{
			Npc_RemoveInvItem(hero,ItSc_TrfDragonSnapper);
		};
		//восстановить уровень, порог опыта для level up и здоровье ГГ с учетом level up-ов в облике зверя
		hero.level = hero.aivar[REAL_LEVEL] + LevelUpsDuringTransform;
		if(LevelUpsDuringTransform > 0)
		{
			hero.exp_next = Saved_exp_next + (hero.level + 1) * 500;
		}
		else
		{
			hero.exp_next = Saved_exp_next;
		};
		hero.attribute[ATR_HITPOINTS_MAX] += LevelUpsDuringTransform * HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] += LevelUpsDuringTransform * HP_PER_LEVEL;
		//после возврата ГГ в облик человека убить зверя
		self.attribute[ATR_HITPOINTS] = 0;
		PlayerIsTransformed = FALSE;
	};
};

