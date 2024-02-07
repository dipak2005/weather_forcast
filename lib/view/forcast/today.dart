// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/model/weather_model.dart';

class Today extends StatefulWidget {
  final Weather weather;

  const Today({super.key, required this.weather});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 2.1,
              decoration: BoxDecoration(
                color: Color(0xffEBDEFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.air,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Wind Speed",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    "${widget.weather.current?.windKph}km/h",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.02,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 2.1,
              decoration: BoxDecoration(
                color: Color(0xffEBDEFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.cloud_rain,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Rain Speed",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  // subtitle: Text(
                  //   "${widget.weather.forecast?.forecastday?[1].hour?[0].willItRain}km/h",
                  //   style: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w500),
                  // ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 65,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 2.2,
              decoration: BoxDecoration(
                color: Color(0xffEBDEFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.stacked_line_chart_rounded,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Pressure",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    "${widget.weather.current?.pressureMb} hpa",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.02,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 2.2,
              decoration: BoxDecoration(
                color: Color(0xffEBDEFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.light_mode_outlined,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "UV index",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    "${widget.weather.current?.uv}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          height: MediaQuery.sizeOf(context).height/5,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Color(0xffEBDEFF),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.watch_later_outlined),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                  Text(
                    "Hourly Forecast",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height*0.2,
                  //   child: ListView.builder(
                  //     itemCount: widget.weather.forecast?.forecastday?.length,
                  //     itemBuilder: (context, index) {
                  //       var forcast =
                  //           widget.weather.forecast?.forecastday?[index];
                  //       return Container(
                  //         height: MediaQuery.sizeOf(context).height/2,
                  //         width: MediaQuery.sizeOf(context).width/10,
                  //         color: Colors.cyan,
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
