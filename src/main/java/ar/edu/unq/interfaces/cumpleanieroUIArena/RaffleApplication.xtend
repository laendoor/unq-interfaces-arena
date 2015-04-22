package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.joda.time.LocalDate

class RaffleApplication extends Application
{
	override createMainWindow()
	{
		// FIXME sacar -> cargo gente para no tener que ir agregando
		//                a mano para probar el next birthday
		var p1 = new Person('Juan', new LocalDate(2015, 1, 3))
		var p2 = new Person('Jose', new LocalDate(2015, 3, 20))
		var p3 = new Person('Pedro', new LocalDate(2015, 5, 13))
		var p4 = new Person('Pablo', new LocalDate(2015, 6, 7))
		var p5 = new Person('Estanislao', new LocalDate(2015, 12, 12))
		
		var r = new Raffle(#[p1, p2, p3, p4, p5])
		
		r.asParticipant = p1
		r.asParticipant = p2
		r.asParticipant = p3
		r.asParticipant = p4
		r.asParticipant = p5
		
	  	new WelcomeWindow(this, r)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
}
