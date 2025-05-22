buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")
        classpath("com.google.gms:google-services:4.3.15") // Firebase plugin
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}

apply(plugin = "com.google.gms.google-services")

android {
    compileSdk = 34
    namespace = "com.example.ai_enhanced_notes_app"

    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.example.ai_enhanced_notes_app"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    ...
}
