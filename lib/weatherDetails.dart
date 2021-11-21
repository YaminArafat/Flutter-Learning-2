class WeatherDetails {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '⛈';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition >= 500 && condition <= 504) {
      return '🌦';
    } else if (condition < 600) {
      return '🌧️';
    } else if (condition < 700) {
      return '❄';
    } else if (condition == 800) {
      return '☀';
    } else if (condition < 800) {
      return '🌪';
    } else if (condition < 900) {
      return '🌤';
    }
    return '';
  }

  String getMessage(int temp) {
    if (temp >= 30) {
      return 'Very hot day. You should get a 🍦';
    } else if (temp >= 25) {
      return 'It\'s a warm day. Cold 🚿 is a good idea';
    } else if (temp >= 20) {
      return 'Quiet cold. A cup of 🫖 will keep you warm';
    } else if (temp >= 15) {
      return 'It\'s very cold 🌞. Why not drink ☕';
    } else if (temp >= 10) {
      return 'It\'s freezing cold 🥶. Don\'t forget to bring 🧥';
    }
    return '';
  }
}
// 🌩️ 🌩 🌧️ 🌨️ 🌨 🌦 🌤️ 🌤 ⛈ 🌤️ 🌤 ☁️☁ 🌫️ 🌫 🌁   👕 🩳 🛀 🛁 🚿 🏊‍♂️☃️💧 🥶 🧥 ☕ 🌞 🫖
