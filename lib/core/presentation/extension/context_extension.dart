import 'package:flutter/material.dart' show BuildContext;

import '../../layers/localization/l10n/generated/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
}
