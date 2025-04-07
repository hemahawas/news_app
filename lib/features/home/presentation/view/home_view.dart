import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/custom_appbar.dart';
import 'package:news_app/core/shared_widgets/custom_icon.dart';
import 'package:news_app/features/home/presentation/view/widgets/home_body.dart';
import 'package:news_app/features/home/presentation/view_model/cubit.dart';
import 'package:news_app/features/home/presentation/view_model/states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(body: HomeBody());
      },
    );
  }
}
