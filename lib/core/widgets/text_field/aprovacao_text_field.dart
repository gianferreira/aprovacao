import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AprovacaoTextFormField extends StatefulWidget {
  const AprovacaoTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textFieldController,
    required this.validator,
    this.inputFormatters = const [],
    this.prefixWidget,
    this.focus,
    this.onSave,
    this.maxLength,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final TextEditingController textFieldController;
  final String Function(String?) validator;
  final Widget? prefixWidget;
  final FocusNode? focus;
  final int? maxLength;  
  final TextCapitalization textCapitalization;
  final bool enabled;
  final void Function()? onSave;

  @override
  State<AprovacaoTextFormField> createState() => _AprovacaoTextFormFieldState();
}

class _AprovacaoTextFormFieldState extends State<AprovacaoTextFormField> {
  late ValueNotifier<String> errorController;

  @override
  void initState() {
    errorController = ValueNotifier('');

    super.initState();
  } 

  @override
  void dispose() {
    errorController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF1F1F1),
            ),
          ),
        ),
        ValueListenableBuilder<String>(
          valueListenable: errorController,
          builder: (context, state, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: TextFormField(
                    enabled: widget.enabled,
                    controller: widget.textFieldController,
                    focusNode: widget.focus,
                    style: TextStyle(
                      fontFamily: 'MyriadProRegular',
                      height: 1.2,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                    ),
                    maxLength: widget.maxLength ?? null,
                    buildCounter: (BuildContext context, {
                      currentLength = 0,
                      maxLength = 0,
                      isFocused = false,
                    }) => null,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                    textInputAction: widget.textInputAction,
                    validator: (value) {
                      errorController.value = widget.validator(value);
                      return errorController.value.isNotEmpty
                        ? ''
                        : null;
                    },
                    onChanged: (value) {
                      errorController.value = '';
                      return null;
                    },
                    onEditingComplete: widget.onSave,
                    cursorColor: Color(0xFFFFFFFF),
                    cursorWidth: 1.0,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF0B1C40),
                      contentPadding: const EdgeInsets.all(16.0),
                      hintText: widget.hintText,
                      prefixIcon: widget.prefixWidget,
                      enabled: widget.enabled,
                      hintStyle: TextStyle(
                        fontFamily: 'MyriadProRegular',
                        height: 1.2,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8F8F8F),
                      ),
                      errorStyle: TextStyle(
                        fontFamily: 'MyriadProRegular',
                        height: 0.2,
                        fontSize: 0.5,
                        color: Colors.transparent,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: state.isEmpty
                            ? Color(0xFF6B6B6B)
                            : Color(0xFFC9453B),
                          width: 1.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: state.isEmpty
                            ? Color(0xFF6B6B6B)
                            : Color(0xFFC9453B),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: state.isEmpty
                            ? Color(0xFF6B6B6B)
                            : Color(0xFFC9453B),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: state.isEmpty
                            ? Color(0xFFFFFFFF)
                            : Color(0xFFC9453B),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state.isNotEmpty,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 4.0,
                          bottom: 8.0,
                        ),
                        child: Icon(
                          Icons.error,
                          color: Color(0xFFC9453B),
                          size: 18.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: Text(
                            state,
                            style: TextStyle(
                              fontFamily: 'MyriadProRegular',
                              height: 1.2,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9453B),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                )
              ],
            );
          }
        ),
      ],
    );
  }
}
