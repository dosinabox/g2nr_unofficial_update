
func void B_AssignDragonTalk(var C_Npc slf)
{
	if(slf.guild == GIL_DRAGON)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SwampDragon))
		{
			B_AssignDragonTalk_Swamp(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RockDragon))
		{
			B_AssignDragonTalk_Rock(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireDragon))
		{
			B_AssignDragonTalk_Fire(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IceDragon))
		{
			B_AssignDragonTalk_Ice(slf);
		};
	};
};

