import 'package:flutter/material.dart';
import 'package:mobile_challenge1/app/common/app_bar.dart';
import 'package:mobile_challenge1/app/common/floating_action_button.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/main_video.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/row_of_categories.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/trailer_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: floatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainVideo(),
            Column(
              children: const [
                RowOfCategories(),
                TrailerCategory(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
