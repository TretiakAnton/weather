import 'package:flutter/material.dart';
import 'package:weather/data/models/forecast.dart';

class WeatherData extends StatelessWidget {
  WeatherData(this.forecast, this.index, this.today, {Key? key})
      : super(key: key);
  final Forecast forecast;
  final int index;
  int today;

  @override
  Widget build(BuildContext context) {
    today += index;
    if (today > 7) {
      today -= 7;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Day: '),
              Text(index == 0
                  ? 'Today'
                  : index == 1
                      ? 'Tomorrow'
                      : getWeekdayName(today)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Max temperature: '),
              Text(forecast.daily[today].temp.max.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Min temperature: '),
              Text(forecast.daily[today].temp.min.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Humidity: '),
              Text(forecast.daily[today].humidity.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Pressure: '),
              Text(forecast.daily[today].pressure.toString()),
            ],
          ),
        ),
      ],
    );
  }

  String getWeekdayName(int weekdayIndex) {
    switch (weekdayIndex) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Invalid weekday";
    }
  }
}
