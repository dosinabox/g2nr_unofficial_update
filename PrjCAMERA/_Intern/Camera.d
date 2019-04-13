
class CCAMSYS
{
	var float bestrange;
	var float minrange;
	var float maxrange;
	var float bestelevation;
	var float minelevation;
	var float maxelevation;
	var float bestazimuth;
	var float minazimuth;
	var float maxazimuth;
	var float bestrotz;
	var float minrotz;
	var float maxrotz;
	var float rotoffsetx;
	var float rotoffsety;
	var float rotoffsetz;
	var float targetoffsetx;
	var float targetoffsety;
	var float targetoffsetz;
	var float velotrans;
	var float velorot;
	var int translate;
	var int rotate;
	var int collision;
};

prototype CCAMSYS_DEF(CCAMSYS)
{
	bestrange = 2;
	minrange = 1.99;
	maxrange = 4.01;
	bestelevation = 0;
	minelevation = 0;
	maxelevation = 89;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	bestrotz = 0;
	minrotz = 0;
	maxrotz = 0;
	rotoffsetx = 20;
	rotoffsety = 0;
	rotoffsetz = 0;
	targetoffsetx = 0;
	targetoffsety = 0;
	targetoffsetz = 0;
	translate = 1;
	rotate = 1;
	collision = 1;
	velotrans = 40;
	velorot = 2;
};

