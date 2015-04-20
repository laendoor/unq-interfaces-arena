package ar.edu.unq.interfaces.cumpleanieroUIArena.transformers

import org.apache.commons.collections15.Transformer
import org.joda.time.LocalDate

class DateTableTransformer implements Transformer<String, String>{
	
	override transform(String input) {
		var date = new LocalDate(input);
		return date.toString('dd/MM')
	}
	
}