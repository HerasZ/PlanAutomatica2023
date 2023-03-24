(define (problem drone_problem_costs_d1_r1_l5_p5_c5_g5_ct2)
(:domain servicio-emergencia-costes)
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
	(contiene crate2 medicina)
	(contiene crate3 comida)
	(contiene crate4 medicina)
	(contiene crate5 medicina)
	(loc-persona loc2 person1)
	(loc-persona loc5 person2)
	(loc-persona loc5 person3)
	(loc-persona loc2 person4)
	(loc-persona loc2 person5)
	(base base)
	(no-base loc1)
	(no-base loc2)
	(no-base loc3)
	(no-base loc4)
	(no-base loc5)
	(= (coste-total) 0)
	(= (coste-vuelo loc1 loc2) 88)
	(= (coste-vuelo loc1 loc3) 174)
	(= (coste-vuelo loc1 loc4) 154)
	(= (coste-vuelo loc1 loc5) 138)
	(= (coste-vuelo loc2 loc1) 88)
	(= (coste-vuelo loc2 loc3) 87)
	(= (coste-vuelo loc2 loc4) 75)
	(= (coste-vuelo loc2 loc5) 82)
	(= (coste-vuelo loc3 loc1) 174)
	(= (coste-vuelo loc3 loc2) 87)
	(= (coste-vuelo loc3 loc4) 37)
	(= (coste-vuelo loc3 loc5) 82)
	(= (coste-vuelo loc4 loc1) 154)
	(= (coste-vuelo loc4 loc2) 75)
	(= (coste-vuelo loc4 loc3) 37)
	(= (coste-vuelo loc4 loc5) 45)
	(= (coste-vuelo loc5 loc1) 138)
	(= (coste-vuelo loc5 loc2) 82)
	(= (coste-vuelo loc5 loc3) 82)
	(= (coste-vuelo loc5 loc4) 45)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person1 comida)
	(tiene-contenido person1 medicina)
	(tiene-contenido person3 comida)
	(tiene-contenido person3 medicina)
	(tiene-contenido person4 medicina)
	))
(:metric minimize (coste-total))
)
