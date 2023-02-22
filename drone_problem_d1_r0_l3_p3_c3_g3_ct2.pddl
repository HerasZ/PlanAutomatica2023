(define (problem drone_problem_d1_r0_l3_p3_c3_g3_ct2)
(:domain servicio-emergencia)
(:objects
	drone1 - dron
	brazod_dron1 - brazo
	brazoi_dron1 - brazo
	base - localizacion
	loc1 - localizacion
	loc2 - localizacion
	loc3 - localizacion
	crate1 - caja
	crate2 - caja
	crate3 - caja
	comida - contenido
	medicina - contenido
	person1 - persona
	person2 - persona
	person3 - persona
)
(:init
	(loc-dron base drone1)
	(brazos-dron drone1 brazod_dron1)
	(libre-brazo drone1 brazod_dron1)
	(brazos-dron drone1 brazoi_dron1)
	(libre-brazo drone1 brazoi_dron1)
	(loc-caja base crate1)
	(loc-caja base crate2)
	(loc-caja base crate3)
	(contiene crate1 comida)
	(contiene crate2 comida)
	(contiene crate3 medicina)
	(loc-persona loc2 person1)
	(loc-persona loc1 person2)
	(loc-persona loc2 person3)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person1 medicina)
	(tiene-contenido person2 comida)
	(tiene-contenido person3 medicina)
	))
)
