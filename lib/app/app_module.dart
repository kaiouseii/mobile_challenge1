import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (_,__) => const HomeScreen())
  ];
}