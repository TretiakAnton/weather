import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/logic/cities_cubit.dart';
import 'package:weather/view/widgets/weather_data_view.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CitiesCubit>();
    bloc.getWeather();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                for (int i = 0; i < 5; i++) {}
                return WeatherData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
