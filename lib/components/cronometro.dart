import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(builder: (context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: store.estaTrabalhando()
            ? const Color.fromARGB(255, 194, 53, 43)
            : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de Trabalhar'
                  : 'Hora de Descansar',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              '${store.minutos.toString().padLeft(2, "0")}:${store.segundos.toString().padLeft(2, "0")}',
              style: const TextStyle(fontSize: 120, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    !store.iniciado
                        ? CronometroBotao(
                            text: "Iniciar",
                            iconData: Icons.play_arrow,
                            onTap: store.iniciar)
                        : CronometroBotao(
                            text: "Parar",
                            iconData: Icons.stop,
                            onTap: store.parar,
                          ),
                    const SizedBox(width: 16),
                    CronometroBotao(
                      text: "Reiniciar",
                      iconData: Icons.refresh,
                      onTap: store.reiniciar,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
