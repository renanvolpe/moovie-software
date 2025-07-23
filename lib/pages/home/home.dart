import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ControllerGet {
  Future<String> getData(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return "I'm the output: $count";
  }

  Future<String> getSecondData(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return "I'm the output: 2 ${count + 100}";
  }
}

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => ControllerGet()); // good practice
    final controller2 = ControllerGet();
    final count = useState(0);

    final future = useMemoized(() => controller.getData(count.value), [count.value]);
    final future2 = useMemoized(() => controller2.getSecondData(count.value), [count.value]);

    final snapshot = useFuture(future);
    final snapshot2 = useFuture(future2);

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Hooks")),
      body: Center(
        child: snapshot.connectionState == ConnectionState.done || snapshot2.connectionState == ConnectionState.done
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!),
                  SizedBox(height: 15),
                  Text(snapshot2.data!),
                ],
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count.value++,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
