import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  onFieldSubmitted: (value) async {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: value);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'search',
                    hintText: 'Enter city name',
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                  ),
                  controller: controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'not valid';
                    }
                    return 'please enter city name';
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validate,
  });

  final TextEditingController controller;
  final String Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'search',
        hintText: 'Enter city name',
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
      controller: controller,
      validator: validate,
    );
  }
}
