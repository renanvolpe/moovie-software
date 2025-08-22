import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl, canLaunchUrl, LaunchMode;

import '../../../models/social_media_model.dart';
import '../../../utils/app_animation.dart';
import '../../../utils/hoverable_mixin.dart';
import '../../../widgets/buttons/hover_btn_widget.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.primary,
      height: MediaQuery.sizeOf(context).height * 0.6,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Author",
              style: context.styles.onPrimaryS(30),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(100), // make it circular
              child: Image.asset(
                'assets/fotoPerfil.jpg',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              "Renan Volpe",
              style: context.styles.onPrimary,
            ),

            const SizedBox(height: 8),

            Text("Web & Mobile Developer", style: context.styles.onPrimary),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < listSocialMedia.length; i++)
                  SocialWidget(socialMediaModel: listSocialMedia[i], size: 50),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    required this.socialMediaModel,
    this.size = 100,
  });

  final double size;
  final SocialMediaModel socialMediaModel;

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      onTap: () => _launchCustomUrl(widget.socialMediaModel.link),
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 10),
        duration: AppUtils.fast,
        width: widget.size,
        height: widget.size,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isHovered ? context.colors.onPrimaryColor : context.colors.background,
          borderRadius: AppUtils.borderRadiusL,
        ),
        child: Image.asset(widget.socialMediaModel.iconPath),
      ),
    );
  }

  Future<void> _launchCustomUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }
}
