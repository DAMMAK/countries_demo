import 'package:bloc/bloc.dart';
import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';
import 'package:cubex_demo/features/countries/domain/usecases/get_country_detail.dart';
import 'package:equatable/equatable.dart';

part 'country_detail_event.dart';
part 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  final GetCountryDetail getCountryDetail;
  CountryDetailBloc({required this.getCountryDetail})
      : super(CountryDetailInitial()) {
    on<LoadCountryDetail>((event, emit) async {
      emit(CountryDetailLoading());
      try {
        final country = await getCountryDetail(event.name);
        emit(CountryDetailLoaded(country: country));
      } catch (e) {
        emit(CountryDetailError(message: e.toString()));
      }
    });
  }
}
