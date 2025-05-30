plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.shark_detection"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.shark_detection"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false      // تعطيل تصغير الكود
            isShrinkResources = false     // تعطيل تصغير الموارد (shrink)
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ضروري لتفعيل دعم desugaring للجافا 8
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    // يمكنك إضافة باقي الـ dependencies هنا مثل kotlin-stdlib، firebase libraries، ...
}

// تفعيل Google Services Plugin الخاص ب Firebase في نهاية الملف:
apply(plugin = "com.google.gms.google-services")
