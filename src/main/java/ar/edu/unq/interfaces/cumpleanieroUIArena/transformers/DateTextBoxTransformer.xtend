package ar.edu.unq.interfaces.cumpleanieroUIArena.transformers

import org.uqbar.arena.bindings.Transformer
import org.joda.time.LocalDate
import org.apache.commons.lang.StringUtils
import org.uqbar.commons.model.UserException
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat

class DateTextBoxTransformer implements Transformer<LocalDate, String>{
	String pattern = "dd/MM/yyyy";
	
	override getModelType() {
		LocalDate
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(LocalDate valueFromModel) {
		valueFromModel.toString(pattern)
	}
	
	override viewToModel(String valueFromView) {
		try {
			if(StringUtils.isBlank(valueFromView)){
				null
			}else{
				var DateTimeFormatter dtf = DateTimeFormat.forPattern("dd/MM/yyyy");
				var LocalDate date = dtf.parseLocalDate(valueFromView);
				date
			}
		}catch (Exception e) {
			throw new UserException("Debe ingresar una fecha en formato: " + this.pattern);
		}
	}
	
}	
