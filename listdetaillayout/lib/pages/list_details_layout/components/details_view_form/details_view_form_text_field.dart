import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listdetaillayout/components/app_snack_bar.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class DetailsViewFormTextField extends StatefulWidget {
  final IconData? icon;
  final String? label;
  final String text;
  final bool isReadOnly;
  final bool isVisibilityButtonShown;
  final bool isCopyButtonShown;
  final bool isHiddenText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const DetailsViewFormTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.text,
    required this.isReadOnly,
    required this.isHiddenText,
    required this.isVisibilityButtonShown,
    required this.isCopyButtonShown,
    required this.controller,
    required this.validator,
  });

  @override
  State<DetailsViewFormTextField> createState() =>
      _DetailsViewFormTextFieldState();
}

class _DetailsViewFormTextFieldState extends State<DetailsViewFormTextField> {
  late bool isHiddenText;

  @override
  void initState() {
    super.initState();
    isHiddenText = widget.isHiddenText;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppTextFormField: build()');
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.isReadOnly,
      obscureText:
          widget.isVisibilityButtonShown ? isHiddenText : widget.isHiddenText,
      decoration: InputDecoration(
        fillColor: theme_data.textFieldEnabledColor,
        filled: !widget.isReadOnly,
        border: const OutlineInputBorder(),
        icon: Icon(widget.icon),
        labelText: widget.label,
        suffixIcon: widget.isVisibilityButtonShown && widget.isCopyButtonShown
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isHiddenText = !isHiddenText;
                      });
                    },
                    icon: isHiddenText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.controller.text));

                      ScaffoldMessenger.of(context).showSnackBar(
                          AppSnackBar(content: '${widget.label} copied'));
                    },
                    icon: const Icon(Icons.copy_outlined),
                  ),
                ],
              )
            : widget.isVisibilityButtonShown
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isHiddenText = !isHiddenText;
                      });
                    },
                    icon: isHiddenText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  )
                : widget.isCopyButtonShown
                    ? IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.controller.text));

                          ScaffoldMessenger.of(context).showSnackBar(
                              AppSnackBar(content: '${widget.label} copied'));
                        },
                        icon: const Icon(Icons.copy_outlined),
                      )
                    : null,
      ),
    );
  }
}
