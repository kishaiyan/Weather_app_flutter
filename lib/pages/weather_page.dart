import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _wetherService =
      WeatherService(apiKey: "126b983a907cb70e262701547eefbbd5");
  Weather? _weather;

  _fetchWeather() async {
    String city = await _wetherService.getCurrentCity();

    try {
      final weather = await _wetherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      print(error);
    }
  }

  String getAnimation(String? maincondition) {
    if (maincondition == null) return 'assets/sunny.json';
    switch (maincondition) {
      default:
        return 'assets/rainy.json';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.city ?? "Loading",
            ),
            Lottie.asset(getAnimation(_weather?.mainCondition),
                repeat: true, fit: BoxFit.fill),
            Text('${_weather?.temperature.round()}°C'),
          ],
        ),
      ),
    );
  }
}
