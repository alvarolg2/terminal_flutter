import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:terminal_flutter/ui/widgets/custom_window.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomWindow(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //botón de apagar y reiniciar
                Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: viewModel.restart,
                        icon: const Icon(Icons.restart_alt_outlined),
                        label: const Text('Reiniciar')),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        onPressed: viewModel.shutDown,
                        icon: const Icon(
                            Icons.power_settings_new_outlined),
                        label: const Text('Apagar')),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            controller: viewModel.timeToShutDown,
                            decoration: const InputDecoration(
                                labelText: 'Tiempo para el apagado (minutos)'),
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                            onPressed: viewModel.schedoleShutDown,
                            icon: const Icon(Icons.schedule_outlined),
                            label: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Programar apagado'),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            controller: viewModel.timeToRestart,
                            decoration: const InputDecoration(
                                labelText: 'Tiempo para el reinicio (minutos)'),
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                            onPressed: viewModel.schedoleRestart,
                            icon: const Icon(Icons.schedule_outlined),
                            label: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Programar reinicio'),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: viewModel.cancelShutDown,
                    child: const Text('Cancelar reinicio/apagado programado'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
