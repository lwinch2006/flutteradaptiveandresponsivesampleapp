import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_horizontal_spacer_30.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_vertical_spacer_20.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_vertical_spacer_30.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/details_view_form/details_view_form_close_button.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/details_view_form/details_view_form_text_field.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/details_view_form/details_view_form_validator.dart';
import 'package:listdetaillayoutwithcubit/routes.dart' as routes;
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';
import 'package:listdetaillayoutwithcubit/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/update_list_item_viewmodel.dart';

class DetailsViewForm extends StatefulWidget {
  final ListItemDetailsViewModel detailViewViewModel;

  const DetailsViewForm({super.key, required this.detailViewViewModel});

  @override
  State<DetailsViewForm> createState() => _DetailsViewFormState();
}

class _DetailsViewFormState extends State<DetailsViewForm> {
  final formKey = GlobalKey<FormState>();
  late final AppCubit appCubit;
  late final ListDetailLayoutCubit listDetailLayoutCubit;
  late TextEditingController labelController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  final FocusNode labelFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode usernameDisabledFocusNode = FocusNode(canRequestFocus: false);
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordDisabledFocusNode = FocusNode(canRequestFocus: false);
  final FocusNode saveButtonFocusNode = FocusNode();

  late bool isAddMode;
  late bool isReadOnly;

  @override
  void initState() {
    super.initState();

    isAddMode = widget.detailViewViewModel.id == null;
    isReadOnly = !isAddMode;

    appCubit = context.read<AppCubit>();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();

    labelController =
        TextEditingController(text: widget.detailViewViewModel.title);
    usernameController =
        TextEditingController(text: widget.detailViewViewModel.username);
    passwordController =
        TextEditingController(text: widget.detailViewViewModel.password);
  }

  @override
  void dispose() {
    labelController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    labelFocusNode.dispose();
    usernameFocusNode.dispose();
    usernameDisabledFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordDisabledFocusNode.dispose();
    saveButtonFocusNode.dispose();

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

  void fieldFocusChange(FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isReadOnly)
                    Text(widget.detailViewViewModel.title,
                        style: Theme.of(context).textTheme.titleLarge),
                  if (!isReadOnly)
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(1),
                      child: DetailsViewFormTextField(
                        icon: null,
                        label: context.l10n.textFormFieldTitle,
                        text: widget.detailViewViewModel.title,
                        isReadOnly: isReadOnly,
                        isHiddenText: false,
                        isVisibilityButtonShown: false,
                        isCopyButtonShown: false,
                        controller: labelController,
                        focusNode: labelFocusNode,
                        nextFocusNode: usernameFocusNode,
                        validator: DetailsViewFormValidator.validateTitle,
                      ),
                    ),
                  const AppVerticalSpacer30(),
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(2),
                    child: Focus(
                      focusNode: usernameDisabledFocusNode,
                      descendantsAreFocusable: !isReadOnly,
                      descendantsAreTraversable: !isReadOnly,
                      skipTraversal: isReadOnly,
                      child: DetailsViewFormTextField(
                        icon: Icons.person,
                        label: context.l10n.textFormFieldUsername,
                        text: widget.detailViewViewModel.username,
                        isReadOnly: isReadOnly,
                        isHiddenText: false,
                        isVisibilityButtonShown: false,
                        isCopyButtonShown: isReadOnly,
                        controller: usernameController,
                        focusNode: !isReadOnly ? usernameFocusNode : null,
                        nextFocusNode: !isReadOnly ? passwordFocusNode : null,
                        validator: DetailsViewFormValidator.validateUsername,
                      ),
                    ),
                  ),
                  const AppVerticalSpacer30(),
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(3),
                    child: Focus(
                      focusNode: passwordDisabledFocusNode,
                      descendantsAreFocusable: !isReadOnly,
                      descendantsAreTraversable: !isReadOnly,
                      skipTraversal: isReadOnly,
                      child: DetailsViewFormTextField(
                        icon: Icons.key_outlined,
                        label: context.l10n.textFormFieldPassword,
                        text: widget.detailViewViewModel.password,
                        isReadOnly: isReadOnly,
                        isHiddenText: isReadOnly,
                        isVisibilityButtonShown: isReadOnly,
                        isCopyButtonShown: isReadOnly,
                        controller: passwordController,
                        focusNode: !isReadOnly ? passwordFocusNode : null,
                        nextFocusNode: !isReadOnly ? saveButtonFocusNode : null,
                        validator: DetailsViewFormValidator.validatePassword,
                      ),
                    ),
                  ),
                  const AppVerticalSpacer30(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isReadOnly || isAddMode)
                        const FocusTraversalOrder(
                          order: NumericFocusOrder(4),
                          child: Flexible(
                            child: DetailsViewFormCloseButton(),
                          ),
                        ),
                      if (!isReadOnly && !isAddMode)
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(4),
                          child: Flexible(
                            child: ElevatedButton(
                              onPressed: setReadMode,
                              child: Text(context.l10n.buttonCancel),
                            ),
                          ),
                        ),
                      const Flexible(
                        child: const AppHorizontalSpacer30(),
                      ),
                      if (isReadOnly && !isAddMode)
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(5),
                          child: Flexible(
                            child: FilledButton(
                              onPressed: setEditMode,
                              child: Text(context.l10n.buttonUpdate),
                            ),
                          ),
                        ),
                      if (!isReadOnly)
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(5),
                          child: Flexible(
                            child: FilledButton(
                              focusNode: saveButtonFocusNode,
                              onPressed: () async {
                                if (isAddMode) {
                                  if (formKey.currentState!.validate()) {
                                    final createNewListItemViewModel =
                                        CreateNewListItemViewModel(
                                      title: labelController.text,
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );

                                    await listDetailLayoutCubit.createNewItem(
                                        createNewListItemViewModel);

                                    appCubit.onNavigationDestinationSelected(
                                        routes.listDetailLayoutPageIndex);
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

                                    await listDetailLayoutCubit
                                        .updateItem(updateListItemViewModel);
                                  }
                                }
                              },
                              child: Text(context.l10n.buttonSave),
                            ),
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
      ),
    );
  }
}
