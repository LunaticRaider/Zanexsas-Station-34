datum
	skillGroup
		var
			list/skills //Path delas
			mob/living/carbon/human/owner

		New(_owner)
			. = ..()
			if(_owner) owner = _owner
			if(.) onCreated()

		Del()
			. = ..()
			if(skills.len) skills = null // conder profissional viu
			if(owner) onLoss()

		proc/onCreated()
			if(!owner) del src

		proc/getSkillList()
			LAZYINITLIST(skills)
			return skills

		proc/onLoss()
			return 1