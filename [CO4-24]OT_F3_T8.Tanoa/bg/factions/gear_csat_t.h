class opf_f : faction
{
	class base : type
	{
		uniform[] = {"U_O_T_Soldier_F"};
		helmet[] = {"H_HelmetO_ghex_F"};
		vest[] = {"V_TacVest_oli", "V_HarnessOGL_ghex_F"};
		pack[] = {"B_FieldPack_ghex__F"};

		class primary : car95 {};
	};

	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};

	class rat : r
	{
		class secondary : rpg26
		{
			wepname = "launch_RPG32_ghex_F";
		};
	};

	class ar : r
	{
		class primary : car95ar {};
	};

	class aar : r
	{
		packmags[] = {{"100Rnd_580x42_Mag_F",2}};
		binos[] = {"Binocular"};
	};

	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	class dm : r
	{
		class primary : cmr76 {};
	};
	class gren : base
	{
		class primary : car95gl {};
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
		vest[] = {"V_HarnessOGL_ghex_F"};
	};

	class ftl : gren {};
	class dc : ftl
	{
		class primary : car95gl
		{
			optic = "optic_Arco_ghex_F";
		};
	};
	class co : dc {};

	class mmgg : r
	{
		class primary : navid {};
	};
	class mmgag : aar
	{
		packmags[] = {{"150Rnd_93x64_Mag",3}};
	};

	class hmgg : r
	{
		pack[] = {"RHS_NSV_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_NSV_Tripod_Bag"};
	};

	class matg : r
	{
		class secondary : rpg42 {};
	};
	class matag : aar
	{
		packmags[] = {{"RPG32_F",2}};
	};

	class hatg : r
	{
		pack[] = {"O_AT_01_weapon_F"};
	};
	class hatag : r
	{
		pack[] = {"O_HMG_01_support_F"};
	};

	class msamg : r
	{
		class secondary : titanaa_brn {};
		packmags[] = {{"Titan_AA",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"Titan_AA",2}};
	};
};
