import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev2/model/air_quality_data.dart';
import 'air_quality_api.dart';

class AirQuality extends StatefulWidget {
  const AirQuality({super.key});

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  AirqualityData? airqualityData;
  bool isLoading = false;
  String selectedcity = "Bangkok";

  final List<String> cities = [
    "Bangkok",
    "New York",
    "Beijing",
    "Tokyo",
    'Manchester'
  ];


  void fetchData() async {
    setState(() => isLoading = true);
    try {
      airqualityData = await AirQualityApi.getAirQualityData(selectedcity);
    } catch (e) {
      print("Error: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String getAqiScale(int aqi) {
    if (aqi >= 0 && aqi <= 50) {
      return "Good";
    } else if (aqi >= 51 && aqi <= 100) {
      return "Moderate";
    } else if (aqi >= 101 && aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi >= 151 && aqi <= 200) {
      return "Unhealthy";
    } else if (aqi >= 201 && aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  Color getaqicolor(int aqi) {
    if (aqi >= 0 && aqi <= 50) {
      return Color(0xFF009966);
    } else if (aqi >= 51 && aqi <= 100) {
      return Color.fromARGB(234, 224, 193, 33);
    } else if (aqi >= 101 && aqi <= 150) {
      return Color(0xFFFF9933);
    } else if (aqi >= 151 && aqi <= 200) {
      return Color.fromARGB(221, 199, 10, 57);
    } else if (aqi >= 201 && aqi <= 300) {
      return Color.fromARGB(255, 98, 2, 161);
    } else {
      return Color.fromARGB(255, 114, 1, 33);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Air Quality Index (AQI)',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0XFF28283C),
        centerTitle: true,
      ),
      backgroundColor: Color(0XFF28283C),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              child: Text(
                "Select City",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFF3c3c50),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: DropdownButton(
                  dropdownColor: Color(0xFF3c3c50),
                  menuWidth: 150,
                  value: selectedcity,
                  onChanged: (String? newcity) {
                    if (newcity != null) {
                      setState(() => selectedcity = newcity);
                      fetchData();
                    }
                  },
                  items: cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(
                        city,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  underline: SizedBox(),
                  isExpanded: true,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : airqualityData == null
                        ? Text("Failed to load air quality data")
                        : Column(children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                airqualityData!.city,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        getaqicolor(airqualityData!.aqi ?? 0)),
                                child: Text(
                                  '${airqualityData!.aqi.toString()} ',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text(
                                getAqiScale(airqualityData!.aqi ?? 0),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        getaqicolor(airqualityData!.aqi ?? 0)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text(
                                'Temp : ${airqualityData!.temperature.toString()} °C',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ])),
            Container(
                child: ElevatedButton(
              onPressed: fetchData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3c3c50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Refresh", style: TextStyle(color: Colors.white)),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
