import 'package:asobancaria/providers/providerfino.dart';
import 'package:asobancaria/widgets/widget_fecha.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Providerfino(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('se redibujo el widget MyAPP');
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(
          body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimerLED(),
          ],
        ),
      )),
    );
  }
}

class PrimerLED extends StatelessWidget {
  const PrimerLED({super.key});

  @override
  Widget build(BuildContext context) {
    print('se redibujo el widget PrimerLED');
    final ledProvider = Provider.of<Providerfino>(context, listen: false);
    ledProvider.setFecha('fechita');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Formulario'),
          // Container(
          //   height: 100,
          //   width: 100,
          //   decoration: BoxDecoration(
          //     color: ledProvider.getLed ? Colors.amber : Colors.grey,
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          // ),
          DatePickerFormField(
            controllerText: ledProvider.fechaController,
          ),
          DatePickerFormField(
            controllerText: ledProvider.fechaController2,
          ),
          DatePickerFormField(
            controllerText: ledProvider.fechaController3,
          ),
          const SegundoLed(),
          MaterialButton(
            onPressed: () async {
              ledProvider.setLed(
                true,
              );
              print('se envio: ${ledProvider.fechaController.text}');
              print('se envio: ${ledProvider.fechaController2.text}');
              print('se envio: ${ledProvider.fechaController3.text}');
              ledProvider.fechaController.text = '';
              ledProvider.fechaController2.text = '';
              ledProvider.fechaController3.text = '';
              await Future.delayed(const Duration(seconds: 2));
              ledProvider.setLed(
                false,
              );
            },
            child: const Text('ON/OFF LED'),
          ),
        ],
      ),
    );
  }
}

class SegundoLed extends StatelessWidget {
  const SegundoLed({super.key});

  @override
  Widget build(BuildContext context) {
    print('se redibujo el widget SegundoLED');
    final ledProvider = Provider.of<Providerfino>(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Led dos'),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: ledProvider.getLed ? Colors.amber : Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          // MaterialButton(
          //   onPressed: () {
          //     ledProvider.setLed(
          //       !ledProvider.getLed,
          //     );
          //     print('led: ${ledProvider.getLed}');
          //   },
          //   child: const Text('ON/OFF LED'),
          // )
        ],
      ),
    );
  }
}
