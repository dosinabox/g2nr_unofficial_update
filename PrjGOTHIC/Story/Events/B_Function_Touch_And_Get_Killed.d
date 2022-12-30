
func void B_Function_Touch_And_Get_Killed()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	}
	else
	{
		B_KillNpc(self);
	};
};

