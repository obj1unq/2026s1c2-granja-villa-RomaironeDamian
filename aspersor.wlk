import wollok.game.*
import personaje.*

class Aspersor {
   var property image = "aspersor.png"
   var property position

   method colocar() {
     game.addVisual(new Aspersor(position = personaje.position()))
   }

   method esCultivo() {
	  return false
   }

    method esMercado() {
        return false
    }

    method crecer() {
    }

   /*
   method regar() {
        self.regarCeldasLindantes()
   }
   
   method regarCeldasLindantes() {
        game.getObjectsIn(game.at(position.x(),position.y()+1)).forEach({objeto => objeto.crecer()})
        game.getObjectsIn(game.at(position.x()+1,position.y())).forEach({objeto => objeto.crecer()})
        game.getObjectsIn(game.at(position.x(),position.y()-1)).forEach({objeto => objeto.crecer()})
        game.getObjectsIn(game.at(position.x()-1,position.y())).forEach({objeto => objeto.crecer()})
   }
   */
   method regar2() {
     self.posicionesLindantes().forEach({posicion => self.regarHacia(posicion)})
   }

   method regarHacia(posicion) { 
     game.getObjectsIn(posicion).forEach({objeto => objeto.crecer()})
   }

   method posicionesLindantes() {
     return [game.at(position.x(),position.y()+1),
             game.at(position.x()+1,position.y()),
             game.at(position.x(),position.y()-1),
             game.at(position.x()-1,position.y())
             ]
   }
}

object aspersores {
  const aspersoresExistentes = []

  method colocar() {
    const aspersor = new Aspersor (position = personaje.position())
    game.addVisual(aspersor)
    aspersoresExistentes.add(aspersor)
  }

  method regar() {
     aspersoresExistentes.forEach({aspersor => aspersor.regar2()})
  }
}