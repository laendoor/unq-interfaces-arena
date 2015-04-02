package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleanieroUIArena.RaffleWindow
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.joda.time.LocalDate

class RaffleApplication extends Application {
	
	override createMainWindow() {
		var raffle = new Raffle()
		var p1 = new Person('Juan', new LocalDate(2000, 01, 01)) // same jose
		var p2 = new Person('Jose', new LocalDate(2000, 01, 01)) // same juan		
		var p3 = new Person('Tefi',   new LocalDate(2000, 02, 03))
		var p4 = new Person('Franco', new LocalDate(2000, 02, 04))

		raffle.addPerson(p1)
		raffle.addPerson(p2)
		raffle.addPerson(p3)
		raffle.addPerson(p4)
		
		new RaffleWindow(this, raffle)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
}
