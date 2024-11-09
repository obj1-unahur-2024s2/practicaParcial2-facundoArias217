class Personaje {
  const property fuerza
  const property inteligencia
  var rol

  method cambiarDeRol(unRol) {rol = unRol}
  method rol() = rol
  method poderOfensivo() = fuerza *10 + rol.extra()
  method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()
  method esInteligente() 
  method esGrosoEnSuRol() = rol.esGroso(self)
   
}

// Personajes
class Orco inherits Personaje {
  
  override method poderOfensivo() = super() * 1.1
  override method esInteligente() = false 
}

class Humano inherits Personaje {

  override method esInteligente() = inteligencia > 50
}

// Roles
/* cuando objetos y cuando clases? idea de singular=objeto /
plural=clase y cuando tienen atributos son clases*/

class Rol {
  method extra()
  method esGroso(unPersonaje)
}

object guerrero inherits Rol {
  override method extra() = 100
  override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

object brujo inherits  Rol {
  override method extra() = 0
  override method esGroso(unPersonaje) = false
}

class Cazador inherits Rol{
  var mascota 

  override method extra() = mascota.extra()
  override method esGroso(unPersonaje) = mascota.esLongeva()
}

// Mascota
class Mascota {
  const property fuerza
  var edad
  const property tieneGarras
  
  method edad() = edad
  method aumentarEdad() {edad += 1}
  method extra() = if(tieneGarras) fuerza *2 else fuerza
  method esLongeva() = edad > 10
}

