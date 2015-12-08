AddCSLuaFile()

local A = "AMBER"
local R = "RED"
local DR = "D_RED"
local B = "BLUE"
local W = "WHITE"
local CW = "C_WHITE"
local SW = "S_WHITE"
local G = "GREEN"
local RB = "BLUE/RED"

local name = "Whelen Ion Trio"

local COMPONENT = {}

COMPONENT.Model = "models/schmal/whelen_ion.mdl"
COMPONENT.Skin = 0
COMPONENT.Bodygroups = {}
COMPONENT.NotLegacy = true
COMPONENT.ColorInput = 1
COMPONENT.UsePhases = true
COMPONENT.Category = "Exterior"
COMPONENT.DefaultColors = {
	[1] = "RED",
	[2] = "BLUE",
	[3] = "WHITE"
}

COMPONENT.Meta = {
	auto_ion_left = {
		AngleOffset = 0,
		W = 6.9,
		H = 6.9,
		WMult = 1.5,
		Sprite = "sprites/emv/whelen_ion_left",
		Scale = .66,
		NoLegacy = true,
		DirAxis = "Up",
		DirOffset = 90
	},
	auto_ion_right = {
		AngleOffset = 0,
		W = 6.9,
		H = 6.9,
		WMult = 1.5,
		Sprite = "sprites/emv/whelen_ion_right",
		Scale = .66,
		NoLegacy = true,
		DirAxis = "Up",
		DirOffset = 90
	},
}

COMPONENT.Positions = {

	[1] = { Vector( 1.46, 0.5, 0 ), Angle( 0, 0, 0 ), "auto_ion_left" },
	[2] = { Vector( -1.46, 0.5, 0 ), Angle( 0, 0, 0 ), "auto_ion_right" },

}

COMPONENT.Sections = {
	["auto_ion"] = {
		[1] = { { 1, "_1", .88 }, { 2, "_1", .88 },  },
		[2] = { { 1, "_2", .88 }, { 2, "_2", .88 },  },
		[3] = { { 1, "_3", .88 }, { 2, "_3", .88 },  },
		[4] = { { 1, "_3", 1.25 }, { 2, "_3", 1.25 },  },
	},
}

COMPONENT.Patterns = {
	["auto_ion"] = {
		["illum"] = { 4 },
		["code1"] = { 1, 1, 1, 2, 2, 2 },
		["code1A"] = { 1, 1, 1, 2, 2, 2 },
		["code1B"] = { 2, 2, 2, 1, 1, 1 },
		["code2"] = { 1, 0, 1, 0, 1, 1, 1, 0, 2, 0, 2, 2, 2, 0 },
		["code2A"] = { 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0 },
		["code2B"] = { 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2 },
		["code3"] = { 1, 0, 1, 0, 0, 2, 0, 2, 0, 0, 3, 0, 3, 0, 0, 2, 0, 2, 0, 0, 1, 0, 1, 0, 0, 3, 0, 3, 0, 0 },
		["code3A"] = { 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, },
		["code3B"] = { 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 2, 2, 0, 1, 1, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0, },
	}
}

COMPONENT.Modes = {
	Primary = {
		M1 = { ["auto_ion"] = "code1", },
		M2 = { ["auto_ion"] = "code2", },
		M3 = { ["auto_ion"] = "code3", }
	},
	Auxiliary = {},
	Illumination = {
		T = { 
			{ 1, W }, { 2, W }, 
		}
	}
}

EMVU:AddAutoComponent( COMPONENT, name )