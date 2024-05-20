import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/common/widgets/detailstile.dart';
import 'package:weather/common/widgets/frostedglass.dart';
import 'package:weather/services/location_provider.dart';
import 'package:weather/services/weather_service_provider.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.determinePosition().then((_) {
      if (locationProvider.currentLocationName != null) {
        var city = locationProvider.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city);
        }
      }
    });
  }

  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider = Provider.of<WeatherServiceProvider>(context);

    int sunriseTimestamp=weatherProvider.weather?.sys?.sunrise??0;
    int sunsetTimestamp=weatherProvider.weather?.sys?.sunset??0;

    int timezoneOffest=weatherProvider.weather?.timezone??0;
    //convert to datetime
    DateTime sunriseDateTime=DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp*1000,isUtc: true).add(Duration(seconds: timezoneOffest));
    DateTime sunsetDateTime=DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp*1000,isUtc: true).add(Duration(seconds: timezoneOffest));

    //format as string
    String formattedSunrise=DateFormat('hh:mm a').format(sunriseDateTime);
    String formattedSunset=DateFormat('hh:mm a').format(sunsetDateTime);

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
            image: AssetImage(backgrounds[
                    weatherProvider.weather?.weather![0].main ?? "N/A"] ??
                "assets/bg/sunny.jpg"),
          ),
        ),
        child: Stack(
          children: [
            _clicked == true
                ? Positioned(
                    top: 50,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: white),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Container(
              height: 50,
              child: Consumer<LocationProvider>(
                builder: (context, locationProvider, child) {
                  var locationCity;
                  if (locationProvider.currentLocationName != null) {
                    locationCity =
                        locationProvider.currentLocationName!.locality;
                  } else {
                    locationCity = "Unknown Location";
                  }

                  return Row(
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
                                  locationCity.isEmpty
                                      ? "Unknown Location"
                                      : locationCity,
                                  style: titleStyle,
                                ),
                                Text(
                                  'Good Morning',
                                  style: subtitleStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _clicked = !_clicked;
                          });
                        },
                        icon: Icon(search),
                      ),
                    ],
                  );
                },
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
                        image: AssetImage(weatherConditions[
                                weatherProvider.weather?.weather![0].main ??
                                    "N/A"] ??
                            "assets/weathericon/sun.png"),
                      ),
                      Column(
                        children: [
                          Text(
                            '${weatherProvider.weather?.main?.temp?.toStringAsFixed(0) ??
                                "N/A"}\u00B0 C',
                            style: tempStyle,
                          ),
                          Text(
                              weatherProvider.weather?.weather?[0].main
                                  .toString()??"N/A",
                              style: typeStyle),
                          Text(
                            DateFormat('dd MMM yy  |  HH:mm a')
                                .format(DateTime.now()),
                            style: datetimeStyle,
                          )
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
                                children: [
                                  const Text('High Temp'),
                                  Text("${weatherProvider.weather?.main?.tempMax?.toStringAsFixed(0)??"N/A"}\u00B0 C"),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const Text('Low Temp'), Text("${weatherProvider.weather?.main?.tempMin?.toStringAsFixed(0)??"N/A"}\u00B0 C"),],
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
                                children: [const Text('Sunrise'), Text(formattedSunrise??"N/A")],
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
                                children: [Text('Sunset'), Text(formattedSunset??"N/A")],
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
