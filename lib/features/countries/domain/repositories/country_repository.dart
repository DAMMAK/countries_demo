import 'package:cubex_demo/features/countries/domain/entities/country.dart';
import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountries();
  Future<CountryDetail> getCountryDetail(String name);
}
