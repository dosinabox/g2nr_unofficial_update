
func void PrintPlus(var string txt)
{
	var string ausgabe;
	var int zufall;
	var string zufallTxt;
	zufall = Hlp_Random(100);
	zufallTxt = IntToString(zufall);
	ausgabe = ConcatStrings(txt," ");
	ausgabe = ConcatStrings(ausgabe,zufallTxt);
	Print(ausgabe);
};

