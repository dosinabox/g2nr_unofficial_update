
func void B_UseFakeScroll()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakescroll);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
	};
};

func void B_UseFakeScroll_Hero()
{
	var C_Npc target;
	if(C_BodyStateContains(hero,BS_SIT))
	{
		AI_Standup(hero);
		B_TurnToNpc(hero,self);
	};
	AI_RemoveWeapon(hero);
	CreateInvItem(hero,Fakeheroface);
	target = Npc_GetLookAtTarget(hero);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(hero);
		AI_UseItemToState(hero,Fakeheroface,1);
		AI_Wait(hero,1);
		AI_UseItemToState(hero,Fakeheroface,-1);
		B_LookAtNpc(hero,self);
	}
	else
	{
		AI_UseItemToState(hero,Fakeheroface,1);
		AI_Wait(hero,1);
		AI_UseItemToState(hero,Fakeheroface,-1);
	};
};

func void B_UseFakeHeroFace()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakeheroface);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakeheroface,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakeheroface,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakeheroface,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakeheroface,-1);
	};
};

func void B_UseFakeMap()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakemap);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakemap,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,Fakemap,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakemap,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,Fakemap,-1);
	};
};

func void B_UseOpenBook1()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Openbook1);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Openbook1,1);
		AI_Wait(self,3);
		AI_UseItemToState(self,Openbook1,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Openbook1,1);
		AI_Wait(self,3);
		AI_UseItemToState(self,Openbook1,-1);
	};
};

