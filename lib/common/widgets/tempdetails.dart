
import 'package:flutter/material.dart';
import 'package:weather/services/weather_service_provider.dart';
import 'package:weather/utils/constants/constants.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required this.weatherProvider,
  });

  final WeatherServiceProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(hightemp),
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text('High Temp'),
                Text(
                    "${weatherProvider.weather?.main?.tempMax?.toStringAsFixed(0) ?? "N/A"}\u00B0 C"),
              ],
            )
          ],
        ),
        Row(
          children: [
            Image(
              image: AssetImage(lowtemp),
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text('Low Temp'),
                Text(
                    "${weatherProvider.weather?.main?.tempMin?.toStringAsFixed(0) ?? "N/A"}\u00B0 C"),
              ],
            )
          ],
        )
      ],
    );
  }
}
