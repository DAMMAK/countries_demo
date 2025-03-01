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

  static String getCountryCode(Map<String, dynamic>? idd) {
    if (idd == null || idd.isEmpty) {
      return '';
    }

    return (idd["suffixes"] as List)
        .map<String>((suffix) => (idd["root"]) + suffix)
        .toList()
        .join(",");
  }

  static String getCurrencyString(Map<String, dynamic>? currencies) {
    if (currencies == null || currencies.isEmpty) {
      return '';
    }

    return currencies.values.map<String>((cur) => cur["name"]).join(", ");
  }
}
