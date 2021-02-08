
func void B_SetBeltBonus(var int bonus)
{
	self.protection[PROT_EDGE] += bonus;
	self.protection[PROT_BLUNT] += bonus;
	self.protection[PROT_POINT] += bonus;
	self.protection[PROT_MAGIC] += bonus;
	self.protection[PROT_FIRE] += bonus;
};

func void B_RemoveBeltBonus(var int bonus)
{
	self.protection[PROT_EDGE] -= bonus;
	self.protection[PROT_BLUNT] -= bonus;
	self.protection[PROT_POINT] -= bonus;
	self.protection[PROT_MAGIC] -= bonus;
	self.protection[PROT_FIRE] -= bonus;
};

func void Equip_ArmorSet()
{
	if(Npc_IsPlayer(self))
	{
		B_UnEquipHeroItem(ITHE_OHT);
		B_UnEquipHeroItem(ITHE_DHT);
		B_UnEquipHeroItem(ITHE_DJG_M);
		B_UnEquipHeroItem(ITHE_DJG_H);
		B_UnEquipHeroItem(ITHE_PAL_M);
		B_UnEquipHeroItem(ITHE_PAL_H);
	};
};

func void Equip_OpenArmor()
{
	if(Npc_IsPlayer(self))
	{
		OpenArmor_Equipped = TRUE;
		B_SetHeroSkin();
	};
};

func void UnEquip_OpenArmor()
{
	if(Npc_IsPlayer(self))
	{
		OpenArmor_Equipped = FALSE;
		B_SetHeroSkin();
	};
};

func void Equip_ITAR_MIL()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;
		B_SetHeroSkin();
		if(MILBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_MIL()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;
		B_SetHeroSkin();
		if(MILBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

func void Equip_ITAR_SLD()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		B_SetHeroSkin();
		if(SLDBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_SLD()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		B_SetHeroSkin();
		if(SLDBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

func void Equip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = TRUE;
		if(MCBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = FALSE;
		if(MCBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

func void Equip_ITAR_NOV()
{
	if(Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = TRUE;
		B_SetHeroSkin();
		if(NOVBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_NOV()
{
	if(Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = FALSE;
		B_SetHeroSkin();
		if(NOVBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

func void Equip_ITAR_KDF()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;
		if(KDFBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_KDF()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;
		if(KDFBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

func void Equip_ITAR_Leather()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = TRUE;
		if(LeatherBelt_Equipped == TRUE)
		{
			B_SetBeltBonus(BA_Bonus01);
		};
	};
};

func void UnEquip_ITAR_Leather()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;
		if(LeatherBelt_Equipped == TRUE)
		{
			B_RemoveBeltBonus(BA_Bonus01);
		};
	};
};

