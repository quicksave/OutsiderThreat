class blu_t_f : faction
{
	class base : type
	{
		uniform[] = {"U_B_T_Soldier_AR_F", "U_B_T_Soldier_SL_F", "U_B_T_Soldier_SL_F", "U_B_T_Soldier_F", "U_B_T_Soldier_F", "U_B_T_Soldier_F", "U_B_T_Soldier_F", "U_B_T_Soldier_F"};
		helmet[] = {"H_HelmetB_tna_F"};
		vest[] = {"V_PlateCarrierSpec_tna_F"};
		pack[] = {"B_AssaultPack_tna_F"};
		
		class primary : mx 
		{
			wepname = "arifle_MX_khk_F";
		};
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		class secondary : m136_hedp {};
	};
	
	class ar : r
	{
		uniform[] = {"U_B_T_Soldier_AR_F", "U_B_T_Soldier_SL_F"};
		class primary : mx_sw
		{	
			wepname = "arifle_MX_SW_khk_F";
		};
	};
	
	class aar : r
	{
		packmags[] = {{"100Rnd_65x39_caseless_mag",2},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	class dm : r
	{
		class primary : mxm
		{	
			wepname = "arifle_MXM_khk_F";
		};
	};
	class gren : base
	{
		class primary : mx_3gl 
		{
			wepname = "arifle_MX_GL_khk_F";
		};
		mags[] = {{"HandGrenade",2}, {"SmokeShell", 4}};
	};
	
	class ftl : gren
	{
		helmet[] = {"H_HelmetB_Enh_tna_F"};
		
		class primary : mx_3gl
		{
			optic = "optic_Arco_blk_F";
		};
	};
	class dc : ftl {};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : spmg {};
	};
	
	class mmgag : aar
	{
		packmags[] = {{"130Rnd_338_Mag",3}};
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
		class secondary : titanc
		{
			wepname = "launch_B_Titan_short_tna_F";
		};
		pack[] = {"B_Carryall_oli"};
	};
	class matag : aar
	{
		packmags[] = {{"Titan_AT",3}};
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
		class secondary : titanaa 
		{
			wepname = "launch_B_Titan_tna_F";
		};
		pack[] = {"B_Carryall_oli"};
	};
	class msamag : r
	{
		packmags[] = {{"Titan_AA",3}};
	};

	
	#include "crate\crate_nato.h"
	#include "vehicle\veh_nato.h"
};