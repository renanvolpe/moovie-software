import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

class ColorsSectionWidget extends StatelessWidget {
  const ColorsSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, Color>> colorEntries = [
      MapEntry('primary', context.colors.primary),
      MapEntry('onPrimaryColor', context.colors.onPrimaryColor),
      MapEntry('primaryContainer', context.colors.primaryContainer),
      MapEntry('onPrimaryContainerColor', context.colors.onPrimaryContainerColor),
      MapEntry('secondary', context.colors.secondary),
      MapEntry('onSecondaryColor', context.colors.onSecondaryColor),
      MapEntry('secondaryContainer', context.colors.secondaryContainer),
      MapEntry('onSecondaryContainerColor', context.colors.onSecondaryContainerColor),
      MapEntry('tertiary', context.colors.tertiary),
      MapEntry('onTertiaryColor', context.colors.onTertiaryColor),
      MapEntry('tertiaryContainer', context.colors.tertiaryContainer),
      MapEntry('onTertiaryContainerColor', context.colors.onTertiaryContainerColor),
      MapEntry('background', context.colors.background),
      MapEntry('onBackground', context.colors.onBackground),
      MapEntry('surface', context.colors.surface),
      MapEntry('onSurface', context.colors.onSurface),
      MapEntry('surfaceVariant', context.colors.surfaceVariant),
      MapEntry('onSurfaceVariant', context.colors.onSurfaceVariant),
      MapEntry('error', context.colors.error),
      MapEntry('onErrorCode', context.colors.onErrorCode),
      MapEntry('errorContainer', context.colors.errorContainer),
      MapEntry('onErrorContainerColor', context.colors.onErrorContainerColor),
      MapEntry('outline', context.colors.outline),
      MapEntry('outlineVariant', context.colors.outlineVariant),
      MapEntry('shadow', context.colors.shadow),
      MapEntry('scrim', context.colors.scrim),
      MapEntry('inversePrimary', context.colors.inversePrimary),
      MapEntry('inverseSurface', context.colors.inverseSurface),
      MapEntry('onInverseSurface', context.colors.onInverseSurface),
      MapEntry('successColor', context.colors.successColor),
      MapEntry('warningColor', context.colors.warning),
    ];

    return Column(
      spacing: 10,
      children: [
        Wrap(
          children: colorEntries.map((entry) {
            return Container(
              color: entry.value,
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(entry.key),
            );
          }).toList(),
        ),
      ],
    );
  }
}
