import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Prepara palomitas',
      'Silencia el móvil',
      'Apaga las luces',
      'Invita a tus amigos',
      'Modo no molestar',
      'Maratón en camino',
    ];

    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return messages[step];
      },
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Cargando...'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(strokeWidth: 2),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Un momento...');
            return Text(snapshot.data!);
          },
        )
      ]),
    );
  }
}
