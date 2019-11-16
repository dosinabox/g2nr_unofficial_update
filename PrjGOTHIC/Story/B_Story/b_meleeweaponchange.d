
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
		//bugfix: перед превращением в звер€ добавить в инвентарь √√ дополнительные свитки
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
		//при превращении в звер€ запомнить уровень √√, порог опыта дл€ level up и заменить его уровнем звер€
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
		//bugfix: отменить экипировку √√ арбалетом в дополнение к луку
		AI_UnequipWeapons(hero);
		//bugfix: после возврата √√ в облик человека удалить из его инвентар€ дополнительные свитки
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
		//восстановить уровень, порог опыта дл€ level up и здоровье √√ с учетом level up-ов в облике звер€
		hero.level = hero.aivar[REAL_LEVEL] + LevelUpsDuringTransform;
		if(LevelUpsDuringTransform > 0)
		{
			hero.exp_next = Saved_exp_next + (hero.level + 1) * XP_PER_LEVEL;
		}
		else
		{
			hero.exp_next = Saved_exp_next;
		};
		hero.attribute[ATR_HITPOINTS_MAX] += LevelUpsDuringTransform * HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] += LevelUpsDuringTransform * HP_PER_LEVEL;
		//после возврата √√ в облик человека убить звер€
		self.attribute[ATR_HITPOINTS] = 0;
		PlayerIsTransformed = FALSE;
	};
};

/////////////////////////////////////////
//нова€ система от Slavemaster - тест
/////////////////////////////////////////

