import 'package:field_test/app_colors.dart';
import 'package:field_test/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPages extends StatefulWidget {
  const TestPages({super.key});

  @override
  State<TestPages> createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
  String valueGender = '';
  bool isGenderDropDown = false;
  String genderController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: genderController.isNotEmpty
                    ? Colors.transparent
                    : AppColors.bgTextFieldEmpty,
                border: Border.all(
                    color: genderController.isNotEmpty
                        ? const Color(0xFF888888)
                        : AppColors.greyPale),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: genderController.isNotEmpty ? 12 : 17,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Drop Down
                      setState(() {
                        isGenderDropDown = !isGenderDropDown;
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              style: GoogleFonts.inter(
                                  color: AppColors.grey,
                                  fontSize:
                                      genderController.isNotEmpty ? 11 : 15),
                              duration: const Duration(milliseconds: 100),
                              child: const Text(
                                'Gender',
                              ),
                            ),
                            SizedBox(
                              height: genderController.isNotEmpty ? 5 : 0,
                            ),
                            genderController.isNotEmpty
                                ? Text(
                                    genderController,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Container()
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            isGenderDropDown
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: genderController.isNotEmpty ? 12 : 17,
                  ),
                  isGenderDropDown
                      ? Column(
                          children: [
                            devider(),
                            const SizedBox(
                              height: 10,
                            ),
                            ...AppConstant.dummyListGender
                                .map((gender) => RadioListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      value: gender,
                                      visualDensity: VisualDensity.compact,
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      groupValue: valueGender,
                                      onChanged: (value) {
                                        setState(() {
                                          genderController = value as String;
                                          valueGender = gender;
                                        });
                                        isGenderDropDown = false;
                                      },
                                      activeColor: AppColors.blackGreyAccent,
                                      title: Text(
                                        gender,
                                        style: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackGreyAccent),
                                      ),
                                    )),
                          ],
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget genderDropDown(BuildContext context, isGenderDropDown, valueGender) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: genderController.isNotEmpty
            ? Colors.transparent
            : AppColors.bgTextFieldEmpty,
        border: Border.all(
            color: genderController.isNotEmpty
                ? const Color(0xFF888888)
                : AppColors.greyPale),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: genderController.isNotEmpty ? 12 : 17,
          ),
          GestureDetector(
            onTap: () {
              //Drop Down
              setState(() {
                isGenderDropDown = !isGenderDropDown;
              });
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedDefaultTextStyle(
                      style: GoogleFonts.inter(
                          color: AppColors.grey,
                          fontSize: genderController.isNotEmpty ? 11 : 15),
                      duration: const Duration(milliseconds: 100),
                      child: const Text(
                        'Gender',
                      ),
                    ),
                    SizedBox(
                      height: genderController.isNotEmpty ? 5 : 0,
                    ),
                    genderController.isNotEmpty
                        ? Text(
                            genderController,
                            style: GoogleFonts.inter(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        : Container()
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    isGenderDropDown
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: genderController.isNotEmpty ? 12 : 17,
          ),
          !isGenderDropDown
              ? Column(
                  children: [
                    devider(),
                    const SizedBox(
                      height: 10,
                    ),
                    ...AppConstant.dummyListGender
                        .map((gender) => RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              value: gender,
                              visualDensity: VisualDensity.compact,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                              groupValue: valueGender,
                              onChanged: (value) {
                                setState(() {
                                  genderController = value as String;
                                  valueGender = gender;
                                });
                              },
                              activeColor: AppColors.blackGreyAccent,
                              title: Text(
                                gender,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackGreyAccent),
                              ),
                            )),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget devider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 109,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: AppColors.greyPale,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
