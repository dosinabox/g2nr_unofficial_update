
var int enter_addonworld_firsttime_trigger_onetime;

func void enter_addonworld_firsttime_trigger_func()
{
	if(ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME == FALSE)
	{
		B_KillNpc(PIR_1370_Addon_Angus);
		B_KillNpc(PIR_1371_Addon_Hank);
		B_KillNpc(VLK_4304_Addon_William);
		B_KillNpc(NONE_Addon_114_Lance_ADW);
		B_KillNpc(STRF_1131_Addon_Sklave);
		B_KillNpc(STRF_1132_Addon_Sklave);
		B_KillNpc(STRF_1133_Addon_Sklave);
		B_KillNpc(STRF_1134_Addon_Sklave);
		B_KillNpc(STRF_1135_Addon_Sklave);
		B_KillNpc(STRF_1141_Addon_Sklave);
		B_KillNpc(STRF_1142_Addon_Sklave);
		B_KillNpc(STRF_1143_Addon_Sklave);
		B_KillNpc(STRF_1144_Addon_Sklave);
		B_KillNpc(BDT_10400_Addon_DeadBandit);
		B_KillNpc(BDT_10401_Addon_DeadBandit);
		B_KillNpc(Stoneguardian_MineDead1);
		B_KillNpc(Stoneguardian_MineDead2);
		B_KillNpc(Stoneguardian_MineDead3);
		B_KillNpc(Stoneguardian_MineDead4);
		ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME = TRUE;
	};
};

