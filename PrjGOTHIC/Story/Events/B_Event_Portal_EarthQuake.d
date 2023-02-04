
func void B_Event_Portal_EarthQuake()
{
	var int randy;
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	randy = Hlp_Random(4);
	if(randy == 0)
	{
		Snd_Play("Ravens_Earthquake4");
	}
	else if(randy == 1)
	{
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
	}
	else if(randy == 2)
	{
		Snd_Play("Ravens_Earthquake3");
		Snd_Play("Ravens_Earthquake1");
	}
	else
	{
		Snd_Play("Ravens_Earthquake3");
	};
};


var int B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime;

func void B_Event_Portal_First_EarthQuake()
{
	if(B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		B_EVENT_PORTAL_FIRST_EARTHQUAKE_OneTime = TRUE;
	};
};

