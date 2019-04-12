
var int PlayerMapInstance;

func int B_GetPlayerMap()
{
	return PlayerMapInstance;
};

func int B_SetPlayerMap(var int MapInstance)
{
	PlayerMapInstance = MapInstance;
	return PlayerMapInstance;
};

