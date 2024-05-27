import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationbarcubit.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationvarstates.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/body_parts/logic/diagnosis_cubit.dart';
import 'package:gbsub/Features/body_parts/ui/diagnosis_view_body.dart';

class DiagnosisView extends StatelessWidget {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiagnosisCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<NavagationbarCubit, BottomNavigationBarStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'تشخيص',
                  style: Styles.styleBold24.copyWith(
                    color: mainColor,
                  ),
                ),
                iconTheme: IconThemeData(color: mainColor),
              ),
              body: const DiagnosisViewBody(),
            );
          },
        ),
      ),
    );
  }
}
