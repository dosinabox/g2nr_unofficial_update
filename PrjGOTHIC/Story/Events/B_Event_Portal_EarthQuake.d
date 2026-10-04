
func void B_Event_Portal_EarthQuake()
{
	var int random;
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	random = Hlp_Random(4);
	if(random == 0)
	{
		Snd_Play("RAVENS_EARTHQUAKE4");
	}
	else if(random == 1)
	{
		Snd_Play("RAVENS_EARTHQUAKE4");
		Snd_Play("RAVENS_EARTHQUAKE2");
	}
	else if(random == 2)
	{
		Snd_Play("RAVENS_EARTHQUAKE3");
		Snd_Play("RAVENS_EARTHQUAKE1");
	}
	else
	{
		Snd_Play("RAVENS_EARTHQUAKE3");
	};
};

var int B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime;

func void B_Event_Portal_First_EarthQuake()
{
	if(B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("RAVENS_EARTHQUAKE4");
		B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime = TRUE;
	};
};

