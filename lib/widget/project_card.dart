import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/app_provider.dart';

import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;

  const ProjectCard({
    Key? key,
    this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  }) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.projectLink == null
          ? () {}
          : () => openURL(
                widget.projectLink!,
              ),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          clipBehavior: Clip.none,
          margin: Space.h,
          width: AppDimensions.normalize(150),
          height: AppDimensions.normalize(90),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 0.0),
                )
              ]),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*  widget.projectIcon != null
                      ? (width > 1135 || width < 950)
                          ? Image.asset(
                              widget.projectIcon!,
                              height: height * 0.05,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  widget.projectIcon!,
                                  height: height * 0.03,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  widget.projectTitle,
                                  style: AppText.b2b,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                      :  */
                  Container(),
                  widget.projectIconData != null
                      ? Image.asset(
                          "assets/photos/email.png",
                          height: AppDimensions.normalize(30),
                        )
                      : Container(),
                  (width > 1135 || width < 950)
                      ? SizedBox(
                          height: height * 0.02,
                        )
                      : const SizedBox(),
                  (width > 1135 || width < 950)
                      ? Text(
                          widget.projectTitle,
                          style: AppText.b2b,
                          textAlign: TextAlign.center,
                        )
                      : Container(),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    widget.projectDescription,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isHover ? 0.0 : 1.0,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: widget.banner != null
                      ? Image.asset(
                          widget.banner!,
                          fit: BoxFit.fill,
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
