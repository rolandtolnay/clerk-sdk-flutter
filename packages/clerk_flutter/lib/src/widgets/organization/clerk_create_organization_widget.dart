import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///The [ClerkCreateOrganizationWidget] component is used to render an organization creation
/// UI that allows users to create brand new organizations within your application.
///
@Deprecated('Not ready for use')
@immutable
class ClerkCreateOrganizationWidget extends StatelessWidget {
  /// Constructs a const [ClerkCreateOrganizationWidget].
  const ClerkCreateOrganizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClerkVerticalCard(
      topPortion: _TopPortion(),
    );
  }
}

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: allPadding24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Create Organization', style: context.clerkTitle, maxLines: 1),
          verticalMargin32,
          Text('Logo', style: context.clerkSubtitle, maxLines: 1),
          verticalMargin10,
          Row(
            children: [
              SvgPicture.asset(
                ClerkAssets.uploadLogoPlaceholder,
                height: 64.0,
                width: 64.0,
                package: 'clerk_flutter',
              ),
              horizontalMargin16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 70.0,
                        child: ClerkButton(
                          style: ClerkButtonStyle.light,
                          label: Text(
                            'Upload',
                            style:
                                TextStyle(color: ClerkColors.darkJungleGreen),
                          ),
                        ),
                      ),
                    ),
                    verticalMargin10,
                    Text(
                      'Recommend size 1:1, up to 5MB.',
                      maxLines: 2,
                      style: context.clerkSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalMargin28,
          const ClerkInput(label: 'Name'),
          verticalMargin28,
          const ClerkInput(label: 'Slug URL'),
          verticalMargin28,
          const Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 150.0,
              child: ClerkButton(
                label: Text('Create Organization'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
