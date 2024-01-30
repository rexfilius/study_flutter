import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/pages/infinite_scroll/api_req.dart';

class InfiniteScrollPage extends HookConsumerWidget {
  const InfiniteScrollPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beersValue = ref.watch(paginatorProvider);
    final beerList = beersValue.value ?? [];
    final isInitialLoading = beersValue.isLoading && beerList.isEmpty;
    //
    final controller = useScrollController();
    final hasMore = ref.watch(hasMoreProvider);
    final isFetchingMore = beersValue.isLoading && beerList.isNotEmpty;
    //
    void onScroll() {
      final bool isBottom =
          controller.offset >= controller.position.maxScrollExtent &&
              !controller.position.outOfRange;
      if (isBottom && hasMore && !isFetchingMore) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(paginatorProvider.notifier).fetchMore();
        });
      }
    }

    //
    useEffect(() {
      controller.addListener(onScroll);
      return () => controller.removeListener(onScroll);
    });
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('LENGTH ${globalBeerList.length}'),
      ),
      body: isInitialLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              // itemCount:
              //     globalBeerList.length + (!hasMore || isFetchingMore ? 1 : 0),
              itemCount: globalBeerList.length,
              itemBuilder: (context, index) {
                if (beerList.length == index) {
                  if (isFetchingMore) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (!hasMore) {
                    return const Text('End of list');
                  } else {
                    return Container();
                  }
                }
                final beer = globalBeerList[index];
                return ListTile(
                  title: Text(beer.name ?? 'n/a'),
                  subtitle: Text(beer.tagline ?? 'n/a'),
                  trailing: Text("${beer.id}"),
                );
              },
            ),
    );
  }
}
