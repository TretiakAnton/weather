import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/cities_cubit.dart';
import 'package:weather/view/widgets/side_menu.dart';
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
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: BlocBuilder<CitiesCubit, CitiesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Your city is: '),
                      Text(bloc.city),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Temperature now is: '),
                      //TODO change data
                      Text(bloc.stat),
                    ],
                  ),
/*            const Text('If you want to change please select another'),
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
              ),*/
                  ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      for (int i = 0; i < 5; i++) {}
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: WeatherData(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
