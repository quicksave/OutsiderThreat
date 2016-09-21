class spar16 : weapon
{
	wepname = "arifle_SPAR_01_blk_F";
	defmag = "30Rnd_556x45_Stanag";
	extradefmags = 5;
	addmags[] = {{"30Rnd_556x45_Stanag_red",2}};
	optic = "optic_Aco";
	rail = "acc_pointer_IR";
};

class spar16gl : spar16
{
	wepname = "arifle_SPAR_01_GL_blk_F";
	defglmag = "1Rnd_HE_Grenade_shell";
	extradefglmags = 5
};

class spar16s : spar16
{
	wepname = "arifle_SPAR_02_blk_F";
	defmag = "150Rnd_556x45_Drum_Mag_F";
	extradefmags = 2;
	optic = "";
	bipod = "bipod_01_F_blk";
};

class spar17 : spar16
{
	wepname = "arifle_SPAR_03_blk_F";
	defmag = "20Rnd_762x51_Mag";
};

class spar17dm : spar17
{
	optic = "optic_SOS";
	bipod = "bipod_01_F_blk";
};
