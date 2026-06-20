import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/entities/resource_entity.dart';
import '../../../../../../core/presentation/bases/base_stateless_widget.dart';
import '../../../../../../core/presentation/utils/url_opener/url_opener.dart';

class ResourceListItem extends BaseStatelessWidget {
  final ResourceItemEntity resourceItem;
  final String iconPath;

  const ResourceListItem({
    super.key,
    required this.resourceItem,
    required this.iconPath,
  });

  @override
  Widget buildWith(BuildContext context, CommonDependency d) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: d.theme.colorScheme.surfaceContainerHighest.withAlpha(50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: SizedBox(width: 50, height: 50, child: Image.asset(iconPath)),
        title: Text(
          resourceItem.title,
          style: d.typography.subTitle.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          d.appLocalizations.resourceSubtitle(
            resourceItem.language,
            resourceItem.pricingType,
          ),
          style: d.typography.label.copyWith(
            color: d.theme.colorScheme.onSurfaceVariant,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () async {
          if (!(await getIt.get<UrlOpener>().open(resourceItem.url))) {
            d.displaySnackBar(
              contentType: ContentType.failure,
              title: d.appLocalizations.error,
              message: d.appLocalizations.failedToOpenUrl,
            );
          }
        },
      ),
    );
  }
}
