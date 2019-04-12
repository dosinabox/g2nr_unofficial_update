
func void ZS_Dance()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func int ZS_Dance_Loop()
{
	var int danceStyle;
	danceStyle = Hlp_Random(9);
	if(danceStyle == 0)
	{
		AI_PlayAni(self,"T_DANCE_01");
	};
	if(danceStyle == 1)
	{
		AI_PlayAni(self,"T_DANCE_02");
	};
	if(danceStyle == 2)
	{
		AI_PlayAni(self,"T_DANCE_03");
	};
	if(danceStyle == 3)
	{
		AI_PlayAni(self,"T_DANCE_04");
	};
	if(danceStyle == 4)
	{
		AI_PlayAni(self,"T_DANCE_05");
	};
	if(danceStyle == 5)
	{
		AI_PlayAni(self,"T_DANCE_06");
	};
	if(danceStyle == 6)
	{
		AI_PlayAni(self,"T_DANCE_07");
	};
	if(danceStyle == 7)
	{
		AI_PlayAni(self,"T_DANCE_08");
	};
	if(danceStyle == 8)
	{
		AI_PlayAni(self,"T_DANCE_09");
	};
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void ZS_Dance_End()
{
	AI_Standup(self);
};

