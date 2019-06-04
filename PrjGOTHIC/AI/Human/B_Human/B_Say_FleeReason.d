
func void B_Say_FleeReason()
{
	var int rnd;
	rnd = Hlp_Random(3);
	if(rnd < 1)
	{
		B_Say_Overlay(self,self,"$RUNAWAY");
	}
	else if((rnd == 1) && (self.voice != 6) && (self.voice != 9) && (self.voice != 11) && (self.voice != 12) && (self.voice != 14))
	{
		B_Say_Overlay(self,self,"$SPAREME");
	}
	else
	{
		B_Say_Overlay(self,self,"$HELP");
	};
};

