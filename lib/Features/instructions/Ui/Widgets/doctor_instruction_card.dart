import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/assets.dart';
import 'package:gbsub/Core/utilts/style.dart';

class DoctorInstructionCard extends StatelessWidget {
  const DoctorInstructionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('إرشادات من الدكتور',
                style: Styles.style16.copyWith(fontSize: 20)),
            const SizedBox(height: 15),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AssetsData.DoctorHurt),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('مجدي يعقوب', style: Styles.styleBold16),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('جراح قلب', style: Styles.style16),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'إرشادات:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child:
                  Text('العقل السليم في الجسم السليم', style: Styles.style16),
            ),
          ],
        ),
      ),
    );
  }
}
