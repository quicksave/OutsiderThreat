class rhs_faction_usarmy_d : faction
{
	class base : type
	{
		uniform[] = {"rhs_uniform_cu_ocp"};
		helmet[] = {"rhsusf_ach_helmet_ocp"};
		vest[] = {"rhsusf_iotv_ocp_Rifleman"};
		pack[] = {"rhsusf_assault_eagleaiii_ocp"};
		
		class primary : m4a1 {};
	};
	
	class r : base
	{
		mags[] = {{"rhs_mag_m67",3}, {"rhs_mag_an_m8hc", 2}};
	};
	
	class rat : r
	{
		class secondary : m136_hedp {};
	};
	
	class ar : r
	{
		class primary : m249 {};
		vest[] = {"rhsusf_iotv_ocp_SAW"};
	};
	
	class aar : r
	{
		packmags[] = {{"rhs_200rnd_556x45_M_SAW",1},{"rhs_200rnd_556x45_T_SAW",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"rhs_mag_an_m8hc", 6}};
		vest[] = {"rhsusf_iotv_ocp_Medic"};
	};
	class dm : r
	{
		class primary : m4a1
		{
			optic = "RH_ta31rco";
			bipod = "rhsusf_acc_harris_bipod";
		};
	};
	class gren : base
	{
		class priamry : m4a1_m320 {};
		mags[] = {{"rhs_mag_m67",2}, {"rhs_mag_an_m8hc", 3}};
		vest[] = {"rhsusf_iotv_ocp_Grenadier"};
	};
	
	class ftl : gren
	{
		vest[] = {"rhsusf_iotv_ocp_Teamleader"};
	};
	class dc : ftl
	{
		class priamry : m4a1_m320
		{
			optic = "RH_ta31rco";
		};
		vest[] = {"rhsusf_iotv_ocp_Squadleader"};
	};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : m240 {};
	};
	class mmgag : aar
	{
		packmags[] = {{"rhsusf_100Rnd_762x51",3}};
	};
	
	class hmgg : r
	{
		pack[] = {"RHS_M2_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_M2_MiniTripod_Bag"};
	};
	
	class matg : r
	{
		class secondary : maaws {};
	};
	class matag : aar
	{
		packmags[] = {{"MAAWS_HEDP",3}};
	};
	
	class hatg : r
	{
		pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : r
	{
		pack[] = {"B_HMG_01_support_F"};
	};
	
	class msamg : r
	{
		class secondary : stinger {};
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_fim92_mag",1}};
	};
};