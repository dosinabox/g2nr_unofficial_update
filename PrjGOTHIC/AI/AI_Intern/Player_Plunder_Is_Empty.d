
func void Player_Plunder_Is_Empty()
{
	var int rnd;
	rnd = Hlp_Random(100);
	if(rnd <= 40)
	{
		Print(PRINT_NOTHINGTOGET);
		B_Say_Overlay(self,self,"$NOTHINGTOGET");
	}
	else if(rnd <= 80)
	{
		Print(PRINT_NOTHINGTOGET02);
		B_Say_Overlay(self,self,"$NOTHINGTOGET02");
	}
	else
	{
		Print(PRINT_NOTHINGTOGET03);
		B_Say_Overlay(self,self,"$NOTHINGTOGET03");
	};
};

