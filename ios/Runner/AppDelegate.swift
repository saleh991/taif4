import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
 // GMSServices.provideAPIKey("AIzaSyBlW_lm6Rega6dVDxofmy7wEkzmv45cX4s")
    GMSServices.provideAPIKey("AIzaSyBlW_lm6Rega6dVDxofmy7wEkzmv45cX4s")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
