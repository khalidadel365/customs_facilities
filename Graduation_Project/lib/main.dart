import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/create_account/cubit/cubit.dart';
import 'package:graduation_project/modules/login_screen/login_screen.dart';
import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:lottie/lottie.dart';

import 'layout/cubit/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit()..getUserData()),
        BlocProvider(create: (BuildContext context)=>UserRegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Padding(
            padding:  EdgeInsets.fromLTRB(0,0,40,0),
            child: Lottie.asset('assets/images/Splash.json'),
          ),
          duration: 3000,
          splashIconSize: 2000,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: login_screen(),
        ),
      ),
    );
  }
}

