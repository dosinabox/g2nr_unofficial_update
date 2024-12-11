
func void B_AssignDragonTalk(var C_Npc slf)
{
	if(slf.guild == GIL_DRAGON)
	{
		if(C_IsNpc(slf,Dragon_Swamp))
		{
			B_AssignDragonTalk_Swamp(slf);
		}
		else if(C_IsNpc(slf,Dragon_Rock))
		{
			B_AssignDragonTalk_Rock(slf);
		}
		else if(C_IsNpc(slf,Dragon_Fire))
		{
			B_AssignDragonTalk_Fire(slf);
		}
		else if(C_IsNpc(slf,Dragon_Ice))
		{
			B_AssignDragonTalk_Ice(slf);
		};
	};
};

