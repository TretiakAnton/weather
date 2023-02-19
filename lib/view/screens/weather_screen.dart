import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/weather_cubit.dart';
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
    final bloc = context.read<WeatherCubit>();
    bloc.getWeather();
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return bloc.forecast != null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Your city is: '),
                          Text(bloc.city),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Units of measurement is: '),
                          Text(bloc.isImperial ? 'imperial' : 'metric'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Temperature now is: '),
                          Text(bloc.forecast!.current.temp.toString()),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              for (int index = 0; index < 5; index++) {}
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: WeatherData(
                                    bloc.forecast!, index, bloc.today),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Forecast is loading'),
                    CircularProgressIndicator(),
                  ],
                );
        },
      ),
    );
  }
}
