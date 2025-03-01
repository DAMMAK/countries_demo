class CountryUtils {
  static String getLanguagesString(Map<String, dynamic>? languages) {
    if (languages == null || languages.isEmpty) {
      return '';
    }

    return languages.values.join(', ');
  }

  static String getCapitalString(List<dynamic>? capitals) {
    if (capitals == null || capitals.isEmpty) {
      return '';
    }

    return capitals.join(', ');
  }
}
