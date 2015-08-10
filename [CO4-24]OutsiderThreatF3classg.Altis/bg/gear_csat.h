class opf_f : faction
{
	class base : type
	{
		helmet[] = {"H_HelmetO_ocamo"};
		vest[] = {"V_HarnessO_brn"};
		pack[] = {"B_AssaultPack_ocamo"};
		
		#include "weapon_katiba.h"
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		#include "weapon_rpg26.h"
	};
	
	class ar : r
	{
		#include "weapon_zafir.h"
	};
	
	class aar : r
	{
		pack[] = {"B_AssaultPack_ocamo"};
		packmags[] = {{"150Rnd_762x54_Box",1}, {"150Rnd_762x54_Box_Tracer",1}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
		pack[] = {"B_AssaultPack_ocamo"};
	};
	class dm : r
	{
		primaryattach[] = {{"optic_Hamr"}};
	};
	class gren : base
	{
		#include "weapon_katiba_gl.h"
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
		vest[] = {"V_HarnessOGL_brn"};
	};
	
	class ftl : gren {};
	class dc : ftl
	{
		primaryattach[] = {{"optic_Hamr"}};
	};
	class co : dc {};
	
	class mmgg : r
	{
		#include "weapon_navid.h"
		pack[] = {"B_AssaultPack_ocamo"};
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
		#include "weapon_rpg42.h"
		pack[] = {"B_AssaultPack_ocamo"};
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
		#include "weapon_titanaa.h"
		pack[] = {"B_AssaultPack_ocamo"};
		packmags[] = {{"Titan_AA",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"Titan_AA",2}};
	};
};