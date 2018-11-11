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

				while(flying == TRUE)
					spawn(tick_lag_original)
						owner.ySpeed = flySpeedY
						usr.onFloor = FALSE
						if(usr.pixel_z >= MAX_FLY_Y)
							usr.pixel_z = MAX_FLY_Y
							usr.pixel_y_2 = pixel_z/2
							usr.heightZ = pixe_z/2
					sleep(tick_lag_original)

#undef MAX_FLY_Y