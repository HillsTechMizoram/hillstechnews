import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher_string.dart';

const String appleType = "apple";
const String androidType = "android";
const String desktopType = "desktop";

String getSmartPhoneOrTablet() {
  String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  // smartphone
  if (userAgent.contains("iphone")) return appleType;
  if (userAgent.contains("android")) return androidType;

  // tablet
  if (userAgent.contains("ipad")) return appleType;
  if (html.window.navigator.platform!.toLowerCase().contains("macintel") &&
      html.window.navigator.maxTouchPoints! > 0) return appleType;

  return desktopType;
}

launchAndroidApp() async {
  const url = 'https://adumavarnews.page.link';

  launchUrlString(url);
}

launchURLPlayStore() async {
  const url = 'https://play.google.com/store/search?q=adumavar&c=apps';

  launchUrlString(url);
}

checkPlatformAndLunchUrl() {
  switch (getSmartPhoneOrTablet()) {
    case 'apple':
      break;
    case 'android':
      launchAndroidApp();
      break;
    case 'desktop':
      launchURLPlayStore();
      break;

    default:
  }
}
