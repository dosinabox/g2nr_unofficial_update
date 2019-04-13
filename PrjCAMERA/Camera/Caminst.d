
instance CAMMODDIALOG(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 2.5;
	maxrange = 3.5;
	bestelevation = 10;
	minelevation = 0;
	maxelevation = 90;
	bestazimuth = 45;
	minazimuth = -45;
	maxazimuth = 45;
	rotoffsetx = 0;
	rotoffsety = -20;
};

instance CAMMODLOOKBACK(CCAMSYS_DEF)
{
	bestrange = 0.5;
	minrange = 1;
	maxrange = 6;
	bestelevation = 35;
	minelevation = 0;
	maxelevation = 89;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 20;
	rotoffsety = 180;
	velorot = 5;
};

instance CAMMODNORMAL(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 2;
	maxrange = 10;
	bestelevation = 30;
	maxelevation = 90;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 23;
};

instance CAMMODINVENTORY(CCAMSYS_DEF)
{
	bestrange = 2.2;
	minrange = 2.9;
	maxrange = 3.1;
	bestelevation = 20;
	maxelevation = 90;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 0;
	rotoffsety = 0;
	velotrans = 30;
};

instance CAMMODMELEE(CCAMSYS_DEF)
{
	bestrange = 2.5;
	minrange = 1.4;
	maxrange = 10;
	bestelevation = 35;
	minelevation = 0;
	maxelevation = 89;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 20;
	rotoffsety = 0;
};

instance CAMMODRANGED(CCAMSYS_DEF)
{
	bestrange = 2.5;
	minrange = 1.4;
	maxrange = 10;
	bestelevation = 35;
	minelevation = 0;
	maxelevation = 89;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 20;
	rotoffsety = 0;
};

instance CAMMODMAGIC(CCAMSYS_DEF)
{
	bestrange = 2.5;
	minrange = 1.4;
	maxrange = 6;
	bestelevation = 35;
	minelevation = 0;
	maxelevation = 89;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 20;
	rotoffsety = 0;
};

instance CAMMODSWIM(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 2.9;
	maxrange = 5.1;
	bestelevation = 20;
	minelevation = 10;
	maxelevation = 45;
	bestazimuth = 0;
	minazimuth = -45;
	maxazimuth = 45;
	rotoffsetx = 15;
	rotoffsety = 0;
};

instance CAMMODDIVE(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 2;
	maxrange = 4;
	bestelevation = -20;
	minelevation = -60;
	maxelevation = -10;
	bestazimuth = 0;
	minazimuth = -45;
	maxazimuth = 45;
	rotoffsetx = -10;
	rotoffsety = 0;
	velotrans = 20;
	rotate = 0;
};

instance CAMMODJUMPUP(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 2.5;
	bestelevation = -30;
	minelevation = -90;
	maxelevation = 0;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	velotrans = 20;
};

instance CAMMODCLIMB(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1.5;
	maxrange = 2.5;
	bestelevation = 30;
	minelevation = -90;
	maxelevation = 90;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
};

instance CAMMODFALL(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 1.5;
	maxrange = 5.5;
	bestelevation = 60;
	minelevation = 0;
	maxelevation = 90;
	bestazimuth = 0;
	minazimuth = -89;
	maxazimuth = 89;
	rotoffsetx = 0;
	rotoffsety = 0;
	velotrans = 10;
};

instance CAMMODDEATH(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 2;
	maxrange = 10;
	bestelevation = 80;
	minelevation = 0;
	maxelevation = 90;
	bestazimuth = 180;
	minazimuth = -89;
	maxazimuth = 89;
	rotoffsetx = 0;
	rotoffsety = 0;
	velotrans = 10;
};

instance CAMMODFOCUS(CCAMSYS_DEF)
{
	bestrange = 2.5;
	minrange = 1.9;
	maxrange = 3.5;
	bestelevation = 25;
	minelevation = 0;
	maxelevation = 90;
	bestazimuth = 45;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 0;
	rotoffsety = 0;
};

