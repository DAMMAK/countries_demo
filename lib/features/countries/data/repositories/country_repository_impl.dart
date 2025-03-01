import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';

import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';
import '../datasources/country_remote_datasource.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  CountryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Country>> getCountries() async {
    return await remoteDataSource.fetchCountries();
  }

  @override
  Future<CountryDetail> getCountryDetail(String name) async {
    return await remoteDataSource.fetchCountryDetail(name);
  }
}
