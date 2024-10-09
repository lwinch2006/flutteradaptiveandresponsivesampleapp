import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';

class DetailsViewFormCloseButton extends StatefulWidget {
  const DetailsViewFormCloseButton({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsViewFormCloseButtonState();
}

class _DetailsViewFormCloseButtonState
    extends State<DetailsViewFormCloseButton> {
  late final ListDetailLayoutCubit listDetailLayoutCubit;

  @override
  void initState() {
    super.initState();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppFormCloseButton: build()');
    return ElevatedButton(
      onPressed: () => listDetailLayoutCubit.closeItemDetails(),
      child: const Text('Close'),
    );
  }
}
