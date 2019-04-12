
func void B_Spawn_Skeleton_S1()
{
	if(Skelett_Spawn == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"OC_EBR_DARK_FLOOR");
		Skelett_Spawn = TRUE;
	};
};

