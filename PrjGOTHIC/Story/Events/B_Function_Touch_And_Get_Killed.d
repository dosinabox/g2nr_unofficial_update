
func void b_function_touch_and_get_killed()
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

