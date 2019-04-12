
var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
const int ThiefXP = 50;

func void B_GiveThiefXP()
{
	VictimCount = VictimCount + 1;
	if(VictimLevel == 0)
	{
		VictimLevel = 2;
	};
	if(VictimCount >= VictimLevel)
	{
		ThiefLevel = ThiefLevel + 1;
		VictimLevel = VictimCount + ThiefLevel;
	};
	B_GivePlayerXP(ThiefXP + (ThiefLevel * 10));
};

func void B_ResetThiefLevel()
{
	if(VictimCount > ThiefLevel)
	{
		VictimCount = VictimCount - 1;
	};
};

