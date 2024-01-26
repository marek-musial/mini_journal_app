import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/app/features/mood/mood_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('My mood today:'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => MoodPageCubit(),
        child: const MoodPageContent(),
      ),
    );
  }
}
