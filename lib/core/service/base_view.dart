import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:momentmaster/core/service/base_model.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.builder,
    this.onModelReady,
  });

  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  ) builder;
  final Function(T)? onModelReady;

  @override
  State<BaseView<T>> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    widget.onModelReady != null ? widget.onModelReady!(model) : null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
