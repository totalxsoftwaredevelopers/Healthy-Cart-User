import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_cart_user/core/custom/toast/toast.dart';
import 'package:healthy_cart_user/features/laboratory/domain/models/lab_orders_model.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';

class LabOrderIdAndDate extends StatelessWidget {
  const LabOrderIdAndDate({
    super.key,
    required this.orderData,
    required this.date,
  });

  final LabOrdersModel orderData;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: orderData.id ?? ''));
            CustomToast.sucessToast(text: 'Order ID sucessfully copied.');
          },
          child: Container(
            height: 28,
            width: 176,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: BColors.darkblue),
            child: Center(
              child: Text(
                '${orderData.id}',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: BColors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 28,
          width: 128,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
              color: BColors.offWhite),
          child: Center(
            child: Text(
              date,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: BColors.darkblue),
            ),
          ),
        ),
      ],
    );
  }
}
