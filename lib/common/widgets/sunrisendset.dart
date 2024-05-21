
import 'package:flutter/material.dart';
import 'package:weather/utils/constants/constants.dart';

class SunrisendSet extends StatelessWidget {
  const SunrisendSet({
    super.key,
    required this.formattedSunrise,
    required this.formattedSunset,
  });

  final String formattedSunrise;
  final String formattedSunset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(sunrise),
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text('Sunrise'),
                Text(formattedSunrise ?? "N/A")
              ],
            )
          ],
        ),
        Row(
          children: [
            Image(
              image: AssetImage(sunset),
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text('Sunset'),
                Text(formattedSunset ?? "N/A")
              ],
            )
          ],
        )
      ],
    );
  }
}
