import 'package:flutter/material.dart';

class AprovacaoPasswordField extends StatefulWidget {
  const AprovacaoPasswordField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.textFieldController,
    required this.validator,
    this.confirmation = false,
  }) : super(key: key);

  final String label;
  final String hintText;
  final TextEditingController textFieldController;
  final String Function(String?) validator;
  final bool confirmation;

  @override
  State<AprovacaoPasswordField> createState() => _AprovacaoPasswordFieldState();
}

class _AprovacaoPasswordFieldState extends State<AprovacaoPasswordField> {
  late ValueNotifier<String> errorController;
  late ValueNotifier<bool> showPasswordController;

  @override
  void initState() {
    errorController = ValueNotifier('');
    showPasswordController = ValueNotifier(false);

    super.initState();
  } 

  @override
  void dispose() {
    errorController.dispose();
    showPasswordController.dispose();

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
          builder: (context, error, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: showPasswordController,
                    builder: (context, showPassword, child) {
                      return TextFormField(
                        controller: widget.textFieldController,
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                        textCapitalization: TextCapitalization.none,
                        obscureText: !showPassword,
                        onChanged: (value) {
                          errorController.value = '';
                          return null;
                        },
                        validator: (value) {
                          errorController.value = widget.validator(value);
                          return errorController.value.isNotEmpty
                            ? ''
                            : null;
                        },
                        cursorColor: Color(0xFFFFFFFF),
                        cursorWidth: 1.0,
                        maxLength: 15,
                        buildCounter: (BuildContext context, {
                          currentLength = 0,
                          maxLength = 0,
                          isFocused = false,
                        }) => null,
                        textInputAction: widget.confirmation
                          ? TextInputAction.done
                          : TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          hintText: widget.hintText,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                showPasswordController.value = !showPassword;
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              icon: Icon(
                                showPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                                color: Color(0xFF8F8F8F),
                                size: 20.0,
                              ),
                            ),
                          ),
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFF6B6B6B)
                                : Color(0xFFC9453B),
                              width: 1.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFF6B6B6B)
                                : Color(0xFFC9453B),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFF6B6B6B)
                                : Color(0xFFC9453B),
                              width: 1.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFF6B6B6B)
                                : Color(0xFFC9453B),
                              width: 1.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFFFFFFFF)
                                : Color(0xFFC9453B),
                              width: error.isEmpty
                                ? 1.5
                                : 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: error.isEmpty
                                ? Color(0xFFFFFFFF)
                                : Color(0xFFC9453B),
                              width: error.isEmpty
                                ? 1.5
                                : 1.0,
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
                Visibility(
                  visible: error.isNotEmpty,
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
                            error,
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
