import 'dart:async';

Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 3));

  bool isSuccess = true;

  if (isSuccess) {
    return 'Weather Data: rainy, 10°C';
  } else {
    throw Exception('Failed to fetch weather data.');
  }
}

void main() async {
  print('Fetching weather data...');

  try {
    String weatherInfo = await fetchWeatherData();
    print('Weather Information: $weatherInfo');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Weather fetch operation completed.');
  }
}
