package ar.edu.unq.interfaces.cumpleanieroUIArena.transformers

import org.apache.commons.collections15.Transformer
import org.joda.time.LocalDate

class TakePartTransformer implements Transformer<String, String>{
	
	override transform(String input) {
		if(input == "false"){
			"No"	
		}else{
			"Si"
		}		
	}
	
}