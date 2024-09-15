import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_form/app_form_close_button.dart';
import 'package:listdetaillayout/components/app_form/app_form_save_button.dart';
import 'package:listdetaillayout/components/app_form/app_text_form_field.dart';
import 'package:listdetaillayout/components/app_horizontal_spacer.dart';
import 'package:listdetaillayout/components/app_vertical_spacer.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

class AppForm extends StatefulWidget {
  final DetailViewViewModel detailViewViewModel;

  const AppForm({super.key, required this.detailViewViewModel});

  @override
  State<AppForm> createState() => _AppFormState(
        isAddMode: detailViewViewModel.itemId == null,
      );
}

class _AppFormState extends State<AppForm> {
  final bool isAddMode;
  late bool isReadOnly;

  _AppFormState({required this.isAddMode}) {
    isReadOnly = !isAddMode;
  }

  void setEditMode() {
    setState(() {
      isReadOnly = false;
    });
  }

  void setReadMode() {
    setState(() {
      isReadOnly = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppForm: build()');
    return Center(
      child: SizedBox(
        width: theme_data.formWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.detailViewViewModel.itemTitle,
                style: Theme.of(context).textTheme.titleLarge),
            const AppVerticalSpacer(),
            AppTextFormField(
                icon: Icons.person,
                label: 'Username',
                text: widget.detailViewViewModel.username,
                isReadOnly: isReadOnly,
                isHiddenText: false,
                isVisibilityButtonShown: false),
            const AppVerticalSpacer(),
            AppTextFormField(
              icon: Icons.key_outlined,
              label: 'Password',
              text: widget.detailViewViewModel.password,
              isReadOnly: isReadOnly,
              isHiddenText: isReadOnly,
              isVisibilityButtonShown: isReadOnly,
            ),
            const AppVerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isReadOnly || isAddMode) const AppFormCloseButton(),
                if (!isReadOnly && !isAddMode)
                  ElevatedButton(
                    onPressed: setReadMode,
                    child: const Text('Cancel'),
                  ),
                const AppHorizontalSpacer(),
                if (isReadOnly && !isAddMode)
                  FilledButton(
                    onPressed: setEditMode,
                    child: const Text('Update'),
                  ),
                if (!isReadOnly)
                  AppFormSaveButton(
                    isAddMode: isAddMode,
                    detailViewViewModel: widget.detailViewViewModel,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
