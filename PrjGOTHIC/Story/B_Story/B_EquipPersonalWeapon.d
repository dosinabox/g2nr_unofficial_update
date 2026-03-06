
func void B_EquipPersonalWeapon_Rod(var C_Npc npc)
{
	if(Rod_HasHisSwordInNW == TRUE)
	{
		EquipItem(npc,ItMw_2H_Rod);
	}
	else
	{
		EquipItem(npc,ItMw_1H_OLD_Sword);
	};
};

