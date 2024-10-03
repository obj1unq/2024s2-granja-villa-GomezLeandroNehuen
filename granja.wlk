import wollok.game.*
import hector.*
import cultivos.*

object arriba {
	method siguiente(position) {
		return position.up(1)
	}
}

object abajo {
	method siguiente(position) {
		return position.down(1)
	}	
}

object izquierda {
	method siguiente(position) {
		return position.left(1)
	}
}
object derecha {
	method siguiente(position) {
		return position.right(1)
	}
}

object granja {
    var property sembrado = #{} 

    method sembrarSemilla(planta) {
        sembrado.add(planta)
    }

	method validarDentro(position) {
		if (not self.estaDentro(position)) {
			hector.error("No puedo moverme fuera del tablero")
		}
	}

	method estaDentro(position) {
		return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
	}

   	method validarSiPuedoPlantar() {
		if (self.hayPlantaEnPosicion()) { 
			self.error ("No se puede plantar acá.") 
		}
	}

    method hayPlantaEnPosicion() {
      return self.sembrado().any({planta => planta.position() == hector.position()})
    }

    method validarRegar() {
		if(self.hayPlantaEnPosicion()) {
			self.error ("No se puede regar acá.")
		}
	}

    method cultivoEn(position) {
        return self.sembrado().find({planta => planta.position() == position})
    }
}