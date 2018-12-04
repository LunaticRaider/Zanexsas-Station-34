datum
	Ability
		var
			name = ""
			description = ""
			_icon
			list/behaviours

			atom/particle

			requiresTarget = FALSE
			canCastOnSelf = FALSE

			cooldown = 0
			castTime = 0 //'-' ... :3 lolizinha                   -         ss
			cost = 0

		New(_name, _sprite, behaviours)
			..()
			if(!name || !description || !_icon || !behaviours || !particle || !cooldown)
				name = _name
				description = "Default" //metodo depois para criar descriçao baseada com as behaviours
				_icon = _sprite
				behaviours = behaviours
				cooldown = 0
				requiresTarget = FALSE
				canCastOnSelf = FALSE
		proc
			Use()
				return 1