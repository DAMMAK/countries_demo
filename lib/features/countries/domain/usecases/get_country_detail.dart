import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';

import '../repositories/country_repository.dart';

class GetCountryDetail {
  final CountryRepository repository;
  GetCountryDetail(this.repository);

  Future<CountryDetail> call(String name) async {
    return await repository.getCountryDetail(name);
  }
}
