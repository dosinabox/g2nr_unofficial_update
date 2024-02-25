
func void B_CancelBengarMilitiaProblem()
{
	if(MIS_Torlof_BengarMilizKlatschen == LOG_Running)
	{
		if(!Npc_IsDead(Rick))
		{
			Npc_ExchangeRoutine(Rick,"FLUCHT3");
			Rick.aivar[AIV_DropDeadAndKill] = FALSE;
		};
		if(!Npc_IsDead(Rumbold))
		{
			Npc_ExchangeRoutine(Rumbold,"FLUCHT3");
			Rumbold.aivar[AIV_DropDeadAndKill] = FALSE;
		};
		if(!Npc_IsDead(Bengar))
		{
			Npc_ExchangeRoutine(Bengar,"START");
		};
		MIS_Torlof_BengarMilizKlatschen = LOG_FAILED;
	};
};

