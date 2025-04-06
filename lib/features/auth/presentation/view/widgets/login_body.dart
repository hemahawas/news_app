import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/routes.dart';
import 'package:news_app/core/shared_widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/presentation/view/widgets/email_field.dart';
import 'package:news_app/features/auth/presentation/view/widgets/login_button.dart';
import 'package:news_app/features/auth/presentation/view/widgets/login_title.dart';
import 'package:news_app/features/auth/presentation/view/widgets/navigating_to_register_view.dart';
import 'package:news_app/features/auth/presentation/view/widgets/password_field.dart';
import 'package:news_app/features/auth/presentation/view_model/cubit.dart';
import 'package:news_app/features/auth/presentation/view_model/states.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLogInSuccessState) {
          CustomSnackBar.show(
            context: context,
            message: 'Login Successfully',
            color: Colors.green,
          );
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        } else if (state is AuthLogInErrorState) {
          CustomSnackBar.show(
            context: context,
            message: state.error,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                spacing: 15,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2,
                      ),
                      child: const LoginTitle(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: EmailField(emailController: emailController),
                  ),
                  Expanded(
                    flex: 1,
                    child: PasswordField(
                      passwordController: passwordController,
                      changeVisibility: () {
                        AuthCubit.get(context).togglePasswordVisibility();
                      },
                      isPasswordVisible:
                          AuthCubit.get(context).isPasswordVisible,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        state is AuthLogInLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : LoginButton(
                              emailController: emailController,
                              passwordController: passwordController,
                              onSuccess: () async {
                                await AuthCubit.get(context).logIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                            ),
                  ),
                  Expanded(
                    flex: 3,
                    child: NvigatingToRegisterView(onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
