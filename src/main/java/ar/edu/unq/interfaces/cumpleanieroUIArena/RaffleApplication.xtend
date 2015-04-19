package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.joda.time.LocalDate
import org.joda.time.DateTimeUtils
import org.joda.time.DateTime

class RaffleApplication extends Application {
	
	override createMainWindow() {
		DateTimeUtils.setCurrentMillisFixed(new DateTime(2015, 1, 1, 0, 0, 0).millis);
		
		// FIXME volar cuando se puedan agregar personas por la vista
		var raffle = new Raffle()
		var p1 = new Person('Juan',   new LocalDate(2010,  1,  1)) // same jose
		var p2 = new Person('Jose',   new LocalDate(2015,  1,  1)) // same juan		
		var p3 = new Person('Tefi',   new LocalDate(2012,  2,  3))
		var p4 = new Person('Franco', new LocalDate(2013,  2,  4))
		var p5 = new Person('Gise',   new LocalDate(2013,  4, 23))
		var p6 = new Person('Nico',   new LocalDate(2013,  4, 18))
		var p7 = new Person('Alan',   new LocalDate(2013,  6, 15))
		var p8 = new Person('Lean',   new LocalDate(2013,  7, 30))
		var p9 = new Person('Tincho', new LocalDate(2013,  8, 11))
		var p10 = new Person('Sofi',  new LocalDate(2013,  9,  2))
		var p11 = new Person('Leila', new LocalDate(2013, 12, 12))

		raffle.addPerson(p1)
		raffle.addPerson(p2)
		raffle.addPerson(p3)
		raffle.addPerson(p4)
		raffle.addPerson(p5)
		raffle.addPerson(p6)
		raffle.addPerson(p7)
		raffle.addPerson(p8)
		raffle.addPerson(p9)
		raffle.addPerson(p10)
		raffle.addPerson(p11)
		
		raffle.setAsParticipant(p1)
		raffle.setAsParticipant(p2)
		raffle.setAsParticipant(p3)
		raffle.setAsParticipant(p4)
		
		raffle.shake()

	  	new WelcomeWindow(this, raffle)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
}
