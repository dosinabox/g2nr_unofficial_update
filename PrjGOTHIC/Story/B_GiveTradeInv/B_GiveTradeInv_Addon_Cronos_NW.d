
var int Cronos_NW_ItemsGiven_Chapter_1;

func void B_GiveTradeInv_Addon_Cronos_NW(var C_Npc slf)
{
	if((Kapitel >= 1) && (Cronos_NW_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Flask,Cronos_NW_ItMi_Flask_Count);
		CreateInvItems(slf,ItMi_Sulfur,Cronos_NW_ItMi_Sulfur_Count);
		CreateInvItems(slf,ItMi_Pitch,Cronos_NW_ItMi_Pitch_Count);
		CreateInvItems(slf,ItPo_Mana_01,Cronos_NW_ItPo_Mana_01_Count);
		CreateInvItems(slf,ItPo_Health_01,Cronos_NW_ItPo_Health_01_Count);
		CreateInvItems(slf,ItSc_Light,Cronos_NW_ItSc_Light_Count);
		CreateInvItems(slf,ItSc_Firebolt,Cronos_NW_ItSc_Firebolt_Count);
		CreateInvItems(slf,ItSc_Zap,Cronos_NW_ItSc_Zap_Count);
		CreateInvItems(slf,ItSc_LightHeal,Cronos_NW_ItSc_LightHeal_Count);
		CreateInvItems(slf,ItSc_SumGobSkel,Cronos_NW_ItSc_SumGobSkel_Count);
		CreateInvItems(slf,ItSc_Icelance,Cronos_NW_ItSc_Icelance_Count);
		CreateInvItems(slf,ItSc_Whirlwind,Cronos_NW_ItSc_Whirlwind_Count);
		Cronos_NW_ItemsGiven_Chapter_1 = TRUE;
	};
};