instance CAMMODMOBDEFAULT(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 2;
	maxrange = 2;
	bestelevation = 35;
	minelevation = 15;
	maxelevation = 90;
	bestazimuth = 45;
	minazimuth = 0;
	maxazimuth = 90;
	rotoffsetx = 0;
	rotoffsety = 5;
};

instance CAMMODMOBDOOR_FRONT(CCAMSYS_DEF)
{
	bestrange = 1.25;
	minrange = 0.75;
	maxrange = 2;
	bestelevation = 40;
	maxelevation = 90;
	minelevation = 30;
	bestazimuth = 45;
	minazimuth = 30;
	maxazimuth = 60;
	rotoffsetx = 30;
	rotoffsety = -40;
};

instance CAMMODMOBDOOR_BACK(CCAMSYS_DEF)
{
	bestrange = 1.25;
	minrange = 0.75;
	maxrange = 2;
	bestelevation = 40;
	maxelevation = 60;
	minelevation = 30;
	bestazimuth = -45;
	minazimuth = -30;
	maxazimuth = -60;
	rotoffsetx = 30;
	rotoffsety = 40;
};

instance CAMMODMOBLADDER(CCAMSYS_DEF)
{
	bestrange = 3.5;
	minrange = 1.5;
	maxrange = 6;
	bestelevation = 0;
	maxelevation = 30;
	minelevation = -30;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 0;
	rotoffsety = 0;
};

instance CAMMODMOBBED(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
	rotoffsetx = 0;
	rotoffsety = 0;
};

instance CAMMODMOBBED_FRONT(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
	rotoffsetx = 0;
	rotoffsety = 0;
};

instance CAMMODMOBBED_BACK(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDHIGH(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDHIGH_FRONT(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDHIGH_BACK(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDLOW(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDLOW_FRONT(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBEDLOW_BACK(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 1;
	maxrange = 3;
	bestelevation = 80;
	maxelevation = 90;
	minelevation = 60;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 180;
};

instance CAMMODMOBBENCH(CCAMSYS_DEF)
{
	bestrange = 1.2;
	minrange = 0.5;
	maxrange = 1.9;
	bestelevation = 10;
	minelevation = 30;
	maxelevation = 90;
	bestazimuth = 0;
	minazimuth = -180;
	maxazimuth = 180;
	rotoffsetx = 0;
};

instance CAMMODMOBBARRELO(CCAMSYS_DEF)
{
	bestrange = 1.5;
	minrange = 0.5;
	maxrange = 3;
	bestelevation = 75;
	maxelevation = 90;
	minelevation = 0;
	bestazimuth = -30;
	minazimuth = -90;
	maxazimuth = 90;
	rotoffsetx = 20;
	rotoffsety = 0;
};

instance CAMMODFIRSTPERSON(CCAMSYS_DEF)
{
	bestrange = 2;
	minrange = 2;
	maxrange = 2;
	bestelevation = 0;
	minelevation = -90;
	maxelevation = 90;
	bestazimuth = 0;
	minazimuth = -45;
	maxazimuth = 45;
	rotoffsetx = 0;
	rotoffsety = 0;
	velorot = 10000;
	velotrans = 35;
};

instance CAMMODLOOK(CCAMSYS_DEF)
{
	bestrange = 3;
	minrange = 1.5;
	maxrange = 6.5;
	bestelevation = 30;
	minelevation = -55;
	maxelevation = 80;
	bestazimuth = 0;
	minazimuth = -90;
	maxazimuth = 90;
	velotrans = 35;
};

instance CAMMODRANGEDSHORT(CCAMSYS_DEF)
{
	bestrange = 0.5;
	minrange = 0.4;
	maxrange = 1.2;
	bestelevation = 60;
	minelevation = 40;
	maxelevation = 90;
	bestazimuth = 34;
	minazimuth = 34;
	maxazimuth = 34;
	rotoffsetx = 55;
	rotoffsety = -27;
};

instance CAMMODSHOULDER(CCAMSYS_DEF)
{
	bestrange = 0.75;
	minrange = 0.4;
	maxrange = 1.2;
	bestelevation = 80;
	minelevation = 40;
	maxelevation = 90;
	bestazimuth = 90;
	minazimuth = 0;
	maxazimuth = 0;
};

