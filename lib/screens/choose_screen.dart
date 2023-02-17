import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SelectState(
            onCountryChanged: (String value) {},
            onStateChanged: (String value) {},
            onCityChanged: (String value) {},
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Continue'))
        ],
      ),
    );
  }
}
