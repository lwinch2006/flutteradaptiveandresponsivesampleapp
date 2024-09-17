import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_form/app_form_close_button.dart';
import 'package:listdetaillayout/components/app_form/app_form_validator.dart';
import 'package:listdetaillayout/components/app_form/app_text_form_field.dart';
import 'package:listdetaillayout/components/app_horizontal_spacer.dart';
import 'package:listdetaillayout/components/app_vertical_spacer.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';

class AppForm extends StatefulWidget {
  final ListItemDetailsViewModel detailViewViewModel;

  const AppForm({super.key, required this.detailViewViewModel});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
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
        width: theme_data.formWidth,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isReadOnly)
                Text(widget.detailViewViewModel.title,
                    style: Theme.of(context).textTheme.titleLarge),
              if (!isReadOnly)
                AppTextFormField(
                  icon: null,
                  label: null,
                  text: widget.detailViewViewModel.title,
                  isReadOnly: isReadOnly,
                  isHiddenText: false,
                  isVisibilityButtonShown: false,
                  isCopyButtonShown: false,
                  controller: labelController,
                  validator: AppFormValidator.validateLabel,
                ),
              const AppVerticalSpacer(),
              AppTextFormField(
                icon: Icons.person,
                label: 'Username',
                text: widget.detailViewViewModel.username,
                isReadOnly: isReadOnly,
                isHiddenText: false,
                isVisibilityButtonShown: false,
                isCopyButtonShown: isReadOnly,
                controller: usernameController,
                validator: AppFormValidator.validateUsername,
              ),
              const AppVerticalSpacer(),
              AppTextFormField(
                icon: Icons.key_outlined,
                label: 'Password',
                text: widget.detailViewViewModel.password,
                isReadOnly: isReadOnly,
                isHiddenText: isReadOnly,
                isVisibilityButtonShown: isReadOnly,
                isCopyButtonShown: isReadOnly,
                controller: passwordController,
                validator: AppFormValidator.validatePassword,
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
                    FilledButton(
                      onPressed: () async {
                        final detailViewViewModel = ListItemDetailsViewModel(
                          id: widget.detailViewViewModel.id,
                          title: labelController.text,
                          username: usernameController.text,
                          password: passwordController.text,
                        );

                        if (isAddMode) {
                          final createNewListItemViewModel =
                              ListDetailLayoutMapper
                                  .MapToCreateNewListItemViewModel(
                                      detailViewViewModel)!;

                          await listDetailLayoutService.createNewItem(
                            createNewListItemViewModel,
                            commonState,
                          );
                        } else {
                          final updateListItemViewModel = ListDetailLayoutMapper
                              .MapToUpdateListItemViewModel(
                                  detailViewViewModel)!;

                          await listDetailLayoutService.updateItem(
                            updateListItemViewModel,
                            commonState,
                          );
                        }
                      },
                      child: const Text('Save'),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
