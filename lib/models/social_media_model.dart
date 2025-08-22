class SocialMediaModel {
  String iconPath;
  String text;
  String link;
  SocialMediaModel({
    required this.iconPath,
    required this.text,
    required this.link,
  });
}

var listSocialMedia = [
  SocialMediaModel(
    iconPath: 'social-media/Vector-0.png',
    text: "LinkedIn",
    link: 'https://www.linkedin.com/in/renanvolpe/',
  ),
  SocialMediaModel(
    iconPath: 'social-media/Vector-1.png',
    text: "WhatsApp",
    link: 'https://api.whatsapp.com/send?phone=5512997108329',
  ),
  SocialMediaModel(iconPath: 'social-media/Vector-2.png', text: "GitHub", link: 'https://github.com/renanvolpe'),
  SocialMediaModel(
    iconPath: 'social-media/Vector-3.png',
    text: "E-mail",
    link: 'https://renanvolpe067@gmail.com',
  ),
];
