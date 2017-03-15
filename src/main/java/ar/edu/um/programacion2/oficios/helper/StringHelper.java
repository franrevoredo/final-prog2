package ar.edu.um.programacion2.oficios.helper;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringHelper {

	public static String rmEspeciales(String input) {
		String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\P{ASCII}+"); 
		return pattern.matcher(normalized).replaceAll("");//removemos los caracteres Especiales ASCII
	}
}
