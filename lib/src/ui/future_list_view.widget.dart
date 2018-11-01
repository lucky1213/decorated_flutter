import 'package:flutter/material.dart';
import 'package:framework/framework.dart';

typedef Widget _ItemBuilder<T>(BuildContext context, T data);

class FutureListView<T> extends StatelessWidget {
  const FutureListView({
    Key key,
    @required this.future,
    @required this.itemBuilder,
    this.shrinkWrap = true,
    this.showLoading = true,
    this.initialData = const [],
    this.emptyWidget,
    this.errorWidget,
    this.padding = const EdgeInsets.all(kSpaceLittleBig),
    this.physics = const ClampingScrollPhysics(),
  }) : super(key: key);

  //region FutureWidget
  final Future<List<T>> future;
  final bool showLoading;
  final List<T> initialData;
  final Widget emptyWidget;
  final Widget errorWidget;
  //endregion
  //region ListView.builder
  final _ItemBuilder itemBuilder;
  final bool shrinkWrap;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  //endregion

  @override
  Widget build(BuildContext context) {
    return FutureWidget<List<T>>(
      future: future,
      showLoading: showLoading,
      initialData: initialData,
      emptyWidget: emptyWidget,
      errorWidget: errorWidget,
      builder: (data) {
        return ListView.builder(
          padding: padding,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) => itemBuilder(context, data[index]),
        );
      },
    );
  }
}