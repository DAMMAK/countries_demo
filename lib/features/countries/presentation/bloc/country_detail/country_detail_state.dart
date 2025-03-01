part of 'country_detail_bloc.dart';

sealed class CountryDetailState extends Equatable {
  const CountryDetailState();
  @override
  List<Object> get props => [];
}

final class CountryDetailInitial extends CountryDetailState {
  @override
  List<Object> get props => [];
}

class CountryDetailLoading extends CountryDetailState {}

class CountryDetailLoaded extends CountryDetailState {
  final CountryDetail country;
  const CountryDetailLoaded({required this.country});
  @override
  List<Object> get props => [country];
}

class CountryDetailError extends CountryDetailState {
  final String message;
  const CountryDetailError({required this.message});
  @override
  List<Object> get props => [message];
}
