#define MAX_FLY_Y 70

datum
	alternians
		fly
			var/flySpeedY = 4
			var/flying = FALSE

			verb/fly()
				set name = "Fly"
				set category = "Alternian"

				if(flying == TRUE)
					flying = FALSE
					usr << "\blue You stop flying"
				else
					flying = TRUE
					usr << "\blue You start flying"

				while(flying == TRUE && usr.stat != 2)
					spawn(tick_lag_original)
						usr.ySpeed = flySpeedY
						usr.onFloor = FALSE
						if(usr.pixel_z >= MAX_FLY_Y)
							usr.pixel_z = MAX_FLY_Y
							usr.pixel_y_2 = MAX_FLY_Y
							usr.heightZ = MAX_FLY_Y
					sleep(tick_lag_original)

#undef MAX_FLY_Y