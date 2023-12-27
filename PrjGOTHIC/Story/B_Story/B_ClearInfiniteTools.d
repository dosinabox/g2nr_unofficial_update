
func void B_ClearInfiniteTools(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		B_RemoveEveryInvItem(slf,ItMi_Stomper);
		B_RemoveEveryInvItem(slf,ItMi_Hammer);
		B_RemoveEveryInvItem(slf,ItMi_Scoop);
		B_RemoveEveryInvItem(slf,ItMi_Saw);
		B_RemoveEveryInvItem(slf,ItMi_Rake);
		B_RemoveEveryInvItem(slf,ItMi_Broom);
		B_RemoveEveryInvItem(slf,ItMi_Lute);
		B_RemoveEveryInvItem(slf,ItMi_IEHarfe);
		B_RemoveEveryInvItem(slf,ItMi_Brush);
		B_RemoveEveryInvItem(slf,ItMw_TrainSword);
	};
};

