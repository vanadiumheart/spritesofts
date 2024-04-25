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

spritesofts.register_gun("spritesofts:pardini",{
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
	ammo = "spritesofts:mag_pardini",
	firetime = .125,
	offsetrecoil = 30,
	targetrecoil = 15,
	damage = .01,
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
		aimpostfire = "load3.png",
		load = {
			length = 4*.25,
			sounds = {nil, "thompson_charge"},
			frames = {"load1.png", "load2.png", "load3.png", "load1.png"},
		},
		reload = {
			length = 4*.33,
			speed = .75,
			sounds = {"thompson_load", nil, nil, "thompson_charge"},
			frames = {"reload2.png", "reload1.png", "load3.png", "load1.png"}
		},
		unload = {
			length = 5*.33,
			speed = .75,
			sounds = {nil, "thompson_charge", nil, "thompson_unload"},
			frames = {"load1.png", "load2.png", "load3.png", "reload1.png", "reload2.png"},
		},
	},
})

minetest.register_tool("spritesofts:mag_pardini", {
	description = "Pardini Magazine",
	inventory_image = "spritesofts_pistol_mag.png",
})
if fancycrafts then
	minetest.register_craft({
		output = "spritesofts:airsoft_pardini 1 65534",
		recipe = {
			{"gun_lathe:gun_barrel_iron", "", ""},
			{"default:steel_ingot", "gun_lathe:gun_barrel_iron", ""},
			{"", "default:steel_ingot", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot", ""},
		}
	})
else
	minetest.register_craft({
		output = "spritesofts:airsoft_pardini 1 65534",
		recipe = {
			{"default:steel_ingot", "", ""},
			{"", "default:steel_ingot", "default:diamond"},
			{"", "default:steel_ingot", ""},
		}
	})
end
spritesofts.register_magazine("spritesofts:mag_pardini", "spritesofts:bullet_6", 26)
minetest.register_craft({
	output = "spritesofts:mag_pardini 1 65534",
	recipe = {
		{"default:steel_ingot"},
		{magspringmat},
	}
})

spritesofts.register_gun("spritesofts:coltarmy",{
	description = "Colt  Army Revolver",
	inventory_image = "coltarmy_inv.png",
	zoomfov = 60,
	scale = 7.5,
	range = 200,
	fire_sound = "coltarmy_fire",
	fire_gain = 10,
	fire_sound_distant = "distant_local",
	size = 6,
	loadtype = "semi",--"auto", "semi", and "manual"
	ammo = "spritesofts:bullet_45",
	firetime = .5,
	offsetrecoil = 100,
	targetrecoil = 40,
	damage = 8,
	maxdev = .12,
	maxzoomdev = .05,
	unload_amount = 1,
	concealed = true,
	spread = 3,
	textures = {
		prefix = "coltarmy_",
		hipidle = "hipidle.png",
		hipidlenomag = "hipidle.png",
		hipfire = "hipfire.png",
		hippostfire = "hippostfire.png",
		aimidle = "aimidle.png",
		aimidlenomag = "aimidle.png",
		aimfire = "aimfire.png",
		aimpostfire = "aimpostfire.png",
		load = {
			length = 4*.25,
			sounds = {nil, "thompson_charge"},
			frames = {"load1.png", "load2.png", "load3.png", "load4.png"},
		},
		reload = {
			length = 4*.30,
			speed = .75,
			loopstart = 2,
			loopend = 3,
			sounds = {nil, nil, "gunslinger_charge"},
			frames = {"reload1.png", "reload2.png", "reload3.png", "reload1.png"}
		},
		unload = {
			length = 4*.30,
			speed = .75,
			loopstart = 2,
			loopend = 3,
			sounds = {nil, nil, "gunslinger_charge"},
			frames = {"reload1.png", "reload3.png", "reload2.png", "reload1.png", }
		},
	},
})
if fancycrafts then
	minetest.register_craft({
		output = "spritesofts:coltarmy 1 65534",
		recipe = {
			{"gun_lathe:gun_barrel_iron", "", ""},
			{"default:steel_ingot", "gun_lathe:gun_barrel_iron", ""},
			{"", "default:steel_ingot", "group:tree"},
			{"", "group:tree", ""},
		}
	})
else
	minetest.register_craft({
		output = "spritesofts:coltarmy 1 65534",
		recipe = {
			{"default:steel_ingot", "", ""},
			{"", "default:steel_ingot", "default:mese_crystal"},
			{"", "group:tree", ""},
		}
	})
end

spritesofts.register_gun("spritesofts:binoculars",{
	description = "Binoculars",
	inventory_image = "binoculars_binoculars.png",
	zoomfov = 20,
	scale = 7.5,
	targetrecoil = 10,
	maxdev = .12,
	maxzoomdev = .01,
	concealed = true,
	textures = {
		prefix = "bino",
		hipidle = "_hipidle.png",
		aimidle = "aim_cut.png",
		load = {
			length = .1,
			frames = {"_hipidle.png"}
		},
	},
})

minetest.register_craft({
	output = "spritesofts:binoculars",
	recipe = {
		{"default:obsidian_glass", "", "default:obsidian_glass"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:obsidian_glass", "", "default:obsidian_glass"},
	}
})