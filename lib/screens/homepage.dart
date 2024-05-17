import 'package:flutter/material.dart';
import 'package:weather/common/widgets/frostedglass.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _clicked=false;

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
          _clicked==true?  Positioned(
              top: 50,
              right: 20,
              left: 20,
              child: Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:BorderSide(color: white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: white),
                    ),
                  ),
                ),
              ),
            ):SizedBox(),
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
                    onPressed: () {
                      setState(() {
                        _clicked=!_clicked;
                      });
                    },
                    icon: Icon(search),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: FrostedGlassBox(
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
                          Text(DateTime.now().toString())
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('Low Temp'), Text('21 °C')],
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
                              Column(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('Sunset'), Text('21 °C')],
                              )
                            ],
                          )
                        ],
                      ),
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
