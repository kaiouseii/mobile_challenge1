import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/add_video_screen/add_video_screen.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/home_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomeScreen(),
        ),
        ChildRoute(
          "/add",
          child: (_, __) => const AddVideoScreen(),
        ),
        ChildRoute(
          "/alter",
          child: (_, __) => const AddVideoScreen(),
        ),
      ];
}
