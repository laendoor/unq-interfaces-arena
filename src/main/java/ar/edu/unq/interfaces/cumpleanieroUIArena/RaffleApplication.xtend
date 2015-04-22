package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.joda.time.LocalDate

class RaffleApplication extends Application
{
	override createMainWindow()
	{
		var raffle = this.initTestPopulation
		
	  	new WelcomeWindow(this, raffle)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
	
	protected def initTestPopulation()
	{
		// FIXME sacar -> cargo gente para no tener que ir agregando
		var p1 = new Person('Juan', new LocalDate(2012, 1, 3))
		var p2 = new Person('Tefi', new LocalDate(2013, 1, 15))
		var p3 = new Person('Juancho', new LocalDate(2014, 2, 3))
		var p4 = new Person('Jose', new LocalDate(2015, 3, 20))
		var p5 = new Person('Pedro', new LocalDate(2012, 4, 13))
		var p6 = new Person('Pablo', new LocalDate(2012, 6, 7))
		var p7 = new Person('Piti', new LocalDate(2015, 6, 8))
		var p8 = new Person('Pepe', new LocalDate(2016, 6, 9))
		var p9 = new Person('Lean', new LocalDate(2012, 7, 20))
		var p10 = new Person('Sofia', new LocalDate(2013, 8, 22))
		var p11 = new Person('Nico', new LocalDate(2014, 9, 29))
		var p12 = new Person('Gise', new LocalDate(2015, 10, 13))
		var p13 = new Person('Alan', new LocalDate(2012, 11, 21))
		var p14 = new Person('Franco', new LocalDate(2013, 11, 7))
		var p15 = new Person('Estanislao', new LocalDate(2015, 12, 12))
		
		var r = new Raffle(#[p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15])
		
		r.asParticipant = p1
		r.asParticipant = p2
		r.asParticipant = p3
		r.asParticipant = p4
		r.asParticipant = p5
		r.asParticipant = p6
		r.asParticipant = p7
		r.asParticipant = p8
		r.asParticipant = p9
		r.asParticipant = p10
		r.asParticipant = p11
		r.asParticipant = p12
		r.asParticipant = p13
		r.asParticipant = p14
		r.asParticipant = p15
		
		r
	}
}
