
var int TotalThefts;
var int TotalTheftXP;
var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
const int ThiefXP = 50;

func void B_GiveThiefXP()
{
	var int CurrentThiefXP;
	TotalThefts += 1;
	VictimCount += 1;
	if(VictimLevel == 0)
	{
		VictimLevel = 2;
	};
	if(VictimCount >= VictimLevel)
	{
		ThiefLevel += 1;
		VictimLevel = VictimCount + ThiefLevel;
	};
	CurrentThiefXP = ThiefXP + (ThiefLevel * 10);
	TotalTheftXP += CurrentThiefXP;
	B_GivePlayerXP(CurrentThiefXP);
};

func void B_ResetThiefLevel()
{
	if(VictimCount > ThiefLevel)
	{
		VictimCount -= 1;
	};
};

