import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthy_cart_user/core/general/cached_network_image.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    required this.rightPadding,
    required this.leftPadding,
  });
  final String title;
  final void Function()? onTap;
  final String image;
  final double rightPadding;
  final double leftPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: rightPadding, left: leftPadding),
        child: Column(
          children: [
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64)),
              elevation: 4,
              child: Container(
                width: 64,
                height: 64,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: BColors.white,
                  shape: BoxShape.circle,
                ),
                child: CustomCachedNetworkImage(
                  image: image,
                ),
              ),
            ),
            const Gap(8),
            SizedBox(
              width: 96,
              child: Text(
               title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  
                    fontFamily: 'Montserrat',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: BColors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
