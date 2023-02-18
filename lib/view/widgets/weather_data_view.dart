import 'package:flutter/material.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text('day: '),
            Text('today'),
          ],
        ),
        Row(
          children: const [
            Text('temperature: '),
            Text('data'),
          ],
        ),
        Row(
          children: const [
            Text('humidity: '),
            Text('data'),
          ],
        ),
        Row(
          children: const [
            Text('pressure: '),
            Text('data'),
          ],
        ),
      ],
    );
  }
}
