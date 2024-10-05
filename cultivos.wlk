import wollok.game.*
import hector.*
import granja.*


class Maiz {
	var property position
	var property image = "corn_baby.png"
	var etapaEvolutiva = 0

	method regar() {
		image = "corn_adult.png"
		etapaEvolutiva = 1
	}
}

class Trigo {
	var property position
	var property image = "wheat_0.png"
	var etapaEvolutiva = 0	

	method regar() {
		if (etapaEvolutiva < 3) {
			etapaEvolutiva += 1
			image = "wheat_" + (etapaEvolutiva) + ".png"
		}
		else {
			etapaEvolutiva = 0
			image = "wheat_0.png"
		}
	}
}

class Tomaco { 
	var property position
	var property image = "tomaco.png"

	method regar() { // No funciona.
 		const nuevaPosicion = game.at (self.position().x(),self.position().y() + 1)
		if (not granja.hayPlantaEnPosicion()) {
			self.position(nuevaPosicion)
		} else if (not granja.hayPlantaEnPosicion()) {
			self.position(game.at(self.position().x(), 0))
		}
	}
}


