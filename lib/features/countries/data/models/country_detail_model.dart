import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';

class CountryDetailModel extends CountryDetail {
  CountryDetailModel({
    required String name,
    required String capital,
    required String flag,
    required num area,
    required String languages,
    required num population,
    required String continent,
    required String timezones,
    required String mapUrl,
    required String coatOfArms,
    required String startOfWeek,
    required List capitalCoordinate,
    required String subRegion,
    required String countryCode,
    required String independent,
    required String unMember,
    required String currency,
  }) : super(
          name: name,
          capital: capital,
          flag: flag,
          area: area,
          languages: languages,
          population: population,
          continent: continent,
          timezones: timezones,
          mapUrl: mapUrl,
          coatOfArms: coatOfArms,
          startOfWeek: startOfWeek,
          capitalCoordinate: capitalCoordinate,
          subRegion: subRegion,
          countryCode: countryCode,
          independent: independent,
          unMember: unMember,
          currency: currency,
        );

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) {
    final name = json['name']['common'] as String;
    final capital = json['capital'][0] as String;
    final flag = json['flags']['png'] as String;
    final area = json["area"];
    final languages = (json['languages'] as Map).values.toList().join(",");
    final population = json['population'];
    final continent = json['continents'][0] as String;
    final timezones = json['timezones'][0] as String;
    final mapUrl = json['maps']['googleMaps'] as String;
    final coatOfArms = json['coatOfArms']['png'] as String;
    final startOfWeek = json['startOfWeek'] as String;
    final capitalCoordinate = json['latlng'] as List;
    final subRegion = json['subregion'] as String;
    final countryCode = (json['idd']["suffixes"] as List)
        .map<String>((suffix) => (json['idd']["root"]) + suffix)
        .toList()
        .join(",");
    final independent = json['independent'].toString();
    final unMember = json['unMember'].toString();
    final currency = (json['currencies'] as Map)
        .values
        .map<String>((cur) => cur["name"])
        .toList()
        .join(",");
    print(currency);

    return CountryDetailModel(
      name: name,
      languages: languages,
      capital: capital,
      flag: flag,
      area: area,
      continent: continent,
      population: population,
      timezones: timezones,
      mapUrl: mapUrl,
      coatOfArms: coatOfArms,
      startOfWeek: startOfWeek,
      capitalCoordinate: capitalCoordinate,
      subRegion: subRegion,
      countryCode: countryCode,
      independent: independent,
      unMember: unMember,
      currency: currency,
    );
  }
}
