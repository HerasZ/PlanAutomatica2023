(define (problem strips-gripper-x-1)
   (:domain servicio-emergencia)
   
   (:objects dron1 - dron
       localizacion1 localizacion2 base - localizacion
       persona1 persona2 persona3 - persona
       caja1 caja2 caja3 - caja
       medicina comida - contenido
       brazo-i brazo-d - brazo)
   (:init (loc-dron base dron1)
       (loc-caja base caja1 )
       (loc-caja base caja2)
       (loc-caja base caja3)
       (contiene caja1 medicina) 
       (contiene caja1 comida) 
       (contiene caja2 medicina) 
       (contiene caja3 comida)
       (loc-persona localizacion1 persona1 )
       (loc-persona localizacion1 persona2 )
       (loc-persona localizacion2 persona3 )
       (libre-brazo dron1 brazo-i)
       (libre-brazo dron1 brazo-d)
       (no-hay-persona base)
       (brazos-dron dron1 brazo-i)
       (brazos-dron dron1 brazo-d)
    )

    (:goal (and (loc-caja localizacion2 caja1)
        (loc-caja localizacion2 caja2)
        )
    )
)
