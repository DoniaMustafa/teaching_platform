part of 'countries_cubit.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}
class CountriesLoadingState extends CountriesInitial {}
class CountriesLoadedState extends CountriesInitial {
 final List<PublicDataModel> date;

  CountriesLoadedState({required this.date});
}
class CountriesErrorState extends CountriesInitial {

  final String message;
  CountriesErrorState({required this.message});
}
