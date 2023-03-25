(define (domain servicio-emergencia-durative)
    (:requirements :strips :typing :fluents :durative-actions)
    (:types localizacion caja persona dron brazo contenido contenedor num)
    
    (:predicates
        (loc-contenedor ?l - localizacion ?cont - contenedor)
        (contenido-contenedor ?cont - contenedor ?c - caja )
        (loc-dron ?l - localizacion ?d - dron)
        (loc-caja ?l - localizacion ?c - caja)
        (loc-persona ?l - localizacion ?p - persona)
        (tiene-contenido ?p - persona ?co - contenido)
        (contiene ?c - caja ?co - contenido)
        (carga-brazo ?c - caja ?b - brazo)
        (carga-brazo-contenedor ?cont - contenedor ?b - brazo)
        (libre-brazo ?d - dron ?b - brazo)
        (caja-pendiente ?c - caja)
        (brazos-dron ?d - dron ?b - brazo)
        (base ?l - localizacion)
        (no-base ?l - localizacion)
        (distintos-brazos-dron ?b1 - brazo ?b2 - brazo)
        (capacidad ?n1 - num ?contenedor - contenedor)
        (mayor ?n1 ?n2 - num)
        (incrementar ?n1 ?n2 - num)
        (minimo ?n - num)
    )

    (:functions
        (coste-vuelo ?desde ?hasta - localizacion)
    )

    (:durative-action mover
        :parameters (?desde - localizacion ?hasta - localizacion ?d - dron ?cont - contenedor ?minim ?n1 - num)
        :duration (= ?duration (coste-vuelo ?desde ?hasta))
        :condition (and 
                        (at start (and
                                        (loc-dron ?desde ?d)
                                ) 
                        )
                        (over all (and
                                        (minimo ?minim)
                                        (capacidad ?n1 ?cont)
                                        (mayor ?n1 ?minim)
                                        (no-base ?hasta)
                                    )
                        )
                     )
        :effect (and 
                    (at start(and
                                (not (loc-dron ?desde ?d))
                            )
                    )        
                    (at end (and
                            (loc-dron ?hasta ?d)
                            )
                    )
                )
    )
    
    (:durative-action regresar
        :parameters (?desde - localizacion ?hasta - localizacion ?d - dron ?cont - contenedor ?minim - num)
        :duration (= ?duration (coste-vuelo ?desde ?hasta))
        :condition (and 
                        (at start (and
                                        (loc-dron ?desde ?d)
                                ) 
                        )
                        (over all (and
                                        (base ?hasta)
                                        (minimo ?minim)
                                        (capacidad ?minim ?cont)
                                    )
                        )
                     )
        :effect (and 
                    (at start(and
                                (not (loc-dron ?desde ?d))
                            )
                    )        
                    (at end (and
                            (loc-dron ?hasta ?d)
                            )
                    )
                )
    )
    

    (:action coger-contenedor
        :parameters (?l - localizacion ?d - dron ?bi - brazo ?bd - brazo ?cont - contenedor)
        :precondition (and
                        (distintos-brazos-dron ?bi ?bd)
                        (loc-dron ?l ?d) 
                        (loc-contenedor ?l ?cont)
                        (libre-brazo ?d ?bi) 
                        (libre-brazo ?d ?bd)
                        (brazos-dron ?d ?bi)
                        (brazos-dron ?d ?bd))
    
        :effect (and (carga-brazo-contenedor ?cont ?bi)
                    (carga-brazo-contenedor ?cont ?bd) 
                    (not (loc-contenedor ?l ?cont))
                    (not (libre-brazo ?d ?bi))
                    (not (libre-brazo ?d ?bd)))
    )


    (:durative-action soltar-contenedor
        :parameters (?l - localizacion ?d - dron ?bi ?bd - brazo ?cont - contenedor)
        :duration (= ?duration 1)
        :condition (and
            (at start (and 
                        (carga-brazo-contenedor ?cont ?bd)
                        (carga-brazo-contenedor ?cont ?bi)
                    )
            )
            (over all (and 
                        (loc-dron ?l ?d)
                        (distintos-brazos-dron ?bi ?bd)
                        (brazos-dron ?d ?bd)
                        (brazos-dron ?d ?bi)

                    )
            )        
        )
        :effect (and
                    (at start (and
                            (not(carga-brazo-contenedor ?cont ?bi))
                            (not(carga-brazo-contenedor ?cont ?bd))
                            )
                    )

                    (at end (and
                                (loc-contenedor ?l ?cont)
                                (libre-brazo ?d ?bi)
                                (libre-brazo ?d ?bd)
                            )
                    )
        )
    )

    (:action cargar-contenedor
        :parameters (?cont - contenedor ?d - dron ?c - caja ?b - brazo ?l - localizacion ?n1 ?capacidad - num)
        :precondition (and (loc-contenedor ?l ?cont) 
                    (loc-dron ?l ?d)
                    (carga-brazo ?c ?b)
                    (brazos-dron ?d ?b)
                    (base ?l)
                    (capacidad ?capacidad ?cont)
                    (incrementar ?capacidad ?n1))
        :effect (and (contenido-contenedor ?cont ?c)
                (not(carga-brazo ?c ?b))
                (not(capacidad ?capacidad ?cont))
                (libre-brazo ?d ?b)
                (capacidad ?n1 ?cont)
                )
    )
    
    (:action descargar-contenedor
        :parameters (?cont - contenedor ?d - dron ?c - caja ?b - brazo ?l - localizacion ?n1 ?capacidad - num)
        :precondition (and (loc-contenedor ?l ?cont) 
                    (loc-dron ?l ?d)
                    (contenido-contenedor ?cont ?c)
                    (libre-brazo ?d ?b)
                    (brazos-dron ?d ?b)
                    (capacidad ?capacidad ?cont)
                    (incrementar ?n1 ?capacidad)
                    )
        :effect (and (not (contenido-contenedor ?cont ?c))
                (not (libre-brazo ?d ?b))
                (carga-brazo ?c ?b)
                (not(capacidad ?capacidad ?cont))
                (capacidad ?n1 ?cont)
                )   
    )

    (:durative-action dar-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?p - persona ?b - brazo ?co - contenido)
        :duration (= ?duration 1)
        :condition (and 
                        (at start (and  
                                    (carga-brazo ?c ?b) 
                                )
                        )
                        (over all (and
                                    (loc-dron ?l ?d)
                                    (brazos-dron ?d ?b)
                                    (loc-persona ?l ?p)
                                    (contiene ?c ?co)
                                )
                        )
                    )
                    
        :effect (and
                    (at start (tiene-contenido ?p ?co))
                    (at end (and (loc-caja ?l ?c) 
                                (not (carga-brazo ?c ?b)) 
                                (libre-brazo ?d ?b)
                                (not (caja-pendiente ?c))
                            )
                    )        
                )
    )
    
    (:action coger-caja
        :parameters (?l - localizacion ?c - caja ?d - dron ?b - brazo)
        :precondition (and (loc-dron ?l ?d) 
                        (loc-caja ?l ?c) 
                        (libre-brazo ?d ?b) 
                        (brazos-dron ?d ?b)
                        (caja-pendiente ?c) )
        :effect (and (carga-brazo ?c ?b) 
                    (not (loc-caja ?l ?c))
                    (not (libre-brazo ?d ?b))
        )
    )
)