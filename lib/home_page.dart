import 'package:flutter/material.dart';
import 'package:study_flutter/change_notifier_provider/change_notifier_page.dart';
import 'package:study_flutter/future_provider/future_provider_page.dart';
import 'package:study_flutter/provider/provider_page.dart';
import 'package:study_flutter/state_notifier_provider/state_notifier_page.dart';
import 'package:study_flutter/state_provider/state_provider_page.dart';
import 'package:study_flutter/stream_provider/stream_provider_page.dart';
import 'package:study_flutter/re_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Explorer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderPage(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              },
              text: 'Provider',
            ),
            const SizedBox(
              height: 10,
            ),
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateProviderPage(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                );
              },
              text: 'State Provider',
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 10,
            ),
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureProviderPage(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                );
              },
              text: 'Future Provider',
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              height: 10,
            ),
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamProviderPage(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              },
              text: 'Stream Provider',
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(
              height: 10,
            ),
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProviderPage(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                );
              },
              text: 'Change Notifier Provider',
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(
              height: 10,
            ),
            ReButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateNotifierProviderPage(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                );
              },
              text: 'State Notifier Provider',
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
