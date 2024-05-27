import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/common/widgets/frostedglass.dart';
import 'package:weather/common/widgets/locationtile.dart';
import 'package:weather/common/widgets/searchfield.dart';
import 'package:weather/common/widgets/sunrisendset.dart';
import 'package:weather/common/widgets/tempdetails.dart';
import 'package:weather/services/location_provider.dart';
import 'package:weather/common/functions/timeconvert.dart';
import 'package:weather/services/network_provider.dart';
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
    Provider.of<NetworkCheckProvider>(context, listen: false)
        .getConnectivity(context);

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

  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider = Provider.of<WeatherServiceProvider>(context);

    int sunriseTimestamp = weatherProvider.weather?.sys?.sunrise ?? 0;
    int sunsetTimestamp = weatherProvider.weather?.sys?.sunset ?? 0;

    int timezoneOffest = weatherProvider.weather?.timezone ?? 0;
    String formattedSunrise = timeConvert(sunriseTimestamp, timezoneOffest);
    String formattedSunset = timeConvert(sunsetTimestamp, timezoneOffest);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: white,
      appBar: AppBar(),
      body: weatherProvider.isLoading == true ||
              locationProvider.isLoading == true
          ? Center(
              child: LottieBuilder.asset(loading),
            )
          : SingleChildScrollView(
              child: Container(
                padding: homePadding,
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(backgrounds[
                            weatherProvider.weather?.weather![0].main ??
                                "N/A"] ??
                        "assets/bg/sunny.jpg"),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(0, 0.5),
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
                                        weatherProvider
                                                .weather?.weather![0].main ??
                                            "N/A"] ??
                                    "assets/weathericon/sun.png"),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${weatherProvider.weather?.main?.temp?.toStringAsFixed(0) ?? "N/A"}\u00B0 C',
                                    style: tempStyle,
                                  ),
                                  Text(
                                      weatherProvider.weather?.weather?[0].main
                                              .toString() ??
                                          "N/A",
                                      style: typeStyle),
                                  Text(
                                    DateFormat('dd MMM yy  |  HH:mm a')
                                        .format(DateTime.now()),
                                    style: datetimeStyle,
                                  ),
                                  Text(
                                      weatherProvider.weather?.name
                                              .toString() ??
                                          "N/A",
                                      style: typeStyle),
                                ],
                              ),
                              TempDetails(weatherProvider: weatherProvider),
                              SunrisendSet(
                                  formattedSunrise: formattedSunrise,
                                  formattedSunset: formattedSunset),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SearchField(
                        cityController: _cityController,
                        weatherProvider: weatherProvider),
                    SizedBox(
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

                          return LocationTile(locationCity: locationCity);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
