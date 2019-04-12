
func void B_MemorizePlayerCrime(var C_Npc slf,var C_Npc taeter,var int crime)
{
	if(!Npc_IsPlayer(taeter))
	{
		return;
	};
	if(slf.guild == GIL_DMT)
	{
		return;
	};
	if(crime > B_GetPlayerCrime(slf))
	{
		B_DeletePetzCrime(slf);
		B_AddPetzCrime(slf,crime);
	};
	if(crime >= B_GetPlayerCrime(slf))
	{
		slf.aivar[AIV_NpcSawPlayerCommit] = crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] = Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] = B_GetCurrentAbsolutionLevel(slf);
	};
};

