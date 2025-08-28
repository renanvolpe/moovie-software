import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

class TextAboutMoovieWidget extends StatelessWidget {
  const TextAboutMoovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          AutoSizeText("About John Wick 4", style: context.styles.onPrimaryS(40)),
          AutoSizeText(
            "With the price on his head ever increasing, legendary hit man John Wick takes his fight against the High Table global as he seeks out the most powerful players in the underworld, from New York to Paris to Japan to Berlin.",
            style: context.styles.onPrimary,
          ),
          AutoSizeText(
            "Development of the fourth John Wick film, formally announced by Lionsgate in May 2019, was confirmed before the release of its predecessor. It is the first film in the franchise that was not written by franchise creator Derek Kolstad, with Hatten hired in May 2020, followed by Finch in March 2021. Principal photography took place from June to October 2021, and filming locations included France, Germany, New York City, and Japan.",
            style: context.styles.onPrimary,
          ),
        ],
      ),
    );
  }
}
