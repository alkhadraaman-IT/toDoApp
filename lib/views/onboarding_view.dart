import '/core/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/blocs/app_bloc/app_bloc.dart';
import 'login_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 120,
                width: 120,
                fit: .cover,
              ),
              Text("TO DO LIST", style: Theme.of(context).textTheme.titleLarge),
              Text(
                "Organize your thoughts, organize your life.",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: .center,
              ),
              SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  context.read<AppBloc>().add(CompleteOnboarding());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
