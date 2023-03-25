(define (problem problem_durative)
(:domain servicio-emergencia-durative)
(:objects
	drone1 - dron
	drone2 - dron
	brazod_dron1 - brazo
	brazoi_dron1 - brazo
	brazod_dron2 - brazo
	brazoi_dron2 - brazo
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
	carrier2 - contenedor
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(loc-dron base drone1)
	(loc-dron loc1 drone2)
	(brazos-dron drone1 brazod_dron1)
	(libre-brazo drone1 brazod_dron1)
	(brazos-dron drone1 brazoi_dron1)
	(libre-brazo drone1 brazoi_dron1)
	(brazos-dron drone2 brazod_dron2)
	(libre-brazo drone2 brazod_dron2)
	(brazos-dron drone2 brazoi_dron2)
	(libre-brazo drone2 brazoi_dron2)
	(distintos-brazos-dron brazod_dron1 brazoi_dron1)
	(distintos-brazos-dron brazod_dron2 brazoi_dron2)
	(loc-contenedor base carrier1)
	(loc-contenedor base carrier2)
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
	(contiene crate3 medicina)
	(contiene crate4 comida)
	(contiene crate5 medicina)
	(loc-persona loc4 person1)
	(loc-persona loc4 person2)
	(loc-persona loc4 person3)
	(loc-persona loc5 person4)
	(loc-persona loc1 person5)
	(base base)
	(no-base loc1)
	(no-base loc2)
	(no-base loc3)
	(no-base loc4)
	(no-base loc5)
	(mayor n1 n0)
	(mayor n2 n0)
	(mayor n3 n0)
	(mayor n4 n0)
	(incrementar n0 n1)
	(incrementar n1 n2)
	(incrementar n2 n3)
	(incrementar n3 n4)
	(minimo n0)
	(capacidad n0)
)
(:goal (and

	(loc-dron base drone1)
	(tiene-contenido person1 comida)
	(tiene-contenido person2 medicina)
	(tiene-contenido person3 medicina)
	(tiene-contenido person4 comida)
	(tiene-contenido person5 medicina)
	))
)