import Flutter
import UIKit
import YandexMapsMobile

public class YandexMapKitLiteInitializerPlugin: NSObject, FlutterPlugin {
    
    private static var isInitialized = false
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        // Initialize Yandex MapKit when plugin is registered
        initializeMapKit()
        
        // Create channel (even if we don't use it, Flutter expects this)
        let channel = FlutterMethodChannel(
            name: "yandex_mapkit_lite_initializer",
            binaryMessenger: registrar.messenger()
        )
        let instance = YandexMapKitLiteInitializerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private static func initializeMapKit() {
        // Prevent double initialization
        guard !isInitialized else { return }
        
        // Read API key from Info.plist
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "YandexMapApiKey") as? String,
           !apiKey.isEmpty {
            YMKMapKit.setApiKey(apiKey)
            YMKMapKit.setLocale("ru_RU") // Optional: set locale like Android side
            isInitialized = true
            print("YandexMapKit initialized successfully with API key from Info.plist")
        } else {
            print("Warning: YandexMapApiKey not found in Info.plist")
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        // No methods to handle - initialization happens automatically
        result(FlutterMethodNotImplemented)
    }
}
