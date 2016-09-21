class p07 : weapon
{
	wepname = "hgun_P07_F";
	defmag = "16Rnd_9x21_Mag";
	extradefmags = 2;
};

class p07k : p07
{
	wepname = "hgun_P07_khk_F";
};

class rook : p07
{
	wepname = "hgun_Rook40_F";
};

class pm : p07
{
	wepname = "hgun_Pistol_01_F";
	defmag = "10Rnd_9x21_Mag";
};

class 4five : p07
{
	wepname = "hgun_Pistol_heavy_01_F";
	defmag = "11Rnd_45ACP_Mag";
};

class acp : 4five
{
	wepname = "hgun_ACPC2_F";
	defmag = "9Rnd_45ACP_Mag";
};

class zubr : 4five
{
	wepname = "hgun_Pistol_heavy_02_F";
	defmag = "6Rnd_45ACP_Cylinder";
	extradefmags = 2;
};
