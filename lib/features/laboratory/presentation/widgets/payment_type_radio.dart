import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthy_cart_user/core/custom/button_widget/button_widget.dart';
import 'package:healthy_cart_user/features/laboratory/application/provider/lab_orders_provider.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';
import 'package:provider/provider.dart';

class PaymentTypeRadioLab extends StatelessWidget {
  const PaymentTypeRadioLab({
    super.key,
    this.onConfirm,
  });

  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Consumer<LabOrdersProvider>(builder: (context, provider, _) {
      return PopScope(
        // onPopInvoked: (didPop) {
        //   provider.selectedRadio = null;
        // },
        child: AlertDialog(
          backgroundColor: BColors.white,
          title: const Text(
            'Choose Payment Method?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioMenuButton(
                value: 'Online',
                groupValue: provider.paymentType,
                onChanged: (value) {
                  provider.setPaymentType(value);
                },
                child: const Text('Online'),
              ),
              RadioMenuButton(
                value: 'Doorstep Payment',
                groupValue: provider.paymentType,
                onChanged: (value) {
                  provider.setPaymentType(value);
                },
                child: const Text('Doorstep Payment'),
              ),
              const Gap(10),
              ButtonWidget(
                buttonHeight: 40,
                buttonWidth: 120,
                buttonColor: BColors.darkblue,
                buttonWidget: const Text('Confirm',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: BColors.white)),
                onPressed: onConfirm,
              ),
            ],
          ),
        ),
      );
    });
  }
}
