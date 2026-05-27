import personaje.*


class Mercado {
  var property image = "market.png"
  var property position
  var property cantMonedas

  method comprarSiPuede(productos) {
    const valorDeProductos = productos.sum({producto => producto.precio()})
    self.validarCompra(valorDeProductos)
    personaje.recibirPago(valorDeProductos)
    cantMonedas = cantMonedas - valorDeProductos
  }

  method validarCompra(valorDeProductos) {
    if (not(cantMonedas >= valorDeProductos)) {
        self.error("No tengo las monedas suficientes para comprar")
    }
  }

  method esMercado() {
    return true
  }

  method esCultivo() {
    return false
  }

}