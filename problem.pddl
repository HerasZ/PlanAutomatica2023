(define (problem strips-gripper-x-1)
   (:domain gripper-strips)
   
   (:objects dron1 - dron
       localizacion1 localizacion2 base - localizacion
       persona1 persona2 persona3-persona
       caja1 caja2 caja3 -caja
       medicina1 medicina2 comida1 comida2 - contenido
       brazo-i brazo-d - brazo)
   (:init loc-dron dron1 base
       loc-caja caja1 base
       loc-caja caja2 base
       loc-caja caja3 base
       contiene caja1 medicina1 
       contiene caja1 comida1 
       contiene caja2 medicina2 
       contiene caja3 comida2 
       loc-persona persona1 localizacion1
       loc-persona persona2 localizacion1
       loc-persona persona3 localizacion2
       libre-brazo brazo-i
       libre-brazo brazo-d

       )
   (:goal (and (tiene-caja persona1)
   )))