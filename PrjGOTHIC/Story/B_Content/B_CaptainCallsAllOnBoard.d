
func void B_CaptainCallsAllOnBoard(var C_Npc Captain)
{
	B_GiveInvItems(hero,Captain,ItWr_Seamap_Irdorath,1);
	CreateInvItems(Captain,ItKe_Ship_Levelchange_MIS,1);
	B_GiveInvItems(Captain,other,ItKe_Ship_Levelchange_MIS,1);
	B_StartOtherRoutine(Captain,"AllOnBoard");
	if(Lee_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lee,"Ship");
	};
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(MiltenNW,"Ship");
	};
	if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lester,"Ship");
	};
	if(Gorn_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(GornNW_nach_DJG,"Ship");
	};
	if(Mario_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Mario,"Ship");
	};
	if(Wolf_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(SLD_Wolf,"Ship");
	};
	if(Lares_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lares,"Ship");
	};
	if(Bennet_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Bennet,"Ship");
	};
	if(Diego_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(DiegoNW,"Ship");
	};
	if(Biff_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Biff_NW,"Ship");
	};
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Vatras,"Ship");
	};
	if(Angar_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Angar_NW,"Ship");
	};
	if(Girion_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Girion,"Ship");
	};
	MIS_ReadyforChapter6 = TRUE;
};