/*// необрезанное владение (может быть больше 100 или меньше 0
var int HERO_HITCHANCE_UNCUT[MAX_HITCHANCE];

// вклад в необрезанное владение, сделанный бонусами, не вли€ющими на цену прокачки
var int HERO_HITCHANCE_DELTA[MAX_HITCHANCE];

// нижний лимит навыков (заполнен нул€ми)
var int HERO_HITCHANCE_LOW[MAX_HITCHANCE];

// верхний лимит навыков (заполнен 100-ми)
var int HERO_HITCHANCE_HI[MAX_HITCHANCE];

func int GetMin(var int x, var int y)
{
	if(x < y)
	{
		return x;
	};
	return y;
};

func int GetMax(var int x, var int y)
{
	if(x > y)
	{
		return x;
	};
	return y;
};

// возвращает ближайшее к value число из отрезка [min..max]
func int Normalize(var int value, var int min, var int max)
{
	value = GetMin(value, max);
	return GetMax(value, min);
};

// обновл€ем анимации, если скилл изменилс€
func void UpdateHeroOverlay(var int oldSkill, var int newSkill, var string mds1, var string mds2)
{
	if(oldSkill == newSkill)
	{
		return;
	};
	if(oldSkill == 1)
	{
		Mdl_RemoveOverlayMds(hero, mds1);
	}
	else if(oldSkill == 2)
	{
		Mdl_RemoveOverlayMds(hero, mds2);
	};
	if(newSkill == 1)
	{
		Mdl_ApplyOverlayMds(hero, mds1);
	}
	else if(newSkill == 2)
	{
		Mdl_ApplyOverlayMds(hero, mds2);
	};
};

// все бонусы, вли€ющие на цену прокачки, должны вызывать этот метод
func void TrainHeroHitchance(var int talent, var int value)
{
	var int oldSkill;
	var int newSkill;
	if(talent == NPC_TALENT_1H)
	{
		HERO_HITCHANCE_UNCUT[NPC_TALENT_1H] += value;
		hero.HitChance[NPC_TALENT_1H] = Normalize(
			HERO_HITCHANCE_UNCUT[NPC_TALENT_1H],
			HERO_HITCHANCE_LOW[NPC_TALENT_1H],
			HERO_HITCHANCE_HI[NPC_TALENT_1H]
		);
		oldSkill = Npc_GetTalentSkill(hero, NPC_TALENT_1H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_1H] / 3, 2);
		Npc_SetTalentSkill(hero, talent, newSkill);
		UpdateHeroOverlay(oldSkill, newSkill, "humans_1hST1.MDS", "humans_1hST2.MDS");
	}
	else if(talent == NPC_TALENT_2H)
	{
		HERO_HITCHANCE_UNCUT[NPC_TALENT_2H] += value;
		hero.HitChance[NPC_TALENT_2H] = Normalize(
			HERO_HITCHANCE_UNCUT[NPC_TALENT_2H],
			HERO_HITCHANCE_LOW[NPC_TALENT_2H],
			HERO_HITCHANCE_HI[NPC_TALENT_2H]
		);
		oldSkill = Npc_GetTalentSkill(hero, NPC_TALENT_2H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_2H] / 3, 2);
		Npc_SetTalentSkill(hero, talent, newSkill);
		UpdateHeroOverlay(oldSkill, newSkill, "humans_2hST1.MDS", "humans_2hST2.MDS");
	}
	else if(talent == NPC_TALENT_BOW)
	{
		HERO_HITCHANCE_UNCUT[NPC_TALENT_BOW] += value;
		hero.HitChance[NPC_TALENT_BOW] = Normalize(
			HERO_HITCHANCE_UNCUT[NPC_TALENT_BOW],
			HERO_HITCHANCE_LOW[NPC_TALENT_BOW],
			HERO_HITCHANCE_HI[NPC_TALENT_BOW]
		);
		oldSkill = Npc_GetTalentSkill(hero, NPC_TALENT_BOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_BOW] / 3, 2);
		Npc_SetTalentSkill(hero, talent, newSkill);
		UpdateHeroOverlay(oldSkill, newSkill, "humans_bowT1.MDS", "humans_bowT2.MDS");
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		HERO_HITCHANCE_UNCUT[NPC_TALENT_CROSSBOW] += value;
		hero.HitChance[NPC_TALENT_CROSSBOW] = Normalize(
			HERO_HITCHANCE_UNCUT[NPC_TALENT_CROSSBOW],
			HERO_HITCHANCE_LOW[NPC_TALENT_CROSSBOW],
			HERO_HITCHANCE_HI[NPC_TALENT_CROSSBOW]
		);
		oldSkill = Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_CROSSBOW] / 3, 2);
		Npc_SetTalentSkill(hero, talent, newSkill);
		UpdateHeroOverlay(oldSkill, newSkill, "humans_cbowT1.MDS", "humans_cbowT2.MDS");
	}
	else
	{
		Print("¬нутренн€€ ошибка в TrainHeroHitchance: недопустимый параметр");
	};
};

// все бонусы, не вли€ющие на цену прокачки, должны вызывать этот метод
func void AddHeroHitchance(var int talent, var int value)
{
	if(talent == NPC_TALENT_1H)
	{
		HERO_HITCHANCE_DELTA[NPC_TALENT_1H] += value;
	}
	else if(talent == NPC_TALENT_2H)
	{
		HERO_HITCHANCE_DELTA[NPC_TALENT_2H] += value;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		HERO_HITCHANCE_DELTA[NPC_TALENT_BOW] += value;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		HERO_HITCHANCE_DELTA[NPC_TALENT_CROSSBOW] += value;
	};
	TrainHeroHitchance(talent, value);
};

// дл€ составлени€ меню обучени€ необходимо знать значение достигнутое лишь тренировками
func int GetHeroRealHitchance(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return HERO_HITCHANCE_UNCUT[NPC_TALENT_1H] - HERO_HITCHANCE_DELTA[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return HERO_HITCHANCE_UNCUT[NPC_TALENT_2H] - HERO_HITCHANCE_DELTA[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return HERO_HITCHANCE_UNCUT[NPC_TALENT_BOW] - HERO_HITCHANCE_DELTA[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return HERO_HITCHANCE_UNCUT[NPC_TALENT_CROSSBOW] - HERO_HITCHANCE_DELTA[NPC_TALENT_CROSSBOW];
	};
};

// выполн€ем при старте новой игры
func void InitHeroHitchance()
{
	HERO_HITCHANCE_UNCUT[0] = hero.HitChance[0];
	HERO_HITCHANCE_UNCUT[1] = hero.HitChance[1];
	HERO_HITCHANCE_UNCUT[2] = hero.HitChance[2];
	HERO_HITCHANCE_UNCUT[3] = hero.HitChance[3];
	HERO_HITCHANCE_UNCUT[4] = hero.HitChance[4];
	HERO_HITCHANCE_LOW[0] = 0;
	HERO_HITCHANCE_LOW[1] = 0;
	HERO_HITCHANCE_LOW[2] = 0;
	HERO_HITCHANCE_LOW[3] = 0;
	HERO_HITCHANCE_LOW[4] = 0;
	HERO_HITCHANCE_HI[0] = 100;
	HERO_HITCHANCE_HI[1] = 100;
	HERO_HITCHANCE_HI[2] = 100;
	HERO_HITCHANCE_HI[3] = 100;
	HERO_HITCHANCE_HI[4] = 100;
// дл€ пор€дку. ѕригодилось бы, если бы герой стартовал с высокими значени€ми навыков.
//	TrainHeroHitchance(1, 0);
//	TrainHeroHitchance(2, 0);
//	TrainHeroHitchance(3, 0);
//	TrainHeroHitchance(4, 0);
};*/

