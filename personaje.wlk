import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

	method regar() {
	  self.validarRegado()
	  game.uniqueCollider(self).regar()
	}

	method validarRegado() {
		if (not(game.getObjectsIn(position).any({obj => obj.esCultivo()}))) {
			self.error("No tengo nada para regar")
		}
	}

	method esCultivo() {
	  return false
	}

	method sembrar(cultivo) {
	  self.validarSiembra()
	  cultivo.sembrar()
	}

	method validarSiembra() {
	  if (not(game.colliders(self).isEmpty())) {
		self.error("No puedo sembrar algo donde ya hay un cultivo")
	  }
	}

	method sembrarTrigo() {
	  const trigo = new Trigo(position = self.position())
	  game.addVisual(trigo)
	}

	method sembrarMaiz() {
	  const maiz = new Maiz(position = self.position())
	  game.addVisual(maiz)
	}
	
	method sembrarTomaco() {
	  const tomaco = new Tomaco(position = self.position())
	  game.addVisual(tomaco)
	}
}