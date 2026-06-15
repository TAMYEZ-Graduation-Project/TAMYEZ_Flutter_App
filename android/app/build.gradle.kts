import com.google.firebase.crashlytics.buildtools.gradle.CrashlyticsExtension
import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties from android/key.properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    println("⚠ Warning: key.properties file not found. Release signing may fail.")
}

android {
    namespace = "com.hti.tamyez_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.hti.tamyez_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val storeFilePath = keystoreProperties["storeFile"] as? String
            val storePassword = keystoreProperties["storePassword"] as? String
            val keyAlias = keystoreProperties["keyAlias"] as? String
            val keyPassword = keystoreProperties["keyPassword"] as? String

            if (
                storeFilePath.isNullOrBlank() ||
                storePassword.isNullOrBlank() ||
                keyAlias.isNullOrBlank() ||
                keyPassword.isNullOrBlank()
            ) {
                println("⚠ Warning: One or more keystore properties are missing or invalid.")
            } else {
                storeFile = file(storeFilePath)
                this.storePassword = storePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
            }
        }
    }

    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("release")

        }
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            // Uncomment if you want to enable ProGuard
            // isMinifyEnabled = false
            // isShrinkResources = false
            // proguardFiles(
            //     getDefaultProguardFile("proguard-android-optimize.txt"),
            //     "proguard-rules.pro"
            // )
            configure<CrashlyticsExtension> {
                // Enable processing and uploading of native symbols to Firebase servers.
                // By default, this is disabled to improve build speeds.
                // This flag must be enabled to see properly-symbolicated native
                // stack traces in the Crashlytics dashboard.
                nativeSymbolUploadEnabled = true
            }
        }
    }
}

dependencies {
    // Import the BoM for the Firebase platform
    implementation(platform("com.google.firebase:firebase-bom:34.14.1"))

    // Add the dependencies for the Crashlytics and Analytics libraries
    // When using the BoM, you don't specify versions in Firebase library dependencies
    implementation("com.google.firebase:firebase-crashlytics")
    implementation("com.google.firebase:firebase-analytics")
}
flutter {
    source = "../.."
}
