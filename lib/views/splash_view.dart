import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/blocs/app_bloc/app_bloc.dart';
import '/views/home_view.dart';
import '/views/login_view.dart';
import '/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var rng = new Random();
List<String>adves=["Don't put off until tomorrow what you can do today.",'Time is like a sword; if you do not cut with it, it will cut you.'];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        context.read<AppBloc>().add(AppStarted());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ShowOnboarding) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingView()),
            );
          } else if (state is UnAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          } else if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          } else if (state is AppFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("App failed to start...")));
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: LinearGradient(begin: .topCenter,end: .bottomCenter,colors: [Color(0xff45496a),Color(0xff45496a),Color(0xff45496a),Color(0xfff596a1)])),
          child: Column(children:[ SizedBox(height: 60,),Image.asset('assets/logo_w.png',height: 120, width: 120,fit: .cover,),SizedBox(height: 80,),Text(adves[rng.nextInt(adves.length)])])),
      ),
    );
  }
}