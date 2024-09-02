//эта настройка нужна для адаптации мода под Union
//урон заклинания остается неизменным (500)
//не менять!

const int SPL_Damage_FireRain = 250;

instance ItRu_Firerain(C_Item)
{
	ItRu_Firerain_Old();
	count[2] = 500;
};

instance ItSc_Firerain(C_Item)
{
	ItSc_Firerain_Old();
	count[2] = 500;
};
