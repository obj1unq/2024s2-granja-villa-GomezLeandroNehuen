import wollok.game.*
import granja.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	var property dinero =  0


	method mover(direccion){
		const newPosition = direccion.siguiente(position)
		granja.validarDentro(newPosition)
		position = direccion.siguiente(position)
	}

	method sembrarTrigo() {
		granja.validarSiPuedoPlantar()
		const trigo = new Trigo (position = self.position())
		game.addVisual (trigo)
		granja.sembrarSemilla(trigo)
	}

	method sembrarMaiz() {
		granja.validarSiPuedoPlantar()
		const maiz = new Maiz (position = self.position())
		game.addVisual (maiz)
		granja.sembrarSemilla(maiz)
	}

	method sembrarTomaco() {
		granja.validarSiPuedoPlantar()
		const tomaco =  new Tomaco (position  = self.position())
		game.addVisual (tomaco)
		granja.sembrarSemilla(tomaco)
	}

	method regarAca() {
		granja.validarRegar()
		granja.cultivoEn(self.position()).regar()
	}

}





