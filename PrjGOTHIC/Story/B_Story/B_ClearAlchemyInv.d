
func void B_ClearAlchemyInv(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		if(Dont_Fix_Unlim == FALSE)
		{
			Npc_RemoveInvItems(slf,ItMi_Flask,Npc_HasItems(slf,ItMi_Flask));
		};
	};
};

