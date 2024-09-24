import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_horizontal_spacer_30.dart';
import 'package:listdetaillayout/components/app_vertical_spacer_20.dart';
import 'package:listdetaillayout/components/app_vertical_spacer_30.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/details_view_form/details_view_form_close_button.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/details_view_form/details_view_form_text_field.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/details_view_form/details_view_form_validator.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayout/view_models/update_list_item_viewmodel.dart';

class DetailsViewForm extends StatefulWidget {
  final ListItemDetailsViewModel detailViewViewModel;

  const DetailsViewForm({super.key, required this.detailViewViewModel});

  @override
  State<DetailsViewForm> createState() => _DetailsViewFormState();
}

class _DetailsViewFormState extends State<DetailsViewForm> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController labelController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late final CommonStateDto commonState;

  late bool isAddMode;
  late bool isReadOnly;

  @override
  void initState() {
    super.initState();

    isAddMode = widget.detailViewViewModel.id == null;
    isReadOnly = !isAddMode;

    labelController =
        TextEditingController(text: widget.detailViewViewModel.title);
    usernameController =
        TextEditingController(text: widget.detailViewViewModel.username);
    passwordController =
        TextEditingController(text: widget.detailViewViewModel.password);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('_AppFormSaveButtonState: didChangeDependencies()');
    commonState = CommonStateDto(
      detailsViewState: context.detailsViewState,
      listViewItemsState: context.listViewItemsState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      listViewSelectedItemState: context.listViewSelectedItemState,
    );
  }

  @override
  void dispose() {
    labelController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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

    isAddMode = widget.detailViewViewModel.id == null;
    if (isAddMode) {
      isReadOnly = !isAddMode;
      labelController =
          TextEditingController(text: widget.detailViewViewModel.title);
      usernameController =
          TextEditingController(text: widget.detailViewViewModel.username);
      passwordController =
          TextEditingController(text: widget.detailViewViewModel.password);
    }

    return Center(
      child: SizedBox(
        width: theme_data.maxFormWidth,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isReadOnly)
                  Text(widget.detailViewViewModel.title,
                      style: Theme.of(context).textTheme.titleLarge),
                if (!isReadOnly)
                  DetailsViewFormTextField(
                    icon: null,
                    label: null,
                    text: widget.detailViewViewModel.title,
                    isReadOnly: isReadOnly,
                    isHiddenText: false,
                    isVisibilityButtonShown: false,
                    isCopyButtonShown: false,
                    controller: labelController,
                    validator: DetailsViewFormValidator.validateTitle,
                  ),
                const AppVerticalSpacer30(),
                DetailsViewFormTextField(
                  icon: Icons.person,
                  label: 'Username',
                  text: widget.detailViewViewModel.username,
                  isReadOnly: isReadOnly,
                  isHiddenText: false,
                  isVisibilityButtonShown: false,
                  isCopyButtonShown: isReadOnly,
                  controller: usernameController,
                  validator: DetailsViewFormValidator.validateUsername,
                ),
                const AppVerticalSpacer30(),
                DetailsViewFormTextField(
                  icon: Icons.key_outlined,
                  label: 'Password',
                  text: widget.detailViewViewModel.password,
                  isReadOnly: isReadOnly,
                  isHiddenText: isReadOnly,
                  isVisibilityButtonShown: isReadOnly,
                  isCopyButtonShown: isReadOnly,
                  controller: passwordController,
                  validator: DetailsViewFormValidator.validatePassword,
                ),
                const AppVerticalSpacer30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isReadOnly || isAddMode)
                      const Flexible(
                        child: const DetailsViewFormCloseButton(),
                      ),
                    if (!isReadOnly && !isAddMode)
                      Flexible(
                        child: ElevatedButton(
                          onPressed: setReadMode,
                          child: const Text('Cancel'),
                        ),
                      ),
                    const Flexible(
                      child: const AppHorizontalSpacer30(),
                    ),
                    if (isReadOnly && !isAddMode)
                      Flexible(
                        child: FilledButton(
                          onPressed: setEditMode,
                          child: const Text('Update'),
                        ),
                      ),
                    if (!isReadOnly)
                      Flexible(
                        child: FilledButton(
                          onPressed: () async {
                            if (isAddMode) {
                              if (formKey.currentState!.validate()) {
                                final createNewListItemViewModel =
                                    CreateNewListItemViewModel(
                                  title: labelController.text,
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );

                                await listDetailLayoutService.createNewItem(
                                  createNewListItemViewModel,
                                  commonState,
                                );
                              }
                            } else {
                              if (formKey.currentState!.validate()) {
                                final updateListItemViewModel =
                                    UpdateListItemViewModel(
                                  id: widget.detailViewViewModel.id!,
                                  title: labelController.text,
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );

                                await listDetailLayoutService.updateItem(
                                  updateListItemViewModel,
                                  commonState,
                                );
                              }
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                  ],
                ),
                const AppVerticalSpacer20()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
