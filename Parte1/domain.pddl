(define (domain servicio-emergencia)
    (:requirements :strips :typing)
    (:types localizacion caja persona dron brazo contenido)
    
    (:predicates
        (loc-dron ?l - localizacion ?d - dron)
        (loc-caja ?l - localizacion ?c - caja)
        (loc-persona ?l - localizacion ?p - persona)
        (tiene-contenido ?p -persona ?co - contenido)
        (contiene ?c - caja ?co - contenido)
        (carga-brazo ?c - caja ?b -brazo)
        (libre-brazo ?d - dron ?b - brazo)
        (no-hay-persona ?l - localizacion)
        (caja-pendiente ?c - caja)
        (brazos-dron ?d - dron ?b - brazo)
    )
    
    (:action mover
        :parameters (?desde - localizacion ?hasta - localizacion ?d - dron)
        :precondition (and (loc-dron ?desde ?d))
        :effect (and (loc-dron ?hasta ?d)
                    (not (loc-dron ?desde ?d))
                )
    )

    (:action coger-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?b - brazo)
        :precondition (and (loc-dron ?l ?d) 
                        (loc-caja ?l ?c) 
                        (libre-brazo ?d ?b) 
                        (brazos-dron ?d ?b)
                        (caja-pendiente ?c) 
                    )
        :effect (and (carga-brazo ?c ?b) 
                    (not (loc-caja ?l ?c))
                    (not (libre-brazo ?d ?b))
                )
    )
    
    (:action dar-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?p - persona ?b - brazo ?co - contenido)
        :precondition (and (loc-dron ?l ?d) 
                        (brazos-dron ?d ?b) 
                        (carga-brazo ?c ?b) 
                        (contiene ?c ?co) 
                        (loc-persona ?l ?p)
                    )
        :effect (and (loc-caja ?l ?c) 
                    (not (carga-brazo ?c ?b)) 
                    (libre-brazo ?d ?b)
                    (tiene-contenido ?p ?co)
                    (not (caja-pendiente ?c))
                )
    )
)