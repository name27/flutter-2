import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class CertificateMark extends StatelessWidget {
  const CertificateMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.certificate,
          color: MyColors.primary,
          size: Sizes.size14,
        ),
        Positioned(
          child: FaIcon(
            FontAwesomeIcons.check,
            color: Colors.white,
            size: Sizes.size8,
          ),
        )
      ],
    );
  }
}
