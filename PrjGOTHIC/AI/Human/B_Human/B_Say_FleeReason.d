
func void B_Say_FleeReason()
{
	var int rnd;
	rnd = Hlp_Random(3);
	if(rnd < 1)
	{
		B_Say_Overlay(self,other,"$RUNAWAY");
	}
	else if(rnd == 1)
	{
		B_Say_Overlay(self,other,"$SPAREME");
	}
	else
	{
		B_Say_Overlay(self,other,"$HELP");
	};
};

