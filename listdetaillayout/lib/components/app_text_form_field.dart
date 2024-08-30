import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listdetaillayout/components/app_snack_bar.dart';

class AppTextFormField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String text;
  final bool isReadOnly;
  final bool isVisibilityButtonShown;
  final bool isHiddenText;

  const AppTextFormField({
    super.key,
    required this.icon,
    required this.label,
    required this.text,
    required this.isReadOnly,
    required this.isHiddenText,
    required this.isVisibilityButtonShown,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool isHiddenText;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    isHiddenText = widget.isHiddenText;
    textEditingController = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: widget.isReadOnly,
      obscureText: isHiddenText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        icon: Icon(widget.icon),
        labelText: widget.label,
        suffixIcon: widget.isVisibilityButtonShown
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
                          ClipboardData(text: textEditingController.text));

                      ScaffoldMessenger.of(context).showSnackBar(
                          AppSnackBar(content: '${widget.label} copied'));
                    },
                    icon: const Icon(Icons.copy_outlined),
                  ),
                ],
              )
            : IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                      ClipboardData(text: textEditingController.text));

                  ScaffoldMessenger.of(context).showSnackBar(
                      AppSnackBar(content: '${widget.label} copied'));
                },
                icon: const Icon(Icons.copy_outlined),
              ),
      ),
    );
  }
}
