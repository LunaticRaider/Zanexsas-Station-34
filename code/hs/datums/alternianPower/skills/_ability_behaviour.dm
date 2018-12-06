datum
	AbilityBehaviour
		var
			name = ""
			desc = ""
			_icon
			startTime = "" // BEGIN MIDDLE END

			lifeDist = 0
			isRandomOn = FALSE

			mob/source

			mob/target

			atom/projectile

		New(_name, _desc, _sprite, _src, _trg)
			..()
			name = _name
			desc = _desc
			_icon = _sprite
			source = _src
			target = _trg

		proc
			DoAction()
				world << "algum negro codou errado >:("
				return 1

		Ranged
			name = "Ranged Attack"
			desc = "A ranged attack!"
			startTime = BEGIN

			var
				minDist = 1
				maxDist = 30

			DoAction()
				checkDist()
				if(isRandomOn)
					lifeDist = rand(minDist,maxDist)


			proc
				checkDist()
					set background = 1
					var/tmp/distorone
					do
						distorone = get_dist(source,target)
						if(distorone > lifeDist)
							//projectile.loc = null
							del src
					while(distorone < lifeDist)


		Melee

		Magic

		Defense
