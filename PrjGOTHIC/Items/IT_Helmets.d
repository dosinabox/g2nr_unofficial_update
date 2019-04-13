
INSTANCE ITHE_OHT(C_Item)
{
    name = "Шлем охотника на орков";
    mainflag = ITEM_KAT_ARMOR;
    flags = 0;
    protection[PROT_EDGE] = 15;
    protection[PROT_BLUNT] = 15;
    protection[PROT_POINT] = 15;
    protection[PROT_FIRE] = 5;
    protection[PROT_MAGIC] = 5;
    value = 1000;
    wear = WEAR_Head;
    visual = "ITHE_OHT.3ds";
    visual_skin = 0;
    material = MAT_LEATHER;
    description = name;
    text[1] = NAME_Prot_Edge;
    count[1] = protection[PROT_EDGE];
    text[2] = NAME_Prot_Point;
    count[2] = protection[PROT_POINT];
    text[3] = NAME_Prot_Fire;
    count[3] = protection[PROT_FIRE];
    text[4] = NAME_Prot_Magic;
    count[4] = protection[PROT_MAGIC];
    text[5] = NAME_Value;
    count[5] = value;
};

INSTANCE ITHE_DJG_M(C_Item)
{
    name = "Шлем охотника на драконов";
    mainflag = ITEM_KAT_ARMOR;
    flags = 0;
    protection[PROT_EDGE] = 5;
    protection[PROT_BLUNT] = 5;
    protection[PROT_POINT] = 5;
    protection[PROT_FIRE] = 5;
    protection[PROT_MAGIC] = 5;
    value = 1000;
    wear = WEAR_Head;
    visual = "ITHE_DJG_M.3ds";
    visual_skin = 0;
    material = MAT_LEATHER;
    description = name;
    text[1] = NAME_Prot_Edge;
    count[1] = protection[PROT_EDGE];
    text[2] = NAME_Prot_Point;
    count[2] = protection[PROT_POINT];
    text[3] = NAME_Prot_Fire;
    count[3] = protection[PROT_FIRE];
    text[4] = NAME_Prot_Magic;
    count[4] = protection[PROT_MAGIC];
    text[5] = NAME_Value;
    count[5] = value;
};

INSTANCE ITHE_DJG_H(C_Item)
{
    name = "Крепкий шлем охотника на драконов";
    mainflag = ITEM_KAT_ARMOR;
    flags = 0;
    protection[PROT_EDGE] = 10;
    protection[PROT_BLUNT] = 10;
    protection[PROT_POINT] = 10;
    protection[PROT_FIRE] = 10;
    protection[PROT_MAGIC] = 10;
    value = 2000;
    wear = WEAR_Head;
    visual = "ITHE_DJG_H.3ds";
    visual_skin = 0;
    material = MAT_LEATHER;
    description = name;
    text[1] = NAME_Prot_Edge;
    count[1] = protection[PROT_EDGE];
    text[2] = NAME_Prot_Point;
    count[2] = protection[PROT_POINT];
    text[3] = NAME_Prot_Fire;
    count[3] = protection[PROT_FIRE];
    text[4] = NAME_Prot_Magic;
    count[4] = protection[PROT_MAGIC];
    text[5] = NAME_Value;
    count[5] = value;
};

INSTANCE ITHE_PAL_M(C_Item)
{
    name = "Кольчужный капюшон";
    mainflag = ITEM_KAT_ARMOR;
    flags = 0;
    protection[PROT_EDGE] = 5;
    protection[PROT_BLUNT] = 5;
    protection[PROT_POINT] = 5;
    protection[PROT_FIRE] = 5;
    protection[PROT_MAGIC] = 5;
    value = 1000;
    wear = WEAR_Head;
    visual = "ITHE_PAL_M.3ds";
    visual_skin = 0;
    material = MAT_METAL;
    description = name;
    text[1] = NAME_Prot_Edge;
    count[1] = protection[PROT_EDGE];
    text[2] = NAME_Prot_Point;
    count[2] = protection[PROT_POINT];
    text[3] = NAME_Prot_Fire;
    count[3] = protection[PROT_FIRE];
    text[4] = NAME_Prot_Magic;
    count[4] = protection[PROT_MAGIC];
    text[5] = NAME_Value;
    count[5] = value;
    inv_zbias = 130;
};

INSTANCE ITHE_PAL_H(C_Item)
{
    name = "Шлем паладина";
    mainflag = ITEM_KAT_ARMOR;
    flags = 0;
    protection[PROT_EDGE] = 10;
    protection[PROT_BLUNT] = 10;
    protection[PROT_POINT] = 10;
    protection[PROT_FIRE] = 10;
    protection[PROT_MAGIC] = 10;
    value = 2000;
    wear = WEAR_Head;
    visual = "ITHE_PAL_H_CLOSED.3ds";
    visual_skin = 0;
    material = MAT_METAL;
    description = name;
    text[1] = NAME_Prot_Edge;
    count[1] = protection[PROT_EDGE];
    text[2] = NAME_Prot_Point;
    count[2] = protection[PROT_POINT];
    text[3] = NAME_Prot_Fire;
    count[3] = protection[PROT_FIRE];
    text[4] = NAME_Prot_Magic;
    count[4] = protection[PROT_MAGIC];
    text[5] = NAME_Value;
    count[5] = value;
    inv_zbias = 130;
};

