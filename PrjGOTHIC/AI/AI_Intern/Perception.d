
func void InitPerceptions()
{
	Perc_SetRange(PERC_ASSESSDAMAGE,9999);
	Perc_SetRange(PERC_ASSESSOTHERSDAMAGE,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSDEFEAT,WATCHFIGHT_DIST_MAX);
	Perc_SetRange(PERC_ASSESSMURDER,PERC_DIST_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSTHREAT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_DRAWWEAPON,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,3000);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTHEFT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSUSEMOB,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSENTERROOM,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSMAGIC,9999);
	Perc_SetRange(PERC_ASSESSSTOPMAGIC,9999);
	Perc_SetRange(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSWARN,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_MOVEMOB,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSSURPRISE,FIGHT_DIST_CANCEL);
	Perc_SetRange(PERC_OBSERVEINTRUDER,100);
	Perc_SetRange(PERC_ASSESSREMOVEWEAPON,100);
	Perc_SetRange(PERC_CATCHTHIEF,100);
	Perc_SetRange(PERC_ASSESSCALL,100);
	Perc_SetRange(PERC_MOVENPC,100);
	Perc_SetRange(PERC_ASSESSCASTER,100);
	Perc_SetRange(PERC_NPCCOMMAND,100);
	Perc_SetRange(PERC_OBSERVESUSPECT,100);
};

func void Perception_Set_Normal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	if(Npc_KnowsInfo(self,1) || C_NpcIsGateGuard(self))
	{
		Npc_SetPercTime(self,0.3);
	}
	else
	{
		Npc_SetPercTime(self,1);
	};
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessPortalCollision);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessThreat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessDrawWeapon);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
};

func void Perception_Set_Minimal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessPortalCollision);
};

func void B_ClearPerceptions(var C_Npc slf)
{
	Npc_PercDisable(slf,PERC_ASSESSPLAYER);
	Npc_PercDisable(slf,PERC_ASSESSENEMY);
	Npc_PercDisable(slf,PERC_ASSESSBODY);
	Npc_PercDisable(slf,PERC_ASSESSMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSMURDER);
	Npc_PercDisable(slf,PERC_ASSESSTHEFT);
	Npc_PercDisable(slf,PERC_ASSESSUSEMOB);
	Npc_PercDisable(slf,PERC_ASSESSENTERROOM);
	Npc_PercDisable(slf,PERC_ASSESSTHREAT);
	Npc_PercDisable(slf,PERC_DRAWWEAPON);
	Npc_PercDisable(slf,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(slf,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(slf,PERC_ASSESSWARN);
	Npc_PercDisable(slf,PERC_ASSESSTALK);
	Npc_PercDisable(slf,PERC_MOVEMOB);
	Npc_PercDisable(slf,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSSURPRISE);
};

func void Perception_Set_Monster_Rtn()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
};

