import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/routes.dart';
import 'package:news_app/core/shared_widgets/custom_appbar.dart';
import 'package:news_app/core/shared_widgets/custom_dialog.dart';
import 'package:news_app/core/shared_widgets/custom_icon.dart';
import 'package:news_app/features/auth/presentation/view_model/cubit.dart';
import 'package:news_app/features/auth/presentation/view_model/states.dart';
import 'package:news_app/features/home/presentation/view/widgets/business_content.dart';
import 'package:news_app/injection_container.dart' as di;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CustomAppbar(
            text: 'Breaking News',
            iconButtons: [
              CustomIcon(
                icon: Icons.search,
                onPressed: () {
                  // Implement search functionality
                },
              ),
              BlocProvider.value(
                value: di.sl<AuthCubit>(),
                child: BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthLogOutSuccessState) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginRoute,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomIcon(
                      icon: Icons.logout,
                      onPressed: () {
                        CustomDialog.show(
                          context: context,
                          onConfirm: () {
                            AuthCubit.get(context).logOut();
                          },
                          title: 'Log Out',
                          content: 'Are you sure you want to log out?',
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        BusinessContent(),
      ],
    );
  }
}
