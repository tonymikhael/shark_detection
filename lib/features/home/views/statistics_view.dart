import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final double sharkCount = 15;
    final double noSharkCount = 85;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55),
        child: Column(
          children: [
            Text(
              'Monthly Shark Detections',
              style: AppStyles.headline1(context),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  ' No Shark 85%',
                  style: AppStyles.body1(context),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' Shark 15%',
                  style: AppStyles.body1(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: sharkCount,
                      color: Colors.redAccent,
                      title: 'Shark\n${sharkCount.toStringAsFixed(0)}',
                      radius: 70,
                      titleStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: noSharkCount,
                      color: AppColors.primaryColor,
                      title: 'No Shark\n${noSharkCount.toStringAsFixed(0)}',
                      radius: 70,
                      titleStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  sectionsSpace: 4,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
