
func void B_CloseTopics_Hoshi()
{
	B_CloseTopic(TOPIC_RescueBennet,MIS_RescueBennet,0,4);
	B_CloseTopic(Topic_Ship,0,MIS_ReadyforChapter6,6);
	B_CloseTopic(Topic_Captain,0,SCGotCaptain,6);
	B_CloseTopic(Topic_Crew,0,MIS_ShipIsFree,6);
	B_CloseTopic(Topic_Crew,0,MIS_ReadyforChapter6,6);
	B_CloseTopic(TOPIC_Addon_RatHunt,MIS_KrokoJagd,0,6);
	B_CloseTopic(TOPIC_Addon_BringMeat,MIS_AlligatorJack_BringMeat,GregIsBack,6);
	B_CloseTopic(TOPIC_Addon_BanditsTower,MIS_Henry_FreeBDTTower,TowerBanditsDead,6);
	B_CloseTopic(TOPIC_Addon_HolOwen,MIS_Henry_HolOwen,0,6);
	B_CloseTopic(TOPIC_Addon_Kompass,MIS_ADDON_GARett_BringKompass,0,6);
	B_CloseTopic(TOPIC_Addon_RoastGrog,0,PIR_1364_Grog,6);
	B_CloseTopic(TOPIC_Addon_BrandonBooze,MIS_Brandon_BringHering,0,6);
	B_CloseTopic(TOPIC_Addon_MorganBeach,MIS_Addon_MorganLurker,0,6);
	B_CloseTopic(TOPIC_Addon_SkipsGrog,MIS_ADDON_SkipsGrog,0,6);
	B_CloseTopic(TOPIC_Addon_KillJuan,MIS_Addon_Bill_SearchAngusMurder,0,6);
	B_CloseTopic(TOPIC_Addon_ClearCanyon,MIS_Addon_Greg_ClearCanyon,0,6);
	B_CloseTopic(TOPIC_Addon_ScoutBandits,MIS_Greg_ScoutBandits,0,6);
	B_CloseTopic(TOPIC_Addon_MalcomsStunt,MIS_Owen_FindMalcom,0,6);
};

