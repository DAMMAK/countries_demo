import 'package:cubex_demo/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

import 'features/countries/data/datasources/country_remote_datasource.dart';
import 'features/countries/data/repositories/country_repository_impl.dart';
import 'features/countries/domain/repositories/country_repository.dart';
import 'features/countries/domain/usecases/get_countries.dart';
import 'features/countries/domain/usecases/get_country_detail.dart';
import 'features/countries/presentation/bloc/countries/countries_bloc.dart';
import 'features/countries/presentation/bloc/country_detail/country_detail_bloc.dart';

final ioc = GetIt.instance;

Future<void> init() async {
  // Bloc
  ioc.registerLazySingleton(() => CountriesBloc(getCountries: ioc()));
  ioc.registerLazySingleton(() => CountryDetailBloc(getCountryDetail: ioc()));

  // Use cases
  ioc.registerLazySingleton(() => GetCountries(ioc()));
  ioc.registerLazySingleton(() => GetCountryDetail(ioc()));

  // Repository
  ioc.registerLazySingleton<CountryRepository>(
      () => CountryRepositoryImpl(remoteDataSource: ioc()));

  // Data sources
  ioc.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(client: ioc<DioClient>()));

  // External: Dio
  ioc.registerLazySingleton(() => DioClient());
}
