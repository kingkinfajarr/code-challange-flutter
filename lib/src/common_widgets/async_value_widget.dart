import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/common_widgets/lottie_widget.dart';
import 'package:flutter_transisi/src/exceptions/network_exceptions.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  }) : super(key: key);

  final AsyncValue<T> value;

  final Widget Function(T data) data;

  final Widget Function()? loading;

  final Widget Function(Object error, StackTrace stacktrace)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: loading ?? () => const CircularProgressIndicator(),
      error: error ??
          (e, __) {
            return Text(
              NetworkExceptions.getErrorMessage(
                e as NetworkExceptions,
              ),
            );
            // LottieWidget(
            //   assets: Resources.lottieError,
            //   description: NetworkExceptions.getErrorMessage(
            //     e as NetworkExceptions,
            //   ),
            // );
          },
    );
  }
}
