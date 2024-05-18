import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/common/widgets/detailstile.dart';
import 'package:weather/services/location_provider.dart';
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
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
  }

  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);
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
                  if (locationProvider.currentLocationName!=null) {
                    locationCity=locationProvider.currentLocationName!.locality;
                  }
                  else{
                    locationCity="Unknown Location";
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
                                  locationCity.isEmpty?"Unknown Location":locationCity,
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
            // Container(
            //   height: 50,
            //   child:
            // ),
            Align(
              alignment: const Alignment(0, 0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: DetailsTile(size: size),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
