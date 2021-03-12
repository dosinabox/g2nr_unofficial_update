
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

func void B_UseStoneTablet(var int tablet)
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
	};
	if(tablet == 1)
	{
		AI_UseItemToState(self,ItMi_Addon_Stone_01,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_Addon_Stone_01,-1);
	}
	else if(tablet == 2)
	{
		AI_UseItemToState(self,ItMi_Addon_Stone_02,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_Addon_Stone_02,-1);
	}
	else if(tablet == 3)
	{
		AI_UseItemToState(self,ItMi_Addon_Stone_03,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_Addon_Stone_03,-1);
	}
	else if(tablet == 4)
	{
		AI_UseItemToState(self,ItMi_Addon_Stone_04,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_Addon_Stone_04,-1);
	}
	else if(tablet == 5)
	{
		AI_UseItemToState(self,ItMi_Addon_Stone_05,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_Addon_Stone_05,-1);
	};
	if(Hlp_IsValidNpc(target))
	{
		B_LookAtNpc(self,hero);
	};
};

func void B_UseFakeHeroFace(var C_Npc slf,var C_Npc oth)
{
	var C_Npc target;
	if(C_BodyStateContains(slf,BS_SIT))
	{
		AI_Standup(slf);
		B_TurnToNpc(slf,oth);
	};
	AI_RemoveWeapon(slf);
	CreateInvItem(slf,Fakeheroface);
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(slf);
		AI_UseItemToState(slf,Fakeheroface,1);
		AI_Wait(slf,1);
		AI_UseItemToState(slf,Fakeheroface,-1);
		B_LookAtNpc(slf,oth);
	}
	else
	{
		AI_UseItemToState(slf,Fakeheroface,1);
		AI_Wait(slf,1);
		AI_UseItemToState(slf,Fakeheroface,-1);
	};
};

func void B_UseFakeMap(var float time)
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
		AI_Wait(self,time);
		AI_UseItemToState(self,Fakemap,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakemap,1);
		AI_Wait(self,time);
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

