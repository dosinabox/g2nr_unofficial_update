
func void B_CaptainCallsAllOnBoard(var C_Npc captain)
{
	CreateInvItem(captain,ItKe_Ship_Levelchange_MIS);
	B_GiveInvItems(captain,other,ItKe_Ship_Levelchange_MIS,1);
	B_StartOtherRoutine(captain,"ALLONBOARD");
	if(Lee_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lee,"SHIP");
	};
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(MiltenNW,"SHIP");
	};
	if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lester,"SHIP");
	};
	if(Gorn_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(GornNW_nach_DJG,"SHIP");
	};
	if(Mario_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Mario,"SHIP");
	};
	if(Wolf_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(SLD_Wolf,"SHIP");
	};
	if(Lares_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lares,"SHIP");
	};
	if(Bennet_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Bennet,"SHIP");
	};
	if(Diego_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(DiegoNW,"SHIP");
	};
	if(Biff_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Biff_NW,"SHIP");
	};
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Vatras,"SHIP");
	};
	if(Angar_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Angar_NW,"SHIP");
	};
	if(Girion_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Girion,"SHIP");
	};
	MIS_ReadyforChapter6 = TRUE;
	B_CheckLog();
};

