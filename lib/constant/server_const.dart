class ServerConstApis {
  static String baseAPI = 'http://192.168.1.102:3000/';

///// sign 
static String signUp='${baseAPI}customers/signup';
static String signIn='${baseAPI}customers/login';
/////// events
static String showUpComing='${baseAPI}events/show-upcoming-events';

/////////forImages
  static String loadImages = 'http://127.0.0.1:3000/';
}
