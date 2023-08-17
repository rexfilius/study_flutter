import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/pages/api_loading_error/api_endpoint.dart';
import 'package:study_flutter/pages/api_loading_error/show_api_dialog.dart';
import 'package:study_flutter/utils/loading_screen.dart';

class ApiLoadingErrorPage extends HookConsumerWidget {
  const ApiLoadingErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    //
    // ref.listen(
    //   loginUserApiProvider,
    //   (previous, next) {
    //     if (next.isLoading) {
    //       LoadingScreen.instance().show(context: context);
    //     }
    //     if (next.error != null) {
    //       LoadingScreen.instance().hide();
    //       print("ERROR => ${next.error}");
    //       showApiDialog(
    //         context: context,
    //         actionText: 'Dismiss',
    //         title: 'An error occured',
    //       );
    //     } else if (next.asData?.value != null) {
    //       //
    //       LoadingScreen.instance().hide();
    //       showApiDialog(
    //         context: context,
    //         actionText: 'Okay',
    //         title: 'Success',
    //       );
    //     }
    //   },
    // );
    ref.listen(
      loginUserApiProvider,
      (_, state) {
        state.when(
          data: (data) {
            LoadingScreen.instance().hide();
            showApiDialog(
              context: context,
              actionText: 'Okay',
              title: 'Success => $data',
            );
          },
          error: (error, stackTrace) {
            LoadingScreen.instance().hide();
            showApiDialog(
              context: context,
              actionText: 'Dismiss',
              title: 'An error occured => ${error.toString()}',
            );
          },
          loading: () {
            LoadingScreen.instance().show(context: context);
          },
        );
      },
    );
    //
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: surnameController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //ref.read(apiNotifierProvider.notifier).callApi();
                  ref.read(loginUserApiProvider.notifier).login(
                        name: nameController.text,
                        surname: surnameController.text,
                      );
                },
                child: const Text('Call API'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
