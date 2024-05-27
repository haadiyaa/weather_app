import 'package:flutter/material.dart';
import 'package:weather/services/weather_service_provider.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/utils/styles/textstyle.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController cityController,
    required this.weatherProvider,
  }) : _cityController = cityController;

  final TextEditingController _cityController;
  final WeatherServiceProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Positioned(
      top: 45,
      right: 20,
      left: 20,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: white,
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Search by city',
                  hintStyle: hintStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  print(_cityController.text);
                  weatherProvider
                      .fetchWeatherDataByCity(_cityController.text.trim())
                      .then((value) {
                    if (weatherProvider.error.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          icon: Icon(error,size: 50,color: white,),
                          title: const Text('Error Getting Data!'),
                          backgroundColor: red,
                        ),
                      );
                    }
                  });
                  _cityController.clear();
                },
                icon: Icon(search))
          ],
        ),
      ),
    );
  }
}
