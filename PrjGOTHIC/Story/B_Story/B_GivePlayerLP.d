
func void B_GivePlayerLP(var int add_lp)
{
	hero.lp += add_lp;
	PrintScreen(ConcatStrings(PRINT_LearnLP,IntToString(add_lp)),-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
};

