package com.util;

import javax.servlet.http.HttpServletRequest;

public class OtherCheckboxInput {
	public String processLanguages(HttpServletRequest request) {
		String language = "";
		String[] languages = request.getParameterValues("language");
		if (languages != null && languages.length > 0) {
			language = String.join(",", languages);
		}
		if (language.contains("other")) {
			String otherLanguage = request.getParameter("otherLanguage");
			if (otherLanguage != null && !otherLanguage.isEmpty()) {
				language += "," + otherLanguage;
			}
		}
		return language;
	}
}
