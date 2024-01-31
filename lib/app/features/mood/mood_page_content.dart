import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/app/features/mood/mood_page_widgets/mood_page_widgets.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';

class MoodPageContent extends StatelessWidget {
  const MoodPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodPageCubit(),
      child: BlocBuilder<MoodPageCubit, MoodPageState>(
        builder: (context, state) {
          final itemModel = state.itemModel;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth / 24),
                    ),
                    color: currentColorScheme.primaryContainer),
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight / 64,
                  horizontal: screenWidth / 32,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight / 64,
                  horizontal: screenWidth / 32,
                ),
                child: const MoodSelection(),
              ),
              DateDisplay(itemModel: itemModel),
              MoodDisplay(itemModel: itemModel),
              MessageDisplay(itemModel: itemModel),
              CalendarDisplay(itemModel: itemModel),
            ],
          );
        },
      ),
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    super.key,
    required this.itemModel,
  });

  final MoodItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemModel?.date?.day == DateTime.now().day && itemModel?.date?.month == DateTime.now().month && itemModel?.date?.year == DateTime.now().year ||
              itemModel?.date == null
          ? 'My mood today:'
          : 'My mood on ${itemModel?.dateFormatted()}',
      style: TextStyle(fontSize: screenHeight / 44),
    );
  }
}
