
func void B_ClearAlchemyInv(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		if(Dont_Fix_Unlim == FALSE)
		{
			B_RemoveEveryInvItem(slf,ItMi_Flask);
		};
	};
};

