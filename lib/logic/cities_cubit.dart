import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/networking/weather_repo.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit() : super(CitiesInitial());
  final WeatherRepo _repo = WeatherRepo();
  late String _country;
  late String _state;
  late String _city;
  bool _isImperial = false;

  String get country => _country;

  String get stat => _state;

  String get city => _city;

  bool get isImperial => _isImperial;

  void setCountry(String newCountry) {
    _country = newCountry;
  }

  void setState(String newState) {
    _state = newState;
  }

  void setCity(String newCity) {
    _city = newCity;
  }

  void changeNumberSystem() {
    _isImperial = !_isImperial;
    emit(UpdatedState());
  }

  getWeather() {
    _repo.getWeather(_city, _state, _country);
    emit(UpdatedState());
  }
}
