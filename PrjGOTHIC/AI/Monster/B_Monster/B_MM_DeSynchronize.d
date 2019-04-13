
func void B_MM_DeSynchronize()
{
/*	var int msec;
	msec = Hlp_Random(1000);
	AI_Waitms(self,msec); */
	var int random;
	random = Hlp_Random(100) % 5;
	if(random == 1)
	{
		AI_Wait(self,0.3);
	}
	else if(random == 2)
	{
		AI_Wait(self,0.6);
	}
	else if(random == 3)
	{
		AI_Wait(self,0.9);
	}
	else if(random == 4)
	{
		AI_Wait(self,1.2);
	};
};

