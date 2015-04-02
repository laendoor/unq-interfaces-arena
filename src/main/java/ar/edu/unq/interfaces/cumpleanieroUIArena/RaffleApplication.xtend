package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleanieroUIArena.RaffleWindow
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.joda.time.LocalDate
import org.joda.time.DateTimeUtils
import org.joda.time.DateTime

class RaffleApplication extends Application {
	
	override createMainWindow() {
		DateTimeUtils.setCurrentMillisFixed(new DateTime(2015, 1, 1, 0, 0, 0).millis);
		var raffle = new Raffle()
		var p1 = new Person('Juan', new LocalDate(2020, 01, 01)) // same jose
		var p2 = new Person('Jose', new LocalDate(2020, 01, 01)) // same juan		
		var p3 = new Person('Tefi',   new LocalDate(2020, 02, 03))
		var p4 = new Person('Franco', new LocalDate(2020, 02, 04))

		p1.takePart = true
		p2.takePart = true
		p3.takePart = true
		p4.takePart = true

		raffle.addPerson(p1)
		raffle.addPerson(p2)
		raffle.addPerson(p3)
		raffle.addPerson(p4)
		
		raffle.shake()
		
		new RaffleWindow(this, raffle)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
}
