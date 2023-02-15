(define (domain servicio-emergencia)
    (:requirements :strips :typing)
    (:types localizacion caja persona dron brazo contenido)
    
    (:predicates
        (loc-dron ?l - localizacion ?d - dron)
        (loc-caja ?l - localizacion ?c - caja)
        (loc-persona ?l - localizacion ?p - persona)
        (contiene ?c - caja ?co - contenido)
        (carga-dron ?c -caja  ?d - dron)
        (carga-brazo ?c - caja ?d - dron ?b -brazo)
        (libre-brazo ?d - dron ?b - brazo)
        (tiene-caja ?c - caja ?p - persona)
        (necesita-contenido ?p - persona ?co - contenido)
    )

    (:action mover
        :parameters (?desde - localizacion ?hasta - localizacion ?d - dron)
        :precondition (and (loc-dron ?desde ?d))
        :effect (and (loc-dron ?hasta ?d)
            (not (loc-dron ?desde ?d)))
    )

    (:action coger-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?b - brazo)
        :precondition (and (loc-dron ?l ?d) (loc-caja ?l ?c) (libre-brazo ?d ?b))
        :effect (and (carga-brazo ?c ?d ?b) 
                    (not (loc-caja ?l ?c))
                    (not (libre-brazo ?d ?b))
                    )
    )
    
    (:action dar-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?p - persona ?b - brazo ?co - contenido)
        :precondition (and (loc-dron ?l ?d) (carga-brazo ?c ?d ?b) (contiene ?c ?co) (loc-persona ?l ?p))
        :effect (and (loc-caja ?l ?c) (tiene-caja ?c ?p) (not (carga-brazo ?c ?d ?b)) (libre-brazo ?d ?b))
    )

    
    
    
)