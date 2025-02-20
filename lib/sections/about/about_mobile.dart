import 'package:flutter/foundation.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';

import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/about_me_data.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/tech_widget.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          /*    const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ), */
          Space.y2!,
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.25,
          ),
          Space.y2!,

          /*  Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ), */

          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2!.copyWith(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            textAlign: TextAlign.center,
            AboutUtils.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          /* Divider(
            color: Colors.grey[500],
            thickness: AppDimensions.normalize(0.5),
          ), */
          Space.y!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.y!,
          /*  Divider(
            color: Colors.grey[500],
            thickness: AppDimensions.normalize(0.5),
          ), */
          /* SizedBox(
            height: height * 0.02,
          ), */
          /* const AboutMeData(
            data: "Name",
            information: "Elif Bilge",
          ),
          const AboutMeData(
            data: "Email",
            information: "elf.prlk64@gmail.com",
          ), */
          Space.y!,
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.light.primary),
              child: const Text("Resume"),
              onPressed: () {
                kIsWeb
                    ? html.window.open(StaticUtils.resume, "pdf")
                    : openURL(StaticUtils.resume);
              }),
          Space.y!,
          /* Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: WorkUtils.logos
                  .asMap()
                  .entries
                  .map(
                    (e) => CommunityIconBtn(
                      icon: e.value,
                      link: WorkUtils.communityLinks[e.key],
                      height: WorkUtils.communityLogoHeight[e.key],
                    ),
                  )
                  .toList()), */
        ],
      ),
    );
  }
}
