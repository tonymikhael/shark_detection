import 'package:flutter/material.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/cusom_button.dart';

class LiveView extends StatelessWidget {
  const LiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 54, left: 16, right: 16),
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                btnColor: Colors.green,
                title: 'Buzzer On',
                titleColor: Colors.black,
                onPressed: () {},
              ),
              CustomElevatedButton(
                btnColor: Colors.red,
                title: 'Buzzer Off',
                titleColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
