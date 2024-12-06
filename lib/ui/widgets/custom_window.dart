import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:terminal_flutter/themes.dart';

class CustomWindow extends StatelessWidget {
  final Widget child;

  const CustomWindow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    return Column(
      children: [
        WindowTitleBarBox(
          child: Container(
            color: currentBrightness == Brightness.dark ? AppColors.appbarDark : AppColors.appbarLight,
            child: Row(
              children: [
                Expanded(
                  child: MoveWindow(),
                ),
                WindowButtons(),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    return Row(
      children: [
        //Aqui le asigno el color a cada boton de la barra superior dependiendo del tema, ahora se usa el mismo para todos los iconos pero se podria cambiar e individualizar
        MinimizeWindowButton(colors: WindowButtonColors(iconNormal: currentBrightness == Brightness.dark ? AppColors.iconsAppDark : AppColors.iconsAppLight)),
        MaximizeWindowButton(colors: WindowButtonColors(iconNormal: currentBrightness == Brightness.dark ? AppColors.iconsAppDark : AppColors.iconsAppLight)),
        CloseWindowButton(colors: WindowButtonColors(iconNormal: currentBrightness == Brightness.dark ? AppColors.iconsAppDark : AppColors.iconsAppLight)),
      ],
    );
  }
}
