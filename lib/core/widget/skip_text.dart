import 'package:coffee_app/features/home/widget/home_layout.dart';
import 'package:flutter/cupertino.dart';

class SkipText extends StatelessWidget {
  const SkipText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => HomeLayout(),
                  ));
            },
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
