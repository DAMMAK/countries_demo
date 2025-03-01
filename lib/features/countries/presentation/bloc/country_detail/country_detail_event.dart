part of 'country_detail_bloc.dart';

sealed class CountryDetailEvent extends Equatable {
  const CountryDetailEvent();
}

class LoadCountryDetail extends CountryDetailEvent {
  final String name;
  const LoadCountryDetail({required this.name});
  @override
  List<Object> get props => [name];
}
