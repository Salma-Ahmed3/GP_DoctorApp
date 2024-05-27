import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationbarcubit.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationvarstates.dart';

import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Core/utils/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utils/widgets/custom_snack_bar.dart';

class AddingQuestionViewBody extends StatelessWidget {
  const AddingQuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<NavagationbarCubit>(context);
    return BlocBuilder<NavagationbarCubit, BottomNavigationBarStates>(
      builder: (context, state) {
        return Form(
          key: of.formkey,
          autovalidateMode: of.autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TextFormField(
                    maxLines: 5,
                    autofocus: true,
                    style: Styles.style16.copyWith(color: Colors.black),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (value) {
                      of.enterQuestion(value);
                    },
                    onChanged: (value) {
                      of.enterQuestion(value);
                    },
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintStyle:
                          Styles.style16.copyWith(color: Colors.grey.shade400),
                      hintText: 'أدخل سؤالك هنا ...',
                      hintTextDirection: TextDirection.rtl,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.w)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.w)),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Customelevatedbutton(
                        text: 'نشر',
                        onPressed: () async {
                          if (of.formkey.currentState!.validate()) {
                            bool state = await of
                                .postQUestion(Sharedhelper.getintdata(intkey));
                            if (state) {
                              await of.getAllQuetions();
                              Navigator.pop(context);
                              await of.getAllQuetions();
                            } else {
                              customSnackBar(
                                  context, 'لم يتم إضافة سؤالك حاول مرة أخرى');
                            }
                          } else {
                            of.autovalidateMode = AutovalidateMode.always;
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
