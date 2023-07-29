import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => Provider(
            create: (_) => HomeController(),
            child: const HomeScreen(),
          ),
        ),
      ];
}
