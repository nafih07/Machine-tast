import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_test/generated/l10n.dart';
import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/model/user/user.dart' as us;
import 'package:machine_test/resources/resources.dart';
import 'package:machine_test/riverpod/state_providers/state_provider.dart';
import 'package:machine_test/riverpod/states/states.dart';
import 'package:machine_test/screens/user_list.dart';
import 'package:machine_test/screens/profile.dart';
import 'package:machine_test/widget/widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  late TextEditingController _emailFieldController;
  late TextEditingController _passwordFieldController;

  @override
  void initState() {
    _emailFieldController = TextEditingController();
    _passwordFieldController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      ValidationState validationState = watch(validationProvider);
      bool loaderState = watch(loaderIndicatorProvider);

      return Scaffold(
          body: new Form(
              key: _formKey,
              autovalidateMode: validationState.autoValidateMode,
              child: _buildFormContentWidget(loaderState)));
    });
  }

  Widget _buildFormContentWidget(var loaderState) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        height: double.infinity,
        padding: EdgeInsets.only(left: 25, right: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF75eafa),
            Color(0xFF64b3f4),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 57),
                    child: Center(
                        child: Text("Login",
                            style: AppTextStyles.boldTextStyle(
                                24, AppColors.one)))),
                Card(
                    margin: EdgeInsets.only(top: 25),
                    color: AppColors.two,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Text("Email",
                                style: AppTextStyles.mediumTextStyle(
                                    14, Colors.white)),
                            SizedBox(height: 10),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.two,
                                ),
                                child: _buildEmailField()),
                            SizedBox(
                              height: 10,
                            ),
                            Text("PassWord",
                                style: AppTextStyles.mediumTextStyle(
                                    14, Colors.white)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.two,
                                ),
                                child: _buildPassWordField()),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password",
                                style: AppTextStyles.mediumTextStyle(
                                    14, Colors.white),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(height: 50),
                          ]),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: AppButton(
                        backgroundColor: AppColors.three,
                        onPressed: _signIn,
                        borderRadius: 20,
                        text: S.current.login,
                        width: 100,
                        height: 49)),
                SizedBox(height: 10),
                InkWell(
                  onTap: () => Screens.pushReplacement(context, SignIn()),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don,t have an Account?",
                          style:
                              AppTextStyles.regularTextStyle(13, Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(" Sign Up",
                            style:
                                AppTextStyles.mediumTextStyle(14, Colors.white))
                      ]),
                ),
                loaderState
                    ? GenericWidgets.buildCircularProgressIndicator()
                    : Container(),
              ]),
        ));
  }

  Widget _buildEmailField() {
    return AppTextField(
        prefixIcon: Icon(
          Icons.mail,
          color: AppColors.one,
        ),
        hint: S.current.email,
        autoFocus: true,
        validator: (value) => Validator.validateEmail(value, ""),
        textInputType: TextInputType.emailAddress,
        controller: _emailFieldController);
  }

  Widget _buildPassWordField() {
    return AppTextField(
        prefixIcon: Icon(
          Icons.lock,
          color: AppColors.one,
        ),
        hint: S.current.password,
        autoFocus: true,
        validator: (value) =>
            Validator.validateEmptyString(value, S.current.err_enter_password),
        textInputType: TextInputType.text,
        controller: _passwordFieldController);
  }

  Widget _buildSocioLoginWidget() => Padding(
        padding: const EdgeInsets.only(top: 39),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSociLoginItemWidget(AppIcons.facebookIcon),
              _buildSociLoginItemWidget(AppIcons.googleIcon)
            ]),
      );

  Widget _buildSociLoginItemWidget(String icon) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 31, width: 31, fit: BoxFit.cover),
            SizedBox(width: 10),
            Text(S.current.sign_in,
                style: AppTextStyles.regularTextStyle(
                    13, AppColors.primaryTextColor))
          ]);

  void _signIn() {
    context.read(validationProvider.notifier).validateForm(_formKey);
    if (context.read(validationProvider).autoValidateMode ==
        AutovalidateMode.disabled) {
      _signInWithEmailAndPassword();
    }
  }

  Future _signInWithEmailAndPassword() async {
    context.read(userProvider.notifier).loginUser(
        context: context,
        email: _emailFieldController.text.trim(),
        password: _passwordFieldController.text.trim(),
        onSuccess: () => Screens.pushReplacement(context, UserList()),
        onError: (error) => GenericFunctions.showToastBar(error, context));
  }
}
