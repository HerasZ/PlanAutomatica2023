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
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(loc-dron base drone1)
	(brazos-dron drone1 brazod_dron1)
	(libre-brazo drone1 brazod_dron1)
	(brazos-dron drone1 brazoi_dron1)
	(libre-brazo drone1 brazoi_dron1)
	(distintos-brazos-dron brazod_dron1 brazoi_dron1)
	(loc-contenedor base carrier1)
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
	(contiene crate2 medicina)
	(contiene crate3 medicina)
	(contiene crate4 comida)
	(contiene crate5 medicina)
	(loc-persona loc2 person1)
	(loc-persona loc3 person2)
	(loc-persona loc5 person3)
	(loc-persona loc5 person4)
	(loc-persona loc4 person5)
	(base base)
	(no-base loc1)
	(no-base loc2)
	(no-base loc3)
	(no-base loc4)
	(no-base loc5)
	(= (total-cost) 0)
	(= (coste-vuelo base loc1) 170)
	(= (coste-vuelo base loc2) 267)
	(= (coste-vuelo base loc3) 236)
	(= (coste-vuelo base loc4) 199)
	(= (coste-vuelo base loc5) 102)
	(= (coste-vuelo loc1 base) 170)
	(= (coste-vuelo loc1 loc2) 185)
	(= (coste-vuelo loc1 loc3) 173)
	(= (coste-vuelo loc1 loc4) 240)
	(= (coste-vuelo loc1 loc5) 69)
	(= (coste-vuelo loc2 base) 267)
	(= (coste-vuelo loc2 loc1) 185)
	(= (coste-vuelo loc2 loc3) 35)
	(= (coste-vuelo loc2 loc4) 163)
	(= (coste-vuelo loc2 loc5) 207)
	(= (coste-vuelo loc3 base) 236)
	(= (coste-vuelo loc3 loc1) 173)
	(= (coste-vuelo loc3 loc2) 35)
	(= (coste-vuelo loc3 loc4) 131)
	(= (coste-vuelo loc3 loc5) 184)
	(= (coste-vuelo loc4 base) 199)
	(= (coste-vuelo loc4 loc1) 240)
	(= (coste-vuelo loc4 loc2) 163)
	(= (coste-vuelo loc4 loc3) 131)
	(= (coste-vuelo loc4 loc5) 210)
	(= (coste-vuelo loc5 base) 102)
	(= (coste-vuelo loc5 loc1) 69)
	(= (coste-vuelo loc5 loc2) 207)
	(= (coste-vuelo loc5 loc3) 184)
	(= (coste-vuelo loc5 loc4) 210)
	(mayor n1 n0)
	(mayor n2 n0)
	(mayor n3 n0)
	(mayor n4 n0)
	(menor n0 n4)
	(menor n1 n4)
	(menor n2 n4)
	(menor n3 n4)
	(incrementar n0 n1)
	(incrementar n1 n2)
	(incrementar n2 n3)
	(incrementar n3 n4)
	(tope n4)
	(minimo n0)
	(capacidad n0)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person2 medicina)
	(tiene-contenido person3 medicina)
	(tiene-contenido person4 medicina)
	(tiene-contenido person5 comida)
	(tiene-contenido person5 medicina)
	))
(:metric minimize (total-cost))
)
