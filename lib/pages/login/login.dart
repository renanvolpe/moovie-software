import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/logo_widget.dart';
import '../../widgets/components/container_initial.dart';
import 'widgets/form_login_register_widget.dart';
import 'widgets/image_login/image_login_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    if (width < 800) {
      return Scaffold(
        body: ContainerInitial(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoWidget(),
                      Text("Films", style: context.styles.whiteS(55)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    // height: 200,
                    width: 400,
                    child: FormLoginRegisterWidget(),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
      );
    }

    //Tablet and Web
    return Scaffold(
      body: ContainerInitial(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(),
                          Text("Films", style: context.styles.whiteS(55)),
                        ],
                      ),
                    ),
                    Expanded(flex: 3, child: FormLoginRegisterWidget()),
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
