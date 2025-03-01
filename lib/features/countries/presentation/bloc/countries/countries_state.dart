part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {
  const CountriesState();
  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  const CountriesLoaded({required this.countries});
  @override
  List<Object> get props => [countries];
}

class CountriesError extends CountriesState {
  final String message;
  const CountriesError({required this.message});
  @override
  List<Object> get props => [message];
}
