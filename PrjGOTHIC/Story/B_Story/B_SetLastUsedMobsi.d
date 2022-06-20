
func void B_SetLastUsedMobsi(var C_Npc slf,var int mobsi)
{
	if(slf.aivar[AIV_LastUsedMobsi] == MOBSI_NONE)
	{
		if(mobsi == MOBSI_SmithWeapon)
		{
			slf.aivar[AIV_MobsiItemsCount] = Npc_HasItems(slf,ItMiSwordraw);
		}
		else if(mobsi == MOBSI_PotionAlchemy)
		{
			slf.aivar[AIV_MobsiItemsCount] = Npc_HasItems(slf,ItMi_Flask);
		};
		slf.aivar[AIV_LastUsedMobsi] = mobsi;
	};
};

func void B_CreateMobsiItems(var C_Npc slf)
{
	var int count;
	count = slf.aivar[AIV_MobsiItemsCount];
	if(slf.aivar[AIV_LastUsedMobsi] == MOBSI_SmithWeapon)
	{
		B_ClearSmithInv(slf);
		if(count > 0)
		{
			CreateInvItems(slf,ItMiSwordraw,count);
		};
	}
	else if(slf.aivar[AIV_LastUsedMobsi] == MOBSI_PotionAlchemy)
	{
		B_ClearAlchemyInv(slf);
		if(count > 0)
		{
			CreateInvItems(slf,ItMi_Flask,count);
		};
	};
	slf.aivar[AIV_LastUsedMobsi] = MOBSI_NONE;
};

