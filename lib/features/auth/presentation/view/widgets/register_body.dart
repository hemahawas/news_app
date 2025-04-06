import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/routes.dart';
import 'package:news_app/core/shared_widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/presentation/view/widgets/email_field.dart';
import 'package:news_app/features/auth/presentation/view/widgets/navigating_to_login_view.dart';
import 'package:news_app/features/auth/presentation/view/widgets/password_field.dart';
import 'package:news_app/features/auth/presentation/view/widgets/register_button.dart';
import 'package:news_app/features/auth/presentation/view/widgets/register_title.dart';
import 'package:news_app/features/auth/presentation/view_model/cubit.dart';
import 'package:news_app/features/auth/presentation/view_model/states.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthRegisterSuccessState) {
          CustomSnackBar.show(
            context: context,
            message: 'Registered Successfully',
            color: Colors.green,
          );
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        } else if (state is AuthRegisterErrorState) {
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2,
                      ),
                      child: const RegisterTitle(),
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
                        state is AuthRegisterLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : RegisterButton(
                              emailController: emailController,
                              passwordController: passwordController,
                              onSuccess: () async {
                                await AuthCubit.get(context).register(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                            ),
                  ),
                  Expanded(flex: 2, child: const NavigatingToLoginView()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
