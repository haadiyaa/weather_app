import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/common/widgets/frostedglass.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(),
      body: Container(
        padding: homePadding,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(background[1]),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(location, color: red),
                        width10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dubai',
                              style: titleStyle,
                            ),
                            Text(
                              'Good Morning',
                              style: subtitleStyle,
                            ),
                            // FrostedGlassBox(width: 200, height: 100, child: Text('data'))
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(search),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.5),
              child: FittedBox(
                fit: BoxFit.contain ,
                child: FrostedGlassBox(
                  width: size.width * 0.7,
                  height: size.height * 0.5,
                  child: Column(
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
                          Text(
                            'Thunderstorm',
                            style: typeStyle
                          ),
                          Text(DateTime.now().toString())
                        ],
                      ),
                      Row(
                        children: [
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
