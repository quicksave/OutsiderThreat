class ind_f : faction
{
	class base : type
	{
		uniform[] = {"U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"};
		helmet[] = {"H_HelmetIA"};
		vest[] = {"V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIA2_dgtl"};
		pack[] = {"B_AssaultPack_dgtl"};
		
		#include "weapon_mk20.h"
	};

	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
		pack[] = {""};
	};
	
	class rat : r
	{
		#include "weapon_nlaw.h"
	};
	
	class ar : r
	{
		#include "weapon_mk200.h"
	};
	
	class aar : r
	{
		pack[] = {"B_AssaultPack_dgtl"};
		packmags[] = {{"200Rnd_65x39_cased_Box",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		pack[] = {"B_AssaultPack_dgtl"};
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
		vest[] = {"V_PlateCarrierIA1_dgtl"};
	};
	class dm : r
	{
		primaryattach[] = {{"optic_MRCO"}};
		pack[] = {""};
	};
	class gren : base
	{
		#include "weapon_mk20_gl.h"
		pack[] = {"B_AssaultPack_dgtl"};
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
		vest[] = {"V_PlateCarrierIAGL_dgtl"};
	};
	
	class ftl : gren {};
	class dc : ftl
	{
		vest[] = {"V_PlateCarrierIA2_dgtl"};
		primaryattach[] = {{"optic_MRCO"}};
	};
	class co : dc {};
	
	class mmgg : r
	{
		primaryattach[] = {{"RH_TD_ACB_b"}};
		#include "weapon_spmg_black.h"
		pack[] = {"B_AssaultPack_dgtl"};
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
		pack[] = {"B_AssaultPack_dgtl"};
		#include "weapon_maaws.h"
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
		#include "weapon_igla.h"
		pack[] = {"B_AssaultPack_dgtl"};
		packmags[] = {{"rhs_mag_9k38_rocket",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_mag_9k38_rocket",2}};
	};
};