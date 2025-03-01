import 'package:bloc/bloc.dart';
import 'package:cubex_demo/features/countries/domain/usecases/get_countries.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/country.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountries getCountries;
  CountriesBloc({required this.getCountries}) : super(CountriesInitial()) {
    on<LoadCountries>((event, emit) async {
      emit(CountriesLoading());
      try {
        final countries = await getCountries();
        emit(CountriesLoaded(countries: countries));
      } catch (e) {
        emit(CountriesError(message: e.toString()));
      }
    });
  }
}
