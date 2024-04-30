import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/instructions/Ui/Widgets/instruction_page.dart';
import 'package:gbsub/Features/instructions/Ui/instructions_view_body.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: mainColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'الإرشادات',
            style: Styles.styleBold24.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const InstructionPage();
                  }),
                );
              },
            ),
          ],
        ),
        body: const InstructionsViewBody(),
      ),
    );
  }
}
