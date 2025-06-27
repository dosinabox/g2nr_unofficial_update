
var int EVT_Crypt_01_OneTime;

func void EVT_Crypt_01()
{
	if(EVT_Crypt_01_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_05");
		Wld_InsertNpc(SkeletonScout,"EVT_CRYPT_ROOM_01_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_01_SPAWN_07");
		EVT_Crypt_01_OneTime = TRUE;
	};
};

var int EVT_Crypt_02_OneTime;

func void EVT_Crypt_02()
{
	if(EVT_Crypt_02_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_05");
		Wld_InsertNpc(SkeletonScout,"EVT_CRYPT_ROOM_02_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_02_SPAWN_07");
		EVT_Crypt_02_OneTime = TRUE;
	};
};

var int EVT_Crypt_03_OneTime;

func void EVT_Crypt_03()
{
	if(EVT_Crypt_03_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_05");
		Wld_InsertNpc(SkeletonScout,"EVT_CRYPT_ROOM_03_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_03_SPAWN_07");
		EVT_Crypt_03_OneTime = TRUE;
	};
};

var int EVT_Crypt_Final_OneTime;

func void EVT_Crypt_Final()
{
	if(EVT_Crypt_Final_OneTime == FALSE)
	{
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_01");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_02");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_03");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_04");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_05");
		Wld_InsertNpc(Crypt_Skeleton_Lord,"EVT_CRYPT_ROOM_FINAL_SPAWN_06");
		EVT_Crypt_Final_OneTime = TRUE;
	};
};

func void EVT_Crypt_01_Entrance()
{
	if(!Npc_IsDead(Crypt_Skeleton_Room_01))
	{
		Crypt_Skeleton_Room_01.aivar[AIV_EnemyOverride] = FALSE;
	};
};

func void EVT_Crypt_02_Entrance()
{
	if(!Npc_IsDead(Crypt_Skeleton_Room_02))
	{
		Crypt_Skeleton_Room_02.aivar[AIV_EnemyOverride] = FALSE;
	};
};

func void EVT_Crypt_03_Entrance()
{
	if(!Npc_IsDead(Crypt_Skeleton_Room_03))
	{
		Crypt_Skeleton_Room_03.aivar[AIV_EnemyOverride] = FALSE;
	};
};

