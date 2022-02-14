import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';
import 'package:weather/weather.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }


class WeatherComp extends StatefulWidget {
  const WeatherComp({Key? key}) : super(key: key);

  @override
  _WeatherCompPageState createState() => _WeatherCompPageState();
}
List status = [false,false,false];
int _current = 1;
class _WeatherCompPageState extends State<WeatherComp> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  late WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;
  double? lat, lon;

  @override
  void initState() {
    ws = new WeatherFactory(key);
    queryWeather();
    super.initState();
  }

  void queryForecast() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat!, lon!);
    setState(() {
      _data = forecasts;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }


  void queryWeather() async {
    /// Removes keyboard
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByLocation(33.57627242675168, -7.584810711973223);
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
      print(_data);
    });

  }


  Widget contentDownloading() {
    return Container(
      child: Center(
        child: Container(
            height: 20,
            width: 20,
            child: Center(child: CircularProgressIndicator(strokeWidth: 3,color: Colors.white,))),
      )
    );
  }
  Widget contentFinishedDownload() {
    return Center(
      child: Text(_data[0].temperature.toString().replaceAll("Celsius", ""),style: GoogleFonts.lato(
        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 30),
      ),),
    );
  }
  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Weather forecast',
          ),
        ],
      ),
    );
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
      ? contentDownloading()
      : contentNotDownloaded();




  @override
  Widget build(BuildContext context) {

    return Container(
      decoration:  BoxDecoration(
          color:  Color(0xffDFE6EF),
          borderRadius: BorderRadius.all(Radius.circular(10),),
          border: Border.all(color:Color(0xffF9F9F9))

      ),
      height: 150,
      width: 330,
      child: Center(child: Container(
        height:130,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:120,
                  width: 100,
                  decoration: BoxDecoration(
                    image:   DecorationImage(
                      fit: BoxFit.contain,
                      image:const AssetImage("assets/weather.png"),
                    ),
                  ),

                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('CasaBlanca',style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800),
                ),),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _resultView(),

                    Text('°C',style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 15),
                    ),),
                  ],
                )


              ],
            ),
            Container(
              height: 100,
              width: 1,
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('wind',style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                ),),
                Text('15 km/h',style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800),
                ),),
                SizedBox(height: 10,),
                Text('wind',style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                ),),
                Text('15 km',style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800),
                ),),

              ],
            ),

          ],
        ),
      ),),
    );
  }
}

