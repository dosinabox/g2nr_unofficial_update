
func void B_Say_Gold(var C_Npc slf,var C_Npc oth,var int goldAmount)
{
	B_Say(slf,oth,ConcatStrings("$GOLD_",IntToString(goldAmount)));
};

