import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

class TextComponentsWidget extends StatelessWidget {
  const TextComponentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Textss Section examples",
          style: context.styles.blackS(40),
        ),
        const Text(
          '--- Getters (Default Size) ---',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),

        Text('primary', style: context.styles.primary),
        Text('onPrimary', style: context.styles.onPrimary),
        Text('onPrimaryContainer', style: context.styles.onPrimaryContainer),

        Text('secondary', style: context.styles.secondary),
        Text('onSecondary', style: context.styles.onSecondary),

        Text('onBackground', style: context.styles.onBackground),

        Text('onSurface', style: context.styles.onSurface),
        Text('onSurfaceVariant', style: context.styles.onSurfaceVariant),

        Text('error', style: context.styles.error),
        Text('onError', style: context.styles.onError),

        Text('success', style: context.styles.success),
        Text('warning', style: context.styles.warning),
        Text('black', style: context.styles.black),
        Text('white', style: context.styles.white),
        Text('gray', style: context.styles.gray),

        const SizedBox(height: 20),
        const Text(
          '--- Functions (Custom Size) ---',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),

        Text('primaryS(20)', style: context.styles.primaryS(20)),
        Text('onPrimaryS(18)', style: context.styles.onPrimaryS(18)),
        Text(
          'onPrimaryContainerS(16)',
          style: context.styles.onPrimaryContainerS(16),
        ),

        Text('secondaryS(20)', style: context.styles.secondaryS(20)),
        Text('onSecondaryS(18)', style: context.styles.onSecondaryS(18)),

        Text('onBackgroundS(14)', style: context.styles.onBackgroundS(14)),

        Text('onSurfaceS(12)', style: context.styles.onSurfaceS(12)),
        Text(
          'onSurfaceVariantS(10)',
          style: context.styles.onSurfaceVariantS(10),
        ),

        Text('errorS(16)', style: context.styles.errorS(16)),
        Text('onErrorS(14)', style: context.styles.onErrorS(14)),

        Text('successS(18)', style: context.styles.successS(18)),
        Text('warningS(16)', style: context.styles.warningS(16)),
        Text('blackS(14)', style: context.styles.blackS(14)),
        Text('whiteS(12)', style: context.styles.whiteS(12)),
        Text('grayS(10)', style: context.styles.grayS(10)),

        const SizedBox(height: 20),
        const Text(
          '--- Decorations & Weights ---',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),

        Text(
          'Bold Primary',
          style: context.styles.bold(context.styles.primaryS(22)),
        ),
        Text(
          'Underlined OnBackground',
          style: context.styles.underline(context.styles.onBackgroundS(16)),
        ),
        Text(
          'LineThrough Error',
          style: context.styles.lineThrough(context.styles.errorS(14)),
        ),
        Text(
          'Combined (Bold & Underline)',
          style: context.styles.bold(
            context.styles.underline(context.styles.secondaryS(18)),
          ),
        ),
      ],
    );
  }
}
