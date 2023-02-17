import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/logic/cities_cubit.dart';

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
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
