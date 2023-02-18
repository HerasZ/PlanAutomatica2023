(define (problem strips-gripper-x-1)
   (:domain servicio-emergencia)
   
   (:objects dron1 - dron
       localizacion1 localizacion2 base - localizacion
       persona1 persona2 persona3 - persona
       caja1 caja2 caja3 - caja
       medicina1 medicina2 comida1 comida2 - contenido
       brazo-i brazo-d - brazo)
   (:init (loc-dron base dron1)
       (loc-caja base caja1 )
       (loc-caja base caja2)
       (loc-caja base caja3)
       (contiene caja1 medicina1) 
       (contiene caja1 comida1) 
       (contiene caja2 medicina2) 
       (contiene caja3 comida2)
       (loc-persona localizacion1 persona1 )
       (loc-persona localizacion1 persona2 )
       (loc-persona localizacion2 persona3 )
       (libre-brazo dron1 brazo-i)
       (libre-brazo dron1 brazo-d)
       (necesita-contenido persona1 medicina1)
       (necesita-contenido persona1 comida2)
       (necesita-contenido persona2 comida1)
       (necesita-contenido persona3 medicina2)
       (no-hay-persona base)

       )

    (:goal (and (tiene-contenido persona1 medicina1)
        (tiene-contenido persona1 comida2)
        (tiene-contenido persona2 comida1)
        (tiene-contenido persona3 medicina2)
        )
    )
)
