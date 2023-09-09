String statusImage(String? status) {
  String image = 'assets/status2/Group 2.png';
  if (status == 'clear') {
    image = 'assets/status2/Group 2.png';
  } else if (status == 'Clouds') {
    image = 'assets/status2/Group 19.png';
  } else if (status == 'Haze' || status == 'Mist') {
    image = 'assets/status2/Group 46.png';
  } else if (status == 'Snow') {
    image = 'assets/status2/Group 73.png';
  } else if (status == 'Sand' || status == 'Dust') {
    image = 'assets/status2/Group 88.png';
  } else if (status == 'Rain') {
    image = 'assets/status2/Group 41.png';
  }
  return image;
}
