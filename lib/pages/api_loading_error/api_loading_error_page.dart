import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/pages/api_loading_error/api_endpoint.dart';
import 'package:study_flutter/pages/api_loading_error/show_error_dialog.dart';
import 'package:study_flutter/routes/app_routes.dart';
import 'package:study_flutter/utils/loading_screen.dart';

class ApiLoadingErrorPage extends HookConsumerWidget {
  const ApiLoadingErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      apiNotifierProvider,
      (previous, next) {
        if (next.isLoading) {
          LoadingScreen.instance().show(context: context);
        }
        if (next.error != null) {
          LoadingScreen.instance().hide();
          shoWErrorDialog(context: context);
        }
        if (next.asData?.value != null) {
          LoadingScreen.instance().hide();
          Navigator.of(context).pushNamed(RouteName.apiSuccess);
        }
      },
    );
    //
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                ref.read(apiNotifierProvider.notifier).callApi();
              },
              child: const Text('Call API'),
            ),
          ),
        ],
      ),
    );
  }
}
