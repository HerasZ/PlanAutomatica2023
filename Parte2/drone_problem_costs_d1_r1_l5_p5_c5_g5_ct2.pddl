(define (problem drone_problem_costs_d1_r1_l5_p5_c5_g5_ct2)
(:domain servicio-emergencia2)
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
	carrier1 - contenedor
)
(:init
	(loc-dron base drone1)
	(brazos-dron drone1 brazod_dron1)
	(libre-brazo drone1 brazod_dron1)
	(brazos-dron drone1 brazoi_dron1)
	(libre-brazo drone1 brazoi_dron1)
	(distintos-brazos-dron brazod_dron1 brazoi_dron1)
	(loc-contenedor base carrier1)
	(= (capacidad-contenedor carrier1) 0)
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
	(contiene crate1 comida)
	(contiene crate2 comida)
	(contiene crate3 comida)
	(contiene crate4 medicina)
	(contiene crate5 comida)
	(loc-persona loc3 person1)
	(loc-persona loc3 person2)
	(loc-persona loc5 person3)
	(loc-persona loc2 person4)
	(loc-persona loc4 person5)
	(base base)
	(no-base loc1)
	(no-base loc2)
	(no-base loc3)
	(no-base loc4)
	(no-base loc5)
	(= (coste-total) 0)	(= (coste-vuelo loc1 loc2) 67)
	(= (coste-vuelo loc1 loc3) 148)
	(= (coste-vuelo loc1 loc4) 144)
	(= (coste-vuelo loc1 loc5) 110)
	(= (coste-vuelo loc2 loc1) 67)
	(= (coste-vuelo loc2 loc3) 83)
	(= (coste-vuelo loc2 loc4) 81)
	(= (coste-vuelo loc2 loc5) 107)
	(= (coste-vuelo loc3 loc1) 148)
	(= (coste-vuelo loc3 loc2) 83)
	(= (coste-vuelo loc3 loc4) 49)
	(= (coste-vuelo loc3 loc5) 162)
	(= (coste-vuelo loc4 loc1) 144)
	(= (coste-vuelo loc4 loc2) 81)
	(= (coste-vuelo loc4 loc3) 49)
	(= (coste-vuelo loc4 loc5) 125)
	(= (coste-vuelo loc5 loc1) 110)
	(= (coste-vuelo loc5 loc2) 107)
	(= (coste-vuelo loc5 loc3) 162)
	(= (coste-vuelo loc5 loc4) 125)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person1 comida)
	(tiene-contenido person2 comida)
	(tiene-contenido person4 comida)
	(tiene-contenido person4 medicina)
	(tiene-contenido person5 comida)
	))
)
