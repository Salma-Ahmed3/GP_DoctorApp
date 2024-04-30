import 'package:flutter/material.dart';
import 'package:gbsub/Features/instructions/Ui/Widgets/doctor_instruction_list.dart';

class InstructionsViewBody extends StatelessWidget {
  const InstructionsViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InstructionList(),
    );
  }
}
