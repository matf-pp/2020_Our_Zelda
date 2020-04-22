ENTITY_DEFS = {
	['player'] = {
		walkSpeed = PLAYER_SPEED,
		anims  = {
			['walk-left'] = {
				frames = {13, 14, 15, 16},
				interval = 0.155,
				texture = 'character_walk'
			},
			['walk-right'] = {
				frames = {5, 6, 7, 8},
				interval = 0.155,
				texture = 'character_walk'
			},
			['walk-down'] = {
				frames = {1, 2, 3, 4},
				interval = 0.155,
				texture = 'character_walk'
			},
			['walk-up'] = {
				frames = {9, 10, 11, 12},
				interval = 0.155,
				texture = 'character_walk'
			}, 
			['idle-left'] = {
				frames = {13},
				texture = 'character_walk'
			}, 
			['idle-right'] = {
				frames = {5},
				texture = 'character_walk'
			}, 
			['idle-down'] = {
				frames = {1},
				texture = 'character_walk'
			}, 
			['idle-up'] = {
				frames = {9},
				texture = 'character_walk'
			}, 
			['sword-left'] = {
				frames = {13, 14, 15, 16},
				interval = 0.05,
				looping = false,
				texture = 'character_swing_sword'
			}, 
			['sword-right'] = {
				frames = {9, 10, 11, 12},
				interval = 0.05,
				looping = false,
				texture = 'character_swing_sword'
			}, 
			['sword-down'] = {
				frames = {1, 2, 3, 4},
				interval = 0.05,
				looping = false,
				texture = 'character_swing_sword'
			}, 
			['sword-up'] = {
				frames = {5, 6, 7, 8},
				interval = 0.05,
				looping = false,
				texture = 'character_swing_sword'
			},
		}
	},
	['skeleton'] = {
		texture = 'entities',
		anims = {
			['walk-left'] = {
				frames = {22, 23, 24, 23},
				interval = 0.2
			},
			['walk-right'] = {
				frames = {34, 35, 36, 35},
				interval = 0.2
			},
			['walk-down'] = {
				frames = {10, 11, 12, 11},
				interval = 0.2
			},
			['walk-up'] = {
				frames = {46, 47, 48, 47},
				interval = 0.2
			}, 
			['idle-left'] = {
				frames = {23}
			}, 
			['idle-right'] = {
				frames = {35}
			}, 
			['idle-down'] = {
				frames = {11}
			}, 
			['idle-up'] = {
				frames = {47}
			}
		}
	},
	['bat'] = {
		texture = 'entities',
		anims = {
			['walk-left'] = {
				frames = {64, 65, 66, 65},
				interval = 0.2
			},
			['walk-right'] = {
				frames = {76, 77, 78, 77},
				interval = 0.2
			},
			['walk-down'] = {
				frames = {52, 53, 54, 53},
				interval = 0.2
			},
			['walk-up'] = {
				frames = {88, 89, 90, 89},
				interval = 0.2
			}, 
			['idle-left'] = {
				frames = {64, 65, 66, 65},
				interval = 0.2
			}, 
			['idle-right'] = {
				frames = {76, 77, 78, 77},
				interval = 0.2
			}, 
			['idle-down'] = {
				frames = {52, 53, 54, 53},
				interval = 0.2
			}, 
			['idle-up'] = {
				frames = {88, 89, 90, 89},
				interval = 0.2
			}
		}
	}
}
