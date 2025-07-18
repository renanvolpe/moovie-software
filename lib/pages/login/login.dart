import 'package:flutter/material.dart';
import 'package:movie_software/controllers/login_controller.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_animation.dart';

import '../../styles/color/app_color.dart';
import '../../widgets/buttons/btn_underline_widget.dart';
import '../../widgets/components/image_login_widget.dart';
import '../../widgets/components/login_form.dart';
import '../../widgets/components/signup_form.dart';

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
          color: AppColors.blackLight,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.clamp,
            stops: [0.2, 0.8, 1],
            colors: [
              AppColors.black,
              AppColors.backgroundDark,
              AppColors.secondaryDarker,
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'assets/logo-light.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Text(
                          "Films",
                          style: context.styles.whiteS(55),
                        ),
                      ],
                    ),
                    Text(
                      "Welcome",
                      style: context.styles.whiteS(22),
                    ),
                    ValueListenableBuilder(
                      valueListenable: login.isLogin,
                      builder: (_, bool isLogin, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BtnUnderlineWidget(
                            text: 'LOGIN',
                            onTap: () => login.changeIsLogin(true),
                            isSelected: isLogin,
                          ),
                          BtnUnderlineWidget(
                            text: 'SIGNUP',
                            onTap: () => login.changeIsLogin(false),
                            isSelected: !isLogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Expanded(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: login.isLogin,
                        builder: (context, bool isLogin, child) {
                          return AnimatedSwitcher(
                            duration: AppUtils.fast,
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: isLogin ? const LoginForm() : const SignupForm(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageLoginWidget(),
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
