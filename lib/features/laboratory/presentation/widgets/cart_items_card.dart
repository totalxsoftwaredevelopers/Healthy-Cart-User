import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthy_cart_user/core/general/cached_network_image.dart';
import 'package:healthy_cart_user/features/laboratory/application/provider/lab_provider.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';
import 'package:provider/provider.dart';

class CartItemsCard extends StatelessWidget {
  const CartItemsCard({
    super.key,
    required this.index,
    this.image,
    this.testName,
    this.testPrice,
    this.offerPrice,
    this.onDelete,
  });

  final String? image;
  final String? testName;
  final num? testPrice;
  final num? offerPrice;
  final void Function()? onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<LabProvider>(builder: (context, labProvider, _) {
      return Container(
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 54,
                      width: 54,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CustomCachedNetworkImage(image: image!),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            testName!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const Gap(8),
                          Expanded(
                            child: labProvider.cartItems[index].offerPrice ==
                                    null
                                ? RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Test Fee - ',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: BColors.green,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                          text: '₹$testPrice',
                                          style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: BColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Test Fee - ',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: BColors.green,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                          text: '₹$testPrice',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'Montserrat',
                                              color: BColors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: offerPrice == 0
                                              ? '  Free'
                                              : '  ₹$offerPrice',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: BColors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: onDelete,
                    child: Text('Remove',
                        style: TextStyle(
                            color: BColors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
