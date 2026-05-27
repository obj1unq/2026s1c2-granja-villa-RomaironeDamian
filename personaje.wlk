import cultivos.*
import wollok.game.*
import aspersor.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = []
	var property saldo = 0

	// ACCIONES

	method sembrar(cultivo) {
	  self.validarSiembra()
	  cultivo.sembrar()
	}

	method regar() {
	  self.validarRegado()
	  game.uniqueCollider(self).crecer()
	}

	method cosechar() {
	  // tengo dudas sobre la delegacion de responsabilidades en este punto, para mi esta hecho de la forma logica
	  // pero, estaria mal que sea un unico method que lo mande a cosechar y que la planta
	  // calcule si puede ser cosechada y en caso que si pueda, llame a un method del personaje
	  // devolviendose a si misma para que se guarde en el personaje
	  self.validarCosecha()
	  if (game.uniqueCollider(self).puedeSerCosechado()) {
		plantasCosechadas.add(game.uniqueCollider(self))
	  	game.uniqueCollider(self).serCosechado()
	  }
	}

	method desplegarAspersor() {
	  self.validarEspacio()
	  aspersores.colocar()
	}

	method venderStock() {
	  self.validarMercado()
	  game.uniqueCollider(self).comprarSiPuede(plantasCosechadas)
	  plantasCosechadas.clear()
	}

	method recibirPago(cantMonedas) {
	  saldo += cantMonedas
	}

	method agregarPlantasCosechadas(plantas) { // UNICAMENTE PARA LOS TEST
	  plantas.forEach({planta => plantasCosechadas.add(planta)})
	}

	// VALIDADORES

	method validarSiembra() {
	  if (not(game.colliders(self).isEmpty())) {
		self.error("No puedo sembrar algo donde ya hay un cultivo")
	  }
	}

	method validarRegado() {
		if (not(game.getObjectsIn(position).any({obj => obj.esCultivo()}))) {
			self.error("No tengo nada para regar")
		}
	}

	method validarCosecha() {
		if (not(game.getObjectsIn(position).any({obj => obj.esCultivo()}))) {
			self.error("no tengo nada para cosechar")
		}
	}

	method validarEspacio() {
	  	if (not(game.colliders(self).isEmpty())) {
			self.error("no puedo colocar un aspersor aca")
		}
	}

	method validarMercado() {
		if (not(game.getObjectsIn(position).any({obj => obj.esMercado()}))) {
			self.error("necesito estar en un mercado para vender")
		}
	}

	// Consultas

	method saldoYStock() {
	  game.say(self, "tengo " + saldo + " monedas y " + plantasCosechadas.size() + " plantas para vender")
	}

	method esCultivo() {
	  return false
	}

	method esMercado() {
        return false
    }

	method crecer() {
	}
}