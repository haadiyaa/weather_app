
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/common/widgets/frostedglass.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
      width: size.width * 0.7,
      height: size.height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            width: 150,
            height: 150,
            image: AssetImage(icons[1]),
          ),
          Column(
            children: [
              Text(
                '17 °C',
                style: tempStyle,
              ),
              Text('Thunderstorm', style: typeStyle),
              Text(DateFormat('dd MMM yy  |  HH:mm a').format(DateTime.now()),style: datetimeStyle,)
            ],
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(hightemp),
                    width: 50,
                    height: 50,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('High Temp'), Text('21 °C')],
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Low Temp'), Text('21 °C')],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(sunrise),
                    width: 50,
                    height: 50,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Sunrise'), Text('21 °C')],
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Sunset'), Text('21 °C')],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
