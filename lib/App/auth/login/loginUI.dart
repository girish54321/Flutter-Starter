import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:reqres_app/widget/appIcon.dart';
import 'package:reqres_app/widget/appInputText.dart';
import 'package:reqres_app/widget/appText.dart';
import 'package:reqres_app/widget/buttons.dart';
import 'package:rules/rules.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreenUI extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function changeVaildEmail;
  final Function changevalidPassword;
  final Function changeRemember;
  final bool rememberMe;
  final GlobalKey<FormState> formKey;
  final Function loginUser;
  final Function createAccount;

  const LoginScreenUI(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.validEmail,
      required this.validPassword,
      required this.changeVaildEmail,
      required this.changevalidPassword,
      required this.changeRemember,
      required this.rememberMe,
      required this.formKey,
      required this.loginUser,
      required this.createAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localData = AppLocalizations.of(context)!;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBar(
                          title: FadeInRight(
                              duration: const Duration(milliseconds: 500),
                              child: Text(localData.logIn))),
                      Column(
                        children: [
                          FadeInRight(
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 46),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextH2(
                                    fontWeight: FontWeight.bold,
                                    text: localData.logIn,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  SmallText(
                                    text: localData.enteryouremailandpassword,
                                  ),
                                  InputText(
                                      textInputType: TextInputType.emailAddress,
                                      textEditingController: emailController,
                                      password: false,
                                      hint: localData.email,
                                      onChnaged: (text) {
                                        final emailRule = Rule(text,
                                            name: localData.email,
                                            isRequired: true,
                                            isEmail: true);
                                        if (emailRule.hasError) {
                                          changeVaildEmail(false);
                                        } else {
                                          changeVaildEmail(true);
                                        }
                                      },
                                      rightIcon: validEmail
                                          ? const RightIcon()
                                          : const WrongIcon(),
                                      validator: (password) {
                                        final passWordRule = Rule(password,
                                            name: localData.email,
                                            isRequired: true,
                                            isEmail: true);
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  InputText(
                                      textEditingController: passwordController,
                                      password: true,
                                      hint: localData.password,
                                      onChnaged: (text) {
                                        final emailRule = Rule(text,
                                            name: localData.password,
                                            isRequired: true,
                                            minLength: 6);
                                        if (emailRule.hasError) {
                                          changevalidPassword(false);
                                        } else {
                                          changevalidPassword(true);
                                        }
                                      },
                                      rightIcon: validPassword
                                          ? const RightIcon()
                                          : const WrongIcon(),
                                      validator: (password) {
                                        final passWordRule = Rule(password,
                                            name: localData.password,
                                            isRequired: true,
                                            minLength: 6);
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(children: [
                                        SizedBox(
                                          child: SizedBox(
                                              height: 24.0,
                                              width: 24.0,
                                              child: Checkbox(
                                                onChanged: (bool? value) {
                                                  changeRemember(value);
                                                },
                                                value: rememberMe,
                                              )),
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        localData.rememberme,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            localData.forgotpassword,
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  AppButton(
                                    function: () {
                                      loginUser();
                                    },
                                    child: Center(
                                      child: Text(
                                        localData.logIn,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                        child: Text(
                                          localData.createnewaccount,
                                        ),
                                        onPressed: () {
                                          createAccount();
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(""),
                      const Text("")
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
