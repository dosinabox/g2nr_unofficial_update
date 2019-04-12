
func void B_ValidateOther()
{
	if(!Hlp_IsValidNpc(other))
	{
		other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		Npc_SetTarget(self,other);
		self.aivar[AIV_LOADGAME] = TRUE;
	}
	else
	{
		Npc_GetTarget(self);
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		self.aivar[AIV_LOADGAME] = FALSE;
	};
};

