
var int Enter_AddonWorld_FirstTime_Trigger_OneTime;

func void Enter_AddonWorld_FirstTime_Trigger_Func()
{
	if(Enter_AddonWorld_FirstTime_Trigger_OneTime == FALSE)
	{
		B_KillNpc(PIR_1370_Addon_Angus);
		B_KillNpc(PIR_1371_Addon_Hank);
		B_KillNpc(VLK_4304_Addon_William);
		B_KillNpc(NONE_ADDON_114_Lance_ADW);
		B_KillNpc(STRF_1131_Addon_Sklave);
		B_KillNpc(STRF_1132_Addon_Sklave);
		B_KillNpc(STRF_1133_Addon_Sklave);
		B_KillNpc(STRF_1134_Addon_Sklave);
		B_KillNpc(STRF_1135_Addon_Sklave);
		B_KillNpc(STRF_1142_Addon_Sklave);
		B_KillNpc(STRF_1144_Addon_Sklave);
		if(C_WorldIsFixed())
		{
			Wld_InsertNpc(STRF_1141_Addon_Sklave,"BANDIT");
			B_KillNpc(STRF_1141_Addon_Sklave);
			Wld_InsertNpc(STRF_1143_Addon_Sklave,"BANDIT");
			B_KillNpc(STRF_1143_Addon_Sklave);
			Wld_InsertItem(ItRu_FireBolt,"FP_ITEM_SWAMP_RUNE_01");
		}
		else
		{
			CreateInvItems(Stoneguardian_NailedValleyShowcase_01,ItSc_Teleport_Maya,1);
		};
		Enter_AddonWorld_FirstTime_Trigger_OneTime = TRUE;
	};
};

