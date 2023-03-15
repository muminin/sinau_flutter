import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

/// Dependencies
/// local_auth: ^2.1.6
///
/// Add <uses-permission android:name="android.permission.USE_FINGERPRINT" /> to:
/// 1. android/app/src/debug/AndroidManifest.xml
/// 2. android/app/main/AndroidManifest.xml
/// 3. android/app/profile/AndroidManifest.xml
///
/// Add
/// import androidx.annotation.NonNull;
/// import io.flutter.embedding.android.FlutterFragmentActivity
/// import io.flutter.plugins.GeneratedPluginRegistrant
/// import io.flutter.embedding.engine.FlutterEngine
/// class MainActivity: FlutterFragmentActivity() {
///  override fun configureFlutterEngine(@NonNull flutterEngine:
///     FlutterEngine) {
///     GeneratedPluginRegistrant.registerWith(flutterEngine)
///   }
/// }
/// to:
/// android/app/main/kotlin.../MainActivity.kt

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isAvailable = false;
  bool isAuthenticated = false;
  String text = "Please Check Biometrics Availability";
  LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("84. Biometric Authentication"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.only(
                bottom: 5,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  isAvailable = await localAuthentication.canCheckBiometrics;
                  if (isAvailable) {
                    List<BiometricType> types =
                        await localAuthentication.getAvailableBiometrics();
                    text = "Biometric Availables:";
                    for (var element in types) {
                      text += "\n $element";
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  "Check Biometric",
                  style: GoogleFonts.podkova(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: (isAvailable)
                    ? () async {
                        isAuthenticated =
                            await localAuthentication.authenticate(
                          localizedReason: "Please Authenticate",
                          options: const AuthenticationOptions(
                            stickyAuth: false,
                            useErrorDialogs: true,
                          ),
                        );

                        setState(() {});
                      }
                    : null,
                child: Text(
                  "Authenticate",
                  style: GoogleFonts.podkova(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isAuthenticated ? Colors.green : Colors.red,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white70,
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.grey[800],
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.podkova(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
