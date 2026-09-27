import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_1/views/login_view.dart';

import '/repos/auth_repo.dart';
import '/views/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/blocs/app_bloc/app_bloc.dart';
import '../models/login_model.dart';

import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
      .authenticate();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      googleUser!.authentication; //!انا ضفت التعجب!

  // Create a new credential
  final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool ispassword = false;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.heightOf(context);
    double screenWidth = MediaQuery.widthOf(context);
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          } else if (state is UnAuthenticated) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("check your information")));
          }
        },
        builder: (BuildContext context, AppState state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        Image.asset(
                          'assets/logo.png',
                          height: 120,
                          width: 120,
                          fit: .cover,
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Welcome to the TO DO LIST app',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 32),
                        TextFormField(
                          validator: (String? value) {
                            final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3}",
                            ).hasMatch(value!);
                            if (value.isEmpty) {
                              return "Please fill this filed";
                            } else if (!emailValid) {
                              return "please enter correct email form: example@email.com";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff45496a)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff45496a)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.email, color: Color(0xff45496a)),
                                SizedBox(width: 8),
                                Text(
                                  'Your Email',
                                  style: TextStyle(
                                    color: Color(0xff45496a),
                                    fontSize: 16,
                                    fontWeight: FontWeight(700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please fill this filed";
                            } else if (value.length < 8) {
                              return "passord must be more or equal 8 charcters";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          controller: password,
                          obscureText: ispassword,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff45496a)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff45496a)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.lock, color: Color(0xff45496a)),
                                SizedBox(width: 8),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Color(0xff45496a),
                                    fontSize: 16,
                                    fontWeight: FontWeight(700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 23),
                        state is! AppLoading
                            ? SizedBox(
                                child: FilledButton(
                                  onPressed: () async {
                                    context.read<AppBloc>().add(
                                      Register(
                                        loginModel: LoginModel(
                                          email: "email",
                                          password: "password",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Sign up"),
                                ),
                              )
                            : CircularProgressIndicator(),
                        SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            SizedBox(
                              width: screenWidth / 2 - 60,
                              child: Divider(thickness: 1),
                            ),
                            SizedBox(width: 24),
                            Text(
                              'or',
                              style: TextStyle(
                                color: Color(0xff45496a),
                                fontSize: 16,
                                fontWeight: FontWeight(700),
                              ),
                            ),
                            SizedBox(width: 24),
                            SizedBox(
                              width: screenWidth / 2 - 60,
                              child: Divider(thickness: 1),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffffffff),
                            foregroundColor: Color(0xff1C2A3A),
                            fixedSize: Size(400, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(50),
                              side: BorderSide(
                                color: Color(0xffE5E7EB),
                                width: 2,
                              ),
                            ),
                            minimumSize: Size(double.infinity, 41),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email, size: 30),
                              SizedBox(width: 8),
                              Text(
                                'Sign In with Google',
                                style: TextStyle(
                                  color: Color(0xff45496a),
                                  fontSize: 16,
                                  fontWeight: FontWeight(700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 23),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,

                            children: [
                              TextSpan(text: 'I have an account. '),
                              TextSpan(
                                text: 'Login',
                                style: Theme.of(context).textTheme.bodyLarge,
                                 onEnter: (event) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoginView();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
