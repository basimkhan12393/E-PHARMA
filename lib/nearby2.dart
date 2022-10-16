import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap() async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=Laboratories';

    if (await launchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}