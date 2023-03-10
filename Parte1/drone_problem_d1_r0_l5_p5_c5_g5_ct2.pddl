(define (problem drone_problem_d1_r0_l5_p5_c5_g5_ct2)
(:domain servicio-emergencia)
(:objects
	drone1 - dron
	brazod_dron1 - brazo
	brazoi_dron1 - brazo
	base - localizacion
	loc1 - localizacion
	loc2 - localizacion
	loc3 - localizacion
	loc4 - localizacion
	loc5 - localizacion
	crate1 - caja
	crate2 - caja
	crate3 - caja
	crate4 - caja
	crate5 - caja
	comida - contenido
	medicina - contenido
	person1 - persona
	person2 - persona
	person3 - persona
	person4 - persona
	person5 - persona
)
(:init
	(loc-dron base drone1)
	(brazos-dron drone1 brazod_dron1)
	(libre-brazo drone1 brazod_dron1)
	(brazos-dron drone1 brazoi_dron1)
	(libre-brazo drone1 brazoi_dron1)
	(loc-caja base crate1)
	(caja-pendiente crate1)
	(loc-caja base crate2)
	(caja-pendiente crate2)
	(loc-caja base crate3)
	(caja-pendiente crate3)
	(loc-caja base crate4)
	(caja-pendiente crate4)
	(loc-caja base crate5)
	(caja-pendiente crate5)
	(contiene crate1 medicina)
	(contiene crate2 comida)
	(contiene crate3 comida)
	(contiene crate4 medicina)
	(contiene crate5 comida)
	(loc-persona loc2 person1)
	(loc-persona loc1 person2)
	(loc-persona loc1 person3)
	(loc-persona loc3 person4)
	(loc-persona loc2 person5)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person1 medicina)
	(tiene-contenido person2 comida)
	(tiene-contenido person3 comida)
	(tiene-contenido person3 medicina)
	(tiene-contenido person4 comida)
	))
)
