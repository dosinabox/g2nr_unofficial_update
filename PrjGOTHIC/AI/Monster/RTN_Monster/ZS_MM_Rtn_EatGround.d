
func void ZS_MM_Rtn_EatGround()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"ROAM"))
	{
		AI_GotoFP(self,"ROAM");
	};
	AI_PlayAni(self,"T_STAND_2_EAT");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM1");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM2");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM3");
	Mdl_ApplyRandomAniFreq(self,"S_EAT",8);
	self.aivar[AIV_StateTime] = Hlp_Random(100) % 8 + 1;
};

func int ZS_MM_Rtn_EatGround_Loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_EatGroundStart],0,self.aivar[AIV_MM_EatGroundEnd],self.aivar[AIV_StateTime]) && (self.aivar[AIV_MM_EatGroundStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_EatGround_End()
{
	AI_PlayAni(self,"T_EAT_2_STAND");
};

