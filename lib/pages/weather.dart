import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:android_intent_plus/android_intent.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_icons/weather_icons.dart';

import '../Animation/FadeAnimation.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10;
  Stream<int> counterStream =
  Stream<int>.periodic(const Duration(milliseconds: 3500), (x) => refreshNum);

  ScrollController? _scrollController;

  var temp,
      desc,
      current,
      humid,
      wind,
      sunRise,
      sunSet,
      feel,
      iconCode,
      city,
      pressure,
      visible;
  var forecast, foreIcon;
  String send = "";

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Kolkata&unit=Metric&appid=b43d09c6e6b476d6faa5255c7a44dfa3"));
    var results = jsonDecode(response.body);
    setState(() {
      temp = results['main']['temp'];
      desc = results['weather'][0]['description'];
      current = results['weather'][0]['main'];
      humid = results['main']['humidity'];
      wind = results['wind']['speed'];
      temp = (temp - 273).toString().substring(0, 2);
      sunRise = results['sys']['sunrise'].toString().substring(0, 4);
      sunRise = StringUtils.addCharAtPosition(sunRise, ":", 2);
      int h = int.parse(sunRise.split(":").first);
      int m = int.parse(sunRise.split(":").last.split(" ").first);
      city = results['main']['name'];
      if (m >= 60) {
        m = m - 60;
      }
      if (h > 12) {
        var temp = h - 12;
        send = "0$temp:${m.toString().length == 1 ? "0$m" : m.toString()}";
      } else {
        send = "$h:${m.toString().length == 1 ? "0$m" : m.toString()}";
      }
      iconCode = results['weather'][0]['icon'];
      sunSet = results['sys']['sunset'].toString().substring(0, 4);
      sunSet = StringUtils.addCharAtPosition(sunSet, ":", 2);
      feel = results['main']['feels_like'];
      feel = (feel - 273).toString().substring(0, 2);
      pressure = results['main']['pressure'];
      visible = results['visibility'];

      // forecast = results['weather'][0]['description'];
      // foreIcon = results['weather'][0]['icon'];
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
    _scrollController = ScrollController();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(milliseconds: 3500), () {
      completer.complete();
    });
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => super.widget));
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  IconData getIconData() {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '01n':
        return WeatherIcons.night_clear;
      case '02d':
        return WeatherIcons.day_cloudy_gusts;
      case '02n':
        return WeatherIcons.cloudy_windy;
      case '03d':
      case '04d':
        return WeatherIcons.day_cloudy;
      case '03n':
      case '04n':
        return WeatherIcons.night_clear;
      case '09d':
        return WeatherIcons.day_showers;
      case '09n':
        return WeatherIcons.night_showers;
      case '10d':
        return WeatherIcons.day_rain;
      case '10n':
        return WeatherIcons.night_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '13n':
        return WeatherIcons.night_snow;
      case '50d':
        return WeatherIcons.day_haze;
      case '50n':
        return WeatherIcons.night_cloudy;
      default:
        return WeatherIcons.day_sunny;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade400,
        actions: [
          IconButton(
            splashColor: Colors.red.shade300,
              splashRadius: 25,
              onPressed: () async {
                if (await canLaunch(
                    'https://openweathermap.org/city/1275004')) {
                  await launch('https://openweathermap.org/city/1275004');
                } else {
                  throw "Could not open the App";
                }
              },
              icon: const Icon(
                Icons.more_horiz_sharp,
                color: Colors.white,
              ))
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 5,
      //   backgroundColor: Colors.red.shade400,
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //             builder: (BuildContext context) => super.widget));
      //   },
      //   child: const Icon(
      //     Icons.refresh,
      //     color: Colors.white,
      //     size: 30,
      //   ),
      // ),
      body: LiquidPullToRefresh(
        color: Colors.red.shade400,
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            Container(
              color: Colors.red.shade400,
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                    0.7,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Text(
                        city != null ? city.toString() : "Kolkata",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.6,
                    Text(
                      temp != null ? "$tempºC" : "Loading...",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FadeAnimation(
                    0.5,
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            current != null ? current.toString() : "Loading",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Icon(
                            getIconData(),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              child: ListView(
                children: [
                  FadeAnimation(
                    1.7,
                    ListTile(
                      leading: const Icon(
                        MdiIcons.temperatureCelsius,
                        size: 25,
                      ),
                      title: const Text("Temperature"),
                      trailing: Text(temp != null ? "$tempºC" : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.6,
                    ListTile(
                      leading: const Icon(
                        MdiIcons.ejectCircleOutline,
                        size: 27,
                      ),
                      title: const Text("Current"),
                      trailing: Text(desc != null ? desc.toString().toCapitalized() : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    ListTile(
                      leading: const Icon(
                        WeatherIcons.day_cloudy,
                        size: 22,
                      ),
                      title: const Text("Feels Like"),
                      trailing: Text(feel != null ? "$feelºC" : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    ListTile(
                      leading: const Icon(WeatherIcons.hot),
                      title: const Text("Humidity"),
                      trailing: Text(humid != null ? "$humid%" : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.3,
                    ListTile(
                      leading: const Icon(WeatherIcons.wind),
                      title: const Text("Wind Speed"),
                      trailing: Text(wind != null ? "$wind m/s" : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    ListTile(
                      leading: const Icon(WeatherIcons.sunrise),
                      title: const Text("Sun Rise"),
                      trailing: Text(sunRise != null ? "$send AM" : "-"),
                    ),
                  ),
                  // FadeAnimation(
                  //   1.5, ListTile(
                  //     leading: const Icon(WeatherIcons.sunset),
                  //     title: const Text("Sun Set"),
                  //     trailing: Text(sunSet!=null?sunSet.toString():"-"),
                  //   ),
                  // ),
                  FadeAnimation(
                    1.1,
                    ListTile(
                      leading: const Icon(MdiIcons.speedometer),
                      title: const Text("Air Pressure"),
                      trailing: Text(pressure != null ? "$pressure hPa" : "-"),
                    ),
                  ),
                  FadeAnimation(
                    1.0,
                    ListTile(
                      leading: const Icon(
                        MdiIcons.starOutline,
                        size: 25,
                      ),
                      title: const Text("Visibility"),
                      trailing: Text(visible != null ? "$visible mtr" : "-"),
                    ),
                  ),
                  // FadeAnimation(
                  //   1.7, ListTile(
                  //   leading: const Icon(MdiIcons.timelapse),
                  //   title: const Text("Forecast"),
                  //   trailing: Text(forecast!=null?"${forecast.toString().toCapitalized()} mt":"-"),
                  // ),
                  // ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
