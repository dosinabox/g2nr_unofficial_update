
var int EVT_CRYPT_01_OneTime;

func void evt_crypt_01()
{
	if(EVT_CRYPT_01_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_05");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_01_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_01_SPAWN_07");
		EVT_CRYPT_01_OneTime = TRUE;
	};
};


var int EVT_CRYPT_02_OneTime;

func void evt_crypt_02()
{
	if(EVT_CRYPT_02_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_05");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_02_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_02_SPAWN_07");
		EVT_CRYPT_02_OneTime = TRUE;
	};
};


var int EVT_CRYPT_03_OneTime;

func void evt_crypt_03()
{
	if(EVT_CRYPT_03_OneTime == FALSE)
	{
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_01");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_02");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_03");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_04");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_05");
		Wld_InsertNpc(Lesser_Skeleton,"EVT_CRYPT_ROOM_03_SPAWN_06");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_03_SPAWN_07");
		EVT_CRYPT_03_OneTime = TRUE;
	};
};


var int EVT_CRYPT_FINAL_OneTime;

func void evt_crypt_final()
{
	if(EVT_CRYPT_FINAL_OneTime == FALSE)
	{
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_01");
		Wld_InsertNpc(Skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_02");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_03");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_04");
		Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_05");
		Wld_InsertNpc(Crypt_Skeleton_Lord,"EVT_CRYPT_ROOM_FINAL_SPAWN_06");
		EVT_CRYPT_FINAL_OneTime = TRUE;
	};
};

func void evt_crypt_room_01_triggerentrance()
{
	Crypt_Skeleton_Room_01.aivar[AIV_EnemyOverride] = FALSE;
};

func void evt_crypt_room_02_triggerentrance()
{
	Crypt_Skeleton_Room_02.aivar[AIV_EnemyOverride] = FALSE;
};

func void evt_crypt_room_03_triggerentrance()
{
	Crypt_Skeleton_Room_03.aivar[AIV_EnemyOverride] = FALSE;
};

