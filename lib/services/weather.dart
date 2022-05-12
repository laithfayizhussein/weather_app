import 'package:location_app/services/location.dart';
import 'package:location_app/services/networking.dart';

const apiKey = '1b7b1d220179f19b5aa978120febd488';

// take what the user write to find depend on the city
class WeatherModel {
  Future<dynamic> getLocationWeatherName(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkData networkdata = NetworkData(url);
    var weatherData = await networkdata.getDate();
    return weatherData;
  }

//3333333  complete the func in networking page , pass the url and return weatherData after decoded it
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkData networkdata = NetworkData(
        // take the long and latitude from location class
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkdata.getDate();
    return weatherData;
  }

// find the update ui
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
