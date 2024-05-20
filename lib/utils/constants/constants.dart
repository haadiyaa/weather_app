import 'package:flutter/material.dart';
//========================BG-IMAGES===============
List<String> background=[
  "assets/bg/cloudy.jpg",
  "assets/bg/rainy.jpg",
  "assets/bg/sunny.jpg",
  "assets/bg/thunder.jpg",
];

  Map<String,dynamic> backgrounds={
  "Clouds":"assets/bg/cloudy.jpg",
  "Rain":"assets/bg/rainy.jpg",
  "Drizzle":"assets/bg/rainy.jpg",
  "Clear":"assets/bg/sunny.jpg",
  "Thunder":"assets/bg/thunder.jpg",
};

Map<String,dynamic> weatherConditions={
  'Clear':"assets/weathericon/sun.png",
  'Clouds':"assets/weathericon/cloud.png",
  'Few Clouds':"assets/weathericon/cloud.png",
  'Drizzle':"assets/weathericon/sun-rain.png",
  'Rain':"assets/weathericon/heavyrain.png",
  'Cloud-lightening':"assets/weathericon/thunder-rain.png",
  'Snow':"assets/weathericon/snow.png",
  'Mist':"assets/weathericon/wind.png",
};

List<String> icons=[
  "assets/weathericon/sun.png",
  "assets/weathericon/thunder-rain.png",
  "assets/weathericon/cloud.png",
  "assets/weathericon/sun-rain.png",
  "assets/weathericon/cloud.png",
  "assets/weathericon/wind.png",
  "assets/weathericon/snow.png",
];

String hightemp='assets/smallicon/high-temp-removebg-preview.png';

String lowtemp='assets/smallicon/low-temp-removebg-preview.png';

String sunrise=icons[0];
String sunset="assets/smallicon/moon.png";
 
//=========================COLORS===========================
Color black=Colors.black;
Color white=Colors.white;
Color red=Colors.red;

//==========================ICONS==========================
IconData location=Icons.location_pin;
IconData search=Icons.search;

//=====================PADDING==============================
const EdgeInsetsGeometry homePadding= EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20);

//================================SIZEDBOX-height====================
const SizedBox height20=SizedBox(height: 20,);
const SizedBox height15=SizedBox(height: 15,);
const SizedBox height10=SizedBox(height: 10,);
const SizedBox height8=SizedBox(height: 8,);
const SizedBox height5=SizedBox(height: 5,);
const SizedBox height3=SizedBox(height: 3,);

//=============================SIZEDBOX-width===============
const SizedBox width20=SizedBox(width: 20,);
const SizedBox width15=SizedBox(width: 15,);
const SizedBox width10=SizedBox(width: 10,);
const SizedBox width8=SizedBox(width: 8,);
const SizedBox width5=SizedBox(width: 5,);
const SizedBox width3=SizedBox(width: 3,);