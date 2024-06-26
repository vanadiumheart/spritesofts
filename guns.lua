local casingmat = "default:bronze_ingot"
local bulletmat = "default:steel_ingot"
local shotguncasemat = "default:paper"
local magspringmat = "group:sapling"
local fancycrafts = minetest.get_modpath("gun_lathe") ~= nil and minetest.get_modpath("assembler") ~= nil
if minetest.get_modpath("basic_materials") then
	casingmat = "basic_materials:plastic_strip"
	shotguncasemat = "basic_materials:plastic_strip"
	magspringmat = "basic_materials:steel_wire"
end
if minetest.get_modpath("technic") then
	bulletmat = "technic:lead_ingot"
end
minetest.register_craftitem("spritesofts:bullet_6", {
	description = "6mm Airsoft Pellet",
	inventory_image = "spritesoft_pellet.png",
})
minetest.register_craft({
	output = "spritesofts:bullet_6 120",
	recipe = {
		{"", casingmat, ""},
		{casingmat, "", casingmat},
		{"", casingmat, ""},
	}
})
minetest.register_craftitem("spritesofts:plastic_barrel", {
	description = "Plastic Airsoft Barrel",
	inventory_image = "spritesoft_barrel.png"
})
minetest.register_craft({
	output = "spritesofts:plastic_barrel 1",
	recipe = {
		{"dye:orange", "basic_materials:plastic_strip", ""},
		{"basic_materials:plastic_strip", "", "basic_materials:plastic_strip"},
		{"", "basic_materials:plastic_strip", "dye:orange"},
	}
})

spritesofts.register_gun("spritesofts:pardini_as",{
	description = "Airsoft Pardini Pistol",
	inventory_image = "pardini_as_inv.png",
	zoomfov = 60,
	scale = 7.5,
	range = 100,
	fire_sound = "pardini_fire",
	fire_gain = 10,
	fire_sound_distant = "distant_local",
	size = 26,
	loadtype = "manual",--"auto", "semi", and "manual"
	ammo = "spritesofts:mag_pardini_as",
	firetime = .125,
	offsetrecoil = 30,
	targetrecoil = 15,
	damage = 2,
	maxdev = .06,
	maxzoomdev = .02,
	magazine = true,
	concealed = true,
	spread = 2,
	textures = {
		prefix = "pardini_as_",
		hipidle = "hipidle.png",
		hipidlenomag = "hipidlenomag.png",
		hipfire = "hipfire.png",
		hippostfire = "load3.png",
		aimidle = "aimidle.png",
		aimidlenomag = "aimidlenomag.png",
		aimfire = "aimfire.png",
		aimpostfire = "aimfire.png",
		load = {
			length = 4*.25,
			sounds = {nil, "thompson_charge"},
			frames = {"load1.png", "load2.png", "load3.png", "load4.png"},
			zoomframes = {"aimfire.png", "aimpostfire.png"},
		},
		reload = {
			length = 4*.33,
			speed = .75,
			sounds = {"thompson_load", nil, nil, "thompson_charge"},
			frames = {"reload2.png", "reload1.png", "load3.png", "load4.png"}
		},
		unload = {
			length = 5*.33,
			speed = .75,
			sounds = {nil, "thompson_charge", nil, "thompson_unload"},
			frames = {"load1.png", "load2.png", "reload1.png", "reload2.png"},
		},
	},
})

minetest.register_tool("spritesofts:mag_pardini_as", {
	description = "Airsoft Pardini Magazine",
	inventory_image = "spritesofts_pistol_mag.png",
})
if fancycrafts then
	minetest.register_craft({
		output = "spritesofts:pardini_as 1 65534",
		recipe = {
			{"spritesofts:plastic_barrel", "basic_materials:steel_wire", ""},
			{"basic_materials:plastic_sheet", "spritesofts:plastic_barrel", ""},
			{"dye:orange", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", ""},
		}
	})
else
	minetest.register_craft({
		output = "spritesofts:pardini_as 1 65534",
		recipe = {
			{"basic_materials:plastic_sheet", "", ""},
			{"", "basic_materials:plastic_sheet", "dye:orange"},
			{"", "basic_materials:plastic_sheet", ""},
		}
	})
end
spritesofts.register_magazine("spritesofts:mag_pardini_as", "spritesofts:bullet_6", 26)
minetest.register_craft({
	output = "spritesofts:mag_pardini_as 1 65534",
	recipe = {
		{"dye:orange"},
		{"basic_materials:plastic_sheet"},
		{magspringmat},
	}
})