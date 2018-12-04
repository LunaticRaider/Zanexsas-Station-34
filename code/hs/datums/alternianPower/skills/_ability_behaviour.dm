#define BEGIN "BEGIN"
#define MIDDLE "MIDDLE"
#define END "END"

datum
	AbilityBehaviour
		var
			name = ""
			desc = ""
			_icon
			startTime = ""
			//list/StartTimeEnums(BEGIN,MIDDLE,END)

		New(_name, _desc, _sprite)
			..()
			name = _name
			desc = _desc
			_icon = _sprite
		proc
			DoAction()
				return 1

		Ranged
			name = "Ranged Attack"
			desc = "A ranged attack!"
			startTime = BEGIN

			var
				minDist = 1
				maxDist = 30


		Melee

		Magic

		Defense
