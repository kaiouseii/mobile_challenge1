import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/app/common/app_bar.dart';
import 'package:mobile_challenge1/app/common/floating_action_button.dart';
import 'package:mobile_challenge1/modules/home/controllers/database_helper.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/data/task_dao.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/main_video.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/row_of_categories.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/trailer_category.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      DatabaseHelper databaseHelper = Modular.get<DatabaseHelper>();
      HomeController homeController = context.watch<HomeController>();
      
      await databaseHelper.initDatabase(); // starts the database

      Database db = await databaseHelper.database;

      //insert if list is not empty
      List<VideoItem> listOfVideos = await TaskDao().searchAll(db);
      if (listOfVideos.isNotEmpty) {
        for (VideoItem element in listOfVideos) {
          homeController.addVideo(element);
        }
      }
     });
  }
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
