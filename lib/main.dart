import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/data/models/latlon.dart';
import 'package:weather/logic/weather_cubit.dart';
import 'package:weather/view/screens/choose_screen.dart';

Future<void> main() async {
  //await initHive();
  runApp(const MyApp());
}

/*Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('savedCities');
  await Hive.openBox('lastForecast');
  Hive.registerAdapter(LatLonAdapter());
  Hive.registerAdapter(ForecastAdapter());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create: (context) => WeatherCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ChooseScreen(),
      ),
    );
  }
}
