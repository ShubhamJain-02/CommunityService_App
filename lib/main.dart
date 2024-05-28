import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cs_app/firebase/login_signup.dart';
import 'package:cs_app/screens/welcome.dart';
import 'package:cs_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyC99ulK94XfIoZYO0NQGLpb9u-uQ3qjS4E',
    appId: '1:914387920148:android:db5ef388ccbe5079fa0e01',
    messagingSenderId: 'sendid',
    projectId: 'communityserviceapp-1cd9c',
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightMode,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('assets/images/sound.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/Logo.gif',
      backgroundColor: Color.fromARGB(255, 255, 253, 246),
      nextScreen: WelcomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: MediaQuery.of(context).size.width * 0.75,
    );
  }
}
