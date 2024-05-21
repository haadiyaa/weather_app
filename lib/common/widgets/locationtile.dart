
import 'package:flutter/material.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class LocationTile extends StatelessWidget {
  LocationTile({
    super.key,
    required this.locationCity,
  });

   var locationCity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(location, color: red),
        width10,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              locationCity.isEmpty
                  ? "Unknown Location"
                  : locationCity,
              style: titleStyle,
            ),
          ],
        )
      ],
    );
  }
}
