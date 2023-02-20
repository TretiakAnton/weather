import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/logic/weather_cubit.dart';
import 'package:weather/view/screens/weather_screen.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherCubit>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectState(
                onCountryChanged: (String value) {
                  if (value != 'Choose Country') {
                    bloc.setCountry(value);
                  }
                },
                onStateChanged: (String value) {
                  if (value != 'Choose State') {
                    bloc.setState(value);
                  }
                },
                onCityChanged: (String value) {
                  if (value != 'Choose City') {
                    bloc.setCity(value);
                  }
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
