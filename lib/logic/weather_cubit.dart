import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/forecast.dart';
import 'package:weather/networking/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial()) {
    final DateTime now = DateTime.now();
    _today = now.weekday;
  }
  final WeatherRepo _repo = WeatherRepo();
  Forecast? _forecast;
  late String _country;
  late String _state;
  late String _city;
  late int _today;
  bool _isImperial = false;

  String get country => _country;

  String get stat => _state;

  String get city => _city;

  bool get isImperial => _isImperial;

  Forecast? get forecast => _forecast;

  int get today => _today;

  void setCountry(String newCountry) {
    _country = newCountry;
  }

  void setState(String newState) {
    _state = newState;
  }

  Future<void> setCity(String newCity) async {
    _city = newCity;
    emit(UpdatedState());
    await getWeather();
  }

  Future<void> changeNumberSystem() async {
    _isImperial = !_isImperial;
    emit(UpdatedState());
    await getWeather();
  }

  Future<void> getWeather() async {
    _forecast = await _repo.getWeather(_city, _isImperial);
    emit(UpdatedState());
  }
}
