plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.quangduy.easy_english"
//    compileSdk = flutter.compileSdkVersion
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }


    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.quangduy.easy_english"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "app"

    productFlavors {
        create("development") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }

        create("production") {
            dimension = "app"
            // Đối với production, không cần thêm hậu tố
        }
    }

//    flavorDimensions "app"
//
//    productFlavors {
//        development {
//            dimension "app"
//            applicationIdSuffix ".dev"
//            versionNameSuffix "-dev"
//        }
//        production {
//            dimension "app"
//            // Đối với production, chúng ta không cần thêm hậu tố
//            // applicationId và versionName sẽ lấy từ defaultConfig
//        }
//    }
}

flutter {
    source = "../.."
}
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.window:window:1.3.0")
    implementation("androidx.window:window-java:1.3.0")
}
