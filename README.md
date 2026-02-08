# План подключения Yandex MapKit Lite в FlutterFlow

1. **Добавить зависимости в FF**  
   Project Settings → Project Dependencies → Custom Pub Dependencies:

   ```yaml
   yandex_mapkit_lite: ^2.0.2

   yandex_mapkit_lite_initializer:
     git:
       url: https://github.com/JKgeneral1/yandex_mapkit_lite_initializer.git
       ref: main
   ```

2. **Настроить Android**  
   В `AndroidManifest.xml` добавьте разрешения и meta-data с ключом:

   ```xml
   <manifest xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools">

     <!-- Интернет и сеть -->
     <uses-permission android:name="android.permission.INTERNET"/>
     <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

     <!-- Геолокация (если нужно показывать позицию пользователя) -->
     <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
     <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

     <application
         android:label="@string/app_name"
         android:icon="@mipmap/ic_launcher"
         tools:replace="android:label">

       <!-- Ключ Яндекс.Карт -->
       <meta-data
           android:name="com.yandex.maps.apikey"
           android:value="{API-ключ YandexMap SDK}"/>

       <meta-data android:name="flutterEmbedding" android:value="2"/>
     </application>
   </manifest>
   ```

3. **Настроить iOS**  
   В `AppDelegate.swift` укажите ключ (внутри `application(_:didFinishLaunchingWithOptions:)`):

   ```swift
   import YandexMapsMobile

   @UIApplicationMain
   class AppDelegate: FlutterAppDelegate {
     override func application(
       _ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
     ) -> Bool {
       YMKMapKit.setApiKey("{API-ключ YandexMap SDK}")
       GeneratedPluginRegistrant.register(with: self)
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
   }
   ```

   В `Info.plist` добавьте описание доступа к геолокации:

   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>Нужно, чтобы показывать ваше местоположение на карте</string>
   ```

4. **Добавить кастомный виджет Яндекс карт**  
   Передать параметры (список координат, иконки, центрирование на пользователе).

5. **Проверить**  
   Собрать проект на Android и iOS, убедиться, что карта и ключ работают корректно.
