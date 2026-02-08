package com.mycompany.yandex_mapkit_lite_initializer

import android.content.ContentProvider
import android.content.ContentValues
import android.content.pm.PackageManager
import android.database.Cursor
import android.net.Uri
import com.yandex.mapkit.MapKitFactory

/**
 * Инициализирует Yandex MapKit Lite, читая ключ из meta-data главного приложения:
 * <meta-data android:name="com.yandex.maps.apikey" android:value="YOUR_KEY"/>
 */
class YandexMapKitLiteInitProvider : ContentProvider() {

  override fun onCreate(): Boolean {
    val ctx = context ?: return false
    return try {
      val ai = ctx.packageManager.getApplicationInfo(
        ctx.packageName, PackageManager.GET_META_DATA
      )
      val key = ai.metaData?.getString("com.yandex.maps.apikey") ?: ""
      if (key.isNotBlank()) {
        MapKitFactory.setLocale("ru_RU") // опционально
        MapKitFactory.setApiKey(key)
      }
      true
    } catch (_: Throwable) {
      false
    }
  }

  override fun query(uri: Uri, projection: Array<out String>?, selection: String?,
                     selectionArgs: Array<out String>?, sortOrder: String?): Cursor? = null
  override fun getType(uri: Uri): String? = null
  override fun insert(uri: Uri, values: ContentValues?): Uri? = null
  override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?): Int = 0
  override fun update(uri: Uri, values: ContentValues?, selection: String?,
                      selectionArgs: Array<out String>?): Int = 0
}
