
var int EVT_Open_Door_Library_s1_OneTime;

func void EVT_Open_Door_Library_s1()
{
	if(EVT_Open_Door_Library_s1_OneTime == FALSE)
	{
		Snd_Play("DEM_Die");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_19");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_18");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_30");
		Wld_InsertNpc(Demon,"FP_ROAM_NW_KDF_LIBRARY_21");
		Wld_InsertNpc(Demon,"FP_ROAM_NW_KDF_LIBRARY_22");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NW_KDF_LIBRARY_20");
		EVT_Open_Door_Library_s1_OneTime = TRUE;
	};
};

func void EVT_Monastery_SecretLibrary_s1()
{
	if(SecretLibraryIsOpen == FALSE)
	{
		B_GivePlayerXP(XP_OpenSecretLibrary);
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_01");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_02");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_03");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_04");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_06");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_08");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_10");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_11");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_12");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_14");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_15");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_16");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_17");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_25");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_27");
		Wld_InsertNpc(SecretLibrarySkeleton,"FP_ROAM_NW_KDF_LIBRARY_29");
		SecretLibraryIsOpen = TRUE;
	};
};

func void EVT_SC_Enter_Library()
{
	HeroWasInLibrary = TRUE;
};

