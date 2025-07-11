import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_software/controllers/login_controller.dart';
import 'package:movie_software/styles/context_style.dart';

import '../styles/color/app_color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final login = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGreenBackground,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.clamp,
            stops: [
              0.8,
              1.0,
            ],
            colors: [Color(0xFF030A1B), Color(0xFF2A025E)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "Welcome",
                            style: context.styles.whiteS(55),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BtnsLogin(
                                text: 'LOGIN',
                                onTap: () => login.changeIsLogin(true),
                              ),
                              BtnsLogin(
                                text: 'SIGNUP',
                                onTap: () => login.changeIsLogin(false),
                              ),
                            ],
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: login.isLogin,
                            builder: (_, bool isLogin, _) {
                              return isLogin ? LoginForm() : SignupForm();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox.expand(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/login-1.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class BtnsLogin extends StatelessWidget {
  const BtnsLogin({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = true,
  });
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: SelectionContainer.disabled(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: context.styles.whiteS(16),
                  ),
                  const SizedBox(height: 4),
                  if (isSelected)
                    Stack(
                      children: [
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: context.colors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: context.colors.primary.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        SizedBox(height: 10),
        TextField(),
        Text("Forgot Password"),
        SizedBox(),
        FilledButton(onPressed: () {}, child: Text("CONFIRM")),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        SizedBox(height: 10),
        TextField(),
        Text("Forgot Password"),
        SizedBox(),
        FilledButton(onPressed: () {}, child: Text("LOGIN")),
      ],
    );
  }
}
