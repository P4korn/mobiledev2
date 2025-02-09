class AirqualityData {
  final String city;
  final int aqi;
  final double temperature;

  AirqualityData(
      {required this.city, required this.aqi, required this.temperature});

  AirqualityData.fromJson(Map<String, dynamic> json)
      : city = json['data']['city']['name'],
        aqi = json['data']['aqi'],
        temperature = (json['data']['iaqi']['t']['v'] as num).toDouble();
}
