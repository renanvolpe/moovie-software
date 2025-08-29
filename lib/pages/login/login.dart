import 'package:flutter/material.dart';

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
                child: FormLoginRegisterWidget(),
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
