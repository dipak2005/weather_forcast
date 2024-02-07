// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/controller/weather_pro.dart';
import 'package:weather_api/model/api_helper.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/view/forcast/days.dart';
import 'package:weather_api/view/forcast/today.dart';
import 'package:weather_api/view/forcast/tomorrow.dart';

class Home extends StatefulWidget {
   Weather? weather;
   Home({super.key, this.weather});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = "Rajkot";
  List<String> list = ["Today", "Tomorrow", "10 Days"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF6EDFF),
      body: FutureBuilder(
        future: ApiHelper().getLinkData(location),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.data?.location?.name.runtimeType}");
          } else if (snapshot.hasData) {
            Weather? data = snapshot.data;
            String? loc = data?.location!.localtime;

            DateFormat foMate = DateFormat("yyyy-MM-DD HH:MM");

            var datetime = foMate.parse(loc!);

            TimeOfDay.fromDateTime(datetime);

            return Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2.3,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/morning.png",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer<WeatherPro>(
                          builder: (context, value, child) {
                            return value.isShow == true
                                ? TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    onFieldSubmitted: (value) {},
                                    decoration: InputDecoration(
                                      hintText:
                                          "Search City or regin or country",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabled: true,
                                      contentPadding: EdgeInsets.all(10),
                                      focusColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          value.hide();
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data?.location?.name},${data?.location?.region}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          value.show();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.search,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                        Align(
                          alignment: Alignment(-0.9, 0),
                          child: Text(
                            Provider.of<WeatherPro>(context).isShow == true
                                ? "${data?.location?.name}, ${data?.location?.region}, ${data?.location?.country}"
                                : "${data?.location?.country}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height / 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${data?.current?.tempC?.toDouble()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 80),
                                ),
                                Text(
                                  "Cloud : ${data?.current?.cloud}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox.shrink(),
                                Text(
                                  "Feels like${data?.current?.feelslikeC}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 7,
                            ),
                            Column(
                              children: [
                                // Image.network("http${data?.current?.condition?.icon}"),
                                Text(
                                  "${data?.current?.condition?.text}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${data?.location?.localtime}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2.3,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Day ${data?.current?.tempC}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                Text(
                                  "Night ${data?.current?.cloud}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Consumer<WeatherPro>(
                  builder: (BuildContext context, value, Widget? child) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height / 12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          var tindex = list[index];
                          return InkWell(
                            onTap: () {
                              value.changeIndex(index);
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height / 4,
                              width: MediaQuery.sizeOf(context).width / 3.6,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: value.listIndex == index
                                      ? Color(0xffE0B6FF)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                  child: Text(
                                tindex,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                                    color: value.listIndex == index
                                        ? Colors.purple
                                        : Colors.black),
                              )),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                IndexedStack(
                  index:
                      Provider.of<WeatherPro>(context, listen: false).listIndex,
                  children: [
                    Today(weather: data!),
                    Tomorrow(),
                    Days(),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xff136DFF),
                backgroundColor: Colors.pink,
              ),
            );
          }
        },
      ),
    );
  }
}
