import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/cities_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CitiesCubit>();
    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const Text('Imperial number system'),
                Switch(
                    value: bloc.isImperial,
                    onChanged: (bool value) {
                      bloc.changeNumberSystem();
                    })
              ],
            )
          ],
        );
      },
    );
  }
}
