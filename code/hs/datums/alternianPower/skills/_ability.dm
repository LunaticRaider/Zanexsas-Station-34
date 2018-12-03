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

		New(_name, _sprite, behaviours)
			..()
			name = _name
			description = "Default" //metodo depois para criar descriçao baseada com as behaviours
			_icon = _sprite
			behaviours = behaviours
			cooldown = 0
			requiresTarget = FALSE
			canCastOnSelf = FALSE

		getName()
			return name

		getDescription()
			return description

		getIcon()
			return _icon

		getBehaviours()
			return behaviours