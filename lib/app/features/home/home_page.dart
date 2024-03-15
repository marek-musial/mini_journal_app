import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/app/features/home/home_page_widgets/home_page_widgets.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/app/features/mood/mood_page_content.dart';
import 'package:journal/repositories/mood_item_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodPageCubit(MoodItemRepository()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('My mood today:'),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FAB(),
        bottomNavigationBar: const NavBar(),
        body: const MoodPageContent(),
      ),
    );
  }
}
