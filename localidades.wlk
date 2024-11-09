import personajes.*

class Localidad{
    var ejercito 


    method potenciaDefensiva() = ejercito.potenciaTotal()
    method serOcupada(unEjercito){
        ejercito = unEjercito
    }
    //method invasion(ejercito)
}

class Aldea inherits Localidad {
    const property cantMaximaPersonajes

    override method serOcupada(unEjercito){
        if(unEjercito.size() > cantMaximaPersonajes){
            ejercito = unEjercito.nuevoEjercitoFuerte(10)
        }
    }

}

class Ciudad inherits Localidad {
    override method potenciaDefensiva() = super() + 200
    override method serOcupada(unEjercito){
        ejercito = unEjercito
    }
  
}

class Ejercito {
    const property personajes = [] 
    
    method potenciaTotal() = personajes.sum({p=> p.poderOfensivo()})
    method puedeTomarLocalidad(unaLocalidad) = self.potenciaTotal() > unaLocalidad.potencialTotal()
    method invadir(unaLocalidad){
        if (self.puedeTomarLocalidad(unaLocalidad)){
            unaLocalidad.serOcupada(self)
        }
    }
    method nuevoEjercitoFuerte(unaCantidad){
        const nuevoEjercito = personajes.sortBy({p1, p2 => p1.poderOfensivo() > p2.poderOfensivo()}).take(unaCantidad)
        personajes.removeAll(nuevoEjercito)
        return new Ejercito (
            personajes = nuevoEjercito
        )
    }
}