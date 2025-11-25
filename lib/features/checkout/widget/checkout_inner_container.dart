import 'package:coffee_app/features/checkout/widget/checkout_reset_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CheckoutInnerContainer extends StatelessWidget {
  const CheckoutInnerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckoutResetRow(
              title: 'Transaction ID',
              result: 'V278439380',
            ),
            CheckoutResetRow(
              title: 'Date',
              result: 'Nov 21 2023',
            ),
            CheckoutResetRow(
              title: 'Time',
              result: '03:04 PM',
            ),
            SizedBox(
              height: 10,
            ),
            DottedLine(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Item",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Iced Coffee",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "XLarge, 3 Splenda, 6 Pump (s) Pumpkin spice,\n3 Shot (s) Espresso, Pumpkin Spice Toppings,\nOatmilk, Normal Ice ",
              style: TextStyle(fontSize: 10,),
            ),
            Text(
              "Payment Summary",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            CheckoutResetRow(title: "Price", result: "\$6.99"),
            CheckoutResetRow(title: "Reward Points", result: "+ 80"),
            CheckoutResetRow(title: "Total", result: "\$6.99"),
            CheckoutResetRow(title: "Payment Summary", result: "Rewards"),
          ],
        ),
      ),
    );
  }
}
