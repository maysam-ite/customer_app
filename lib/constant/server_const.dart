class ServerConstApis {
  static String baseAPI = 'http://192.168.43.170:3000/';

///// sign
  static String signUp = '${baseAPI}customers/signup';
  static String signIn = '${baseAPI}customers/login';
/////// events
  static String showUpComing = '${baseAPI}events/show-all';
  static String showEventInfo = '${baseAPI}events/show-event';

///////////////order

  static String makeOrder = '${baseAPI}orders/make-order';

//////////// drinks

  static String showDrinks = '${baseAPI}drinks';

///////////reservation
  static String makeReservation = '${baseAPI}reservations/make-reservation';
  static String setSection = '${baseAPI}reservations/setSection';

///// notification
  static String websocketUrl = '${baseAPI}notifications';
  static String chickEventIsIn='${baseAPI}r/check';

/////////forImages
  static String loadImages = baseAPI;
}
