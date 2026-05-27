import wollok.game.*

class Trigo {
	var property position
	var property image = "wheat_0.png"
	var property etapa = 0

	method precio() {
		return (etapa - 1) * 100
	}

	method crecer() {
	  if (etapa == 3) {
	  	etapa = 0
	  } else {
		etapa += 1
	  }
	  image = "wheat_"+ etapa.toString() + ".png"
	}

	method sembrar() {
	  game.addVisual(self)
	}

	method esCultivo() {
	  return true
	}

	method esMercado() {
        return false
    }

	method puedeSerCosechado() {
	  return etapa >= 2
	}

	method serCosechado() {
	  game.removeVisual(self)
	}
}

class Tomaco {
	var property position
	var property image = "tomaco.png"
	method crecer() {
	  if (game.height()-1 == position.y()) {
		position = game.at(position.x(), 0)
	  } else {
		position = game.at(position.x(), position.y() + 1)
	  }
	}

	method precio() {
		return 80
	}

	method sembrar() {
	  game.addVisual(self)
	}

	method esCultivo() {
	  return true
	}

	method esMercado() {
        return false
    }

	method serCosechado() {
	  game.removeVisual(self)
	}

	method puedeSerCosechado() {
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

	method crecer() {
		estado = maizAdulta
		image = estado.image()
	}

	method esCultivo() {
	  return true
	}

	method esMercado() {
        return false
    }

	method serCosechado() {
		game.removeVisual(self)
	}

	method puedeSerCosechado() {
	  return estado.puedeSerCosechado()
	}

	method precio() {
		return 150
	}

}

object maizBebe {
  var property image = "corn_baby.png"

  method puedeSerCosechado() {
	return false
  }
}

object maizAdulta {
  var property image = "corn_adult.png"

  method puedeSerCosechado() {
	return true
  }
}