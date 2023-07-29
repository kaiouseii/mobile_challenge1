import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge1/modules/home/controllers/home_controller.dart';

class CategoryDropdownButton extends StatelessWidget {
  const CategoryDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.watch<HomeController>();
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: "Trailer",
          child: Text("Trailer"),
        ),
        DropdownMenuItem(
          value: "Reviews",
          child: Text("Reviews"),
        ),
        DropdownMenuItem(
          value: "Discussão",
          child: Text("Discussão"),
        ),
        DropdownMenuItem(
          value: "Sinopse",
          child: Text("Sinopse"),
        ),
      ],
      isExpanded: true,
      hint: const Text("Selecione uma categoria"),
      value: homeController.dropdownButtonValue == ""
          ? null
          : homeController.dropdownButtonValue,
      onChanged: (value) {
        homeController.dropdownButtonValue = value!;
      },
    );
  }
}
