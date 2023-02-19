import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/logic/cities_cubit.dart';
import 'package:weather/view/screens/weather_screen.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CitiesCubit>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectState(
                onCountryChanged: (String value) {
                  bloc.setCountry(value);
                },
                onStateChanged: (String value) {
                  bloc.setState(value);
                },
                onCityChanged: (String value) {
                  bloc.setCity(value);
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    if (bloc.city.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WeatherScreen()));
                    } else {
                      null;
                    }
                  },
                  child: const Text('Continue'))
            ],
          ),
        ),
      ),
    );
  }
}
