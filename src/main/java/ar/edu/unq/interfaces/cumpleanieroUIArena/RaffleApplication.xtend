package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.Application
import ar.edu.unq.interfaces.cumpleaniero.Raffle

class RaffleApplication extends Application {
	
	override createMainWindow() {
	  	new WelcomeWindow(this, new Raffle)
	}
	
	def static main(String[] args) {
		new RaffleApplication().start
	}
}
