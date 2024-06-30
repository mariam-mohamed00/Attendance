import 'package:attendance/core/widgets/custom_button.dart';
import 'package:attendance/features/home/presentation/views/setting/presentation/manager/setting_change_password/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/providers/app_config_provider.dart';
import '../../../../../../../../core/utils/my_theme.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home_screen.dart';

class FormChangePassword extends StatefulWidget {
  FormChangePassword({super.key});

  @override
  State<FormChangePassword> createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  var formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
      if (state is ChangePasswordsuccess) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  backgroundColor: provider.appTheme == ThemeMode.light
                      ? MyTheme.whiteColor
                      : MyTheme.primaryDark,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                      },
                      child: Text(
                        "Close",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.primaryLight
                                : MyTheme.whiteColor),
                      ),
                    )
                  ],
                  title: Text(
                    "change Successfully",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.primaryLight
                            : MyTheme.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  icon:
                      const Icon(Icons.verified, color: Colors.green, size: 45),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  content: Text(
                    'Thanks for being here, Best Wishes.',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.primaryLight),
                  ),
                ));
      } else if (state is ChangePasswordFailed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: provider.appTheme == ThemeMode.light
                      ? MyTheme.whiteColor
                      : MyTheme.primaryDark,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.primaryLight
                                : MyTheme.whiteColor),
                      ),
                    )
                  ],
                  title: Text(
                    "change Failed",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.primaryLight
                            : MyTheme.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  icon:
                      const Icon(Icons.sms_failed, color: Colors.red, size: 45),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  content: Text(
                    state.failed,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.primaryLight),
                  ),
                ));
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Text('Current Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
            ),
            CustomTextFormField(
              isObscure: isObscure1,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor.withOpacity(0.5)
                        : MyTheme.whiteColor.withOpacity(0.5),
                  ),
              hint: 'your password',
              suffixIcon: InkWell(
                child: isObscure1
                    ? Icon(Icons.visibility_off,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor)
                    : Icon(Icons.visibility,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor),
                onTap: () {
                  if (isObscure1) {
                    isObscure1 = false;
                  } else {
                    isObscure1 = true;
                  }
                  setState(() {});
                },
              ),
              keyboardType: TextInputType.number,
              controller: passwordController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Enter your current password';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Text('New Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
            ),
            CustomTextFormField(
              isObscure: isObscure2,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor.withOpacity(0.5)
                        : MyTheme.whiteColor.withOpacity(0.5),
                  ),
              hint: '******',
              keyboardType: TextInputType.number,
              suffixIcon: InkWell(
                child: isObscure2
                    ? Icon(Icons.visibility_off,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor)
                    : Icon(Icons.visibility,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor),
                onTap: () {
                  if (isObscure2) {
                    isObscure2 = false;
                  } else {
                    isObscure2 = true;
                  }
                  setState(() {});
                },
              ),
              controller: newPasswordController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Enter new password to change';
                }
                if (text.length < 6) {
                  return 'At least 6 characters to change the password';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Text('Confirm Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
            ),
            CustomTextFormField(
              isObscure: isObscure3,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor.withOpacity(0.5)
                        : MyTheme.whiteColor.withOpacity(0.5),
                  ),
              hint: '******',
              keyboardType: TextInputType.number,
              suffixIcon: InkWell(
                child: isObscure3
                    ? Icon(Icons.visibility_off,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor)
                    : Icon(Icons.visibility,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor),
                onTap: () {
                  if (isObscure3) {
                    isObscure3 = false;
                  } else {
                    isObscure3 = true;
                  }
                  setState(() {});
                },
              ),
              controller: confirmNewPasswordController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please enter your password again';
                }
                if (confirmNewPasswordController.text !=
                    newPasswordController.text) {
                  return 'Password mismatch';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomButton(
                buttonText: 'Finish',
                onPressed: () {
                  check();
                })
          ],
        ),
      );
    });
  }

  void check() {
    if (formKey.currentState!.validate() == true) {
      if (passwordController.text.isNotEmpty &&
          newPasswordController.text == confirmNewPasswordController.text &&
          newPasswordController.text.isNotEmpty &&
          confirmNewPasswordController.text.isNotEmpty) {
        context.read<ChangePasswordCubit>().changePassword(
            currentPassword: passwordController.text,
            newPassword: newPasswordController.text,
            confirmPassword: confirmNewPasswordController.text);
      }
    }
  }
}
