
func void B_Upgrade_Hero_HackChance(var int Wert)
{
	if(Hero_HackChance < 100)
	{
		var string concatText;
		concatText = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(Wert));
		concatText = ConcatStrings(concatText,")");
		PrintScreen(concatText,-1,34,FONT_ScreenSmall,2);
		Hero_HackChance += Wert;
		Snd_Play("LEVELUP");
	};
	if(Hero_HackChance > 100)
	{
		Hero_HackChance = 100;
	};
};

