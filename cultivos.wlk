import wollok.game.*

class Trigo {
	var property position
	var property image = "wheat_0.png"
	var property ciclo = 0
	method regar() {
	  if (ciclo == 3) {
	  	ciclo = 0
	  } else {
		ciclo += 1
	  }
	  image = "wheat_"+ ciclo.toString() + ".png"
	}

	method sembrar() {
	  game.addVisual(self)
	}

	method esCultivo() {
	  return true
	}
}

class Tomaco {
	var property position
	var property image = "tomaco.png"
	method regar() {
	  if (game.height()-1 == position.y()) {
		position = game.at(position.x(), 0)
	  } else {
		position = game.at(position.x(), position.y() + 1)
	  }
	}

	method sembrar() {
	  game.addVisual(self)
	}

	method esCultivo() {
	  return true
	}
}

class Maiz {
	var property position
	var property estado = maizBebe
	var property image = estado.image()

	method sembrar() {
	  game.addVisual(self)
	}

	method regar() {
		estado = maizAdulta
		image = estado.image()
	}

	method esCultivo() {
	  return true
	}
}

object maizBebe {
  var property image = "corn_baby.png"
}

object maizAdulta {
  var property image = "corn_adult.png"
}