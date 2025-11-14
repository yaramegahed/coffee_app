import 'package:flutter/cupertino.dart';

import '../../../core/utils/styles.dart';

class CustomSwitchRow extends StatefulWidget {
  final String text;

  const CustomSwitchRow({
    super.key,
    required this.text,
  });

  @override
  State<CustomSwitchRow> createState() => _CustomSwitchRowState();
}

class _CustomSwitchRowState extends State<CustomSwitchRow> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Text(
            widget.text,
            style: Styles.textStyle20400G,
          ),
          Spacer(),
          CupertinoSwitch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              })
        ],
      ),
    );
  }
}
