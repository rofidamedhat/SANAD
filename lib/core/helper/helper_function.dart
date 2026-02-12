import 'package:flutter/material.dart';

List<T> handlePaginationResponse<T>({
  required List<T>? result,
  required List<T> currentList,
  required int currentPage,
}) {
  if (result == null) return currentList;
  if (currentList.isEmpty || currentPage == 1) {
    return result;
  } else {
    final List<T> res = result.where((e) => !currentList.contains(e)).toList();
    currentList.addAll(res);
    return currentList;
  }
}

void handleScrollListener({
  required ScrollController controller,
  required Function() function,
  required int currentPage,
  required int lastPage,
}) async {
  if (controller.position.pixels == controller.position.maxScrollExtent-200) {
    if (lastPage > currentPage) await function();
  }
}

void handleDisposeScrollController({
  required ScrollController controller,
  required Function() function,
}) {
  controller.removeListener(function);
  controller.dispose();
}
