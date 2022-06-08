import 'package:church__vest/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final String icon;
  const CustomIconButton({
    Key? key,
    this.onPressed,
    this.icon = 'assets/svgs/arrow-right.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        // border:
        //     Border.all(color: switchPrimaryColor.withOpacity(.2), width: 1),
        borderRadius: BorderRadius.circular(16),
        color: primaryColor,
      ),
      child: IconButton(
        splashColor: Colors.transparent,
        // highlightColor: splashPrimaryColor.withOpacity(.1),
        splashRadius: 32,
        icon: SvgPicture.asset(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
