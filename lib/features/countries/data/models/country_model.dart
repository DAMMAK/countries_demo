import '../../domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    required String name,
    required List<String> languages,
    required String capital,
    required String flagUrl,
  }) : super(
            name: name,
            languages: languages,
            capital: capital,
            flagUrl: flagUrl);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final name = json['name']['common'] as String;
    final languagesMap = json['languages'] as Map<String, dynamic>? ?? {};
    final languages = languagesMap.values.map((e) => e.toString()).toList();
    final capitalList = json['capital'] as List<dynamic>? ?? [];
    final capital = capitalList.isNotEmpty ? capitalList.first.toString() : '';
    final flagUrl = json['flags']?['png'] as String? ?? '';
    return CountryModel(
      name: name,
      languages: languages,
      capital: capital,
      flagUrl: flagUrl,
    );
  }
}
