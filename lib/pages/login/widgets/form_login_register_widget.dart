import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/btn_underline_widget.dart';
import '../../../components/logo_widget.dart';
import '../../../utils/app_animation.dart';
import '../../../widgets/components/login_form.dart';
import '../../../widgets/components/signup_form.dart';
import '../login_controller.dart';

class FormLoginRegisterWidget extends HookWidget {
  const FormLoginRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = useMemoized(() => LoginController());

    useEffect(() => controller.dispose, [controller]);

    var isLogin = useListenableSelector(controller, () => controller.isLogin);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            Text("Films", style: context.styles.whiteS(55)),
          ],
        ),
        Text("Welcome", style: context.styles.whiteS(22)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BtnUnderlineWidget(
              text: 'LOGIN',
              onTap: () => controller.toggleMode(true),
              isSelected: isLogin,
            ),
            BtnUnderlineWidget(
              text: 'SIGNUP',
              onTap: () => controller.toggleMode(false),
              isSelected: !isLogin,
            ),
          ],
        ),
        AnimatedSwitcher(
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
        ),
      ],
    );
  }
}
