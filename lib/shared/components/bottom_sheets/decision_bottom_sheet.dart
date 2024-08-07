import 'package:dollar_dash/configs/app_colors.dart';
import 'package:flutter/material.dart';

class DecisionBottomSheet extends StatefulWidget {
  final String? title;
  final Color? titleTxtColor;
  final Widget? icon;
  final Widget? additionalField;
  final String? note;
  final String? confirmTxt;
  final String? cancelTxt;
  final Color? cancelTxtColor;
  final Color? cancelBtnColor;
  final Color? cancelBtnBorderColor;
  final Color? confirmTxtColor;
  final Color? confirmBtnColor;
  final Color? confirmBtnBorderColor;
  final bool? hasCancelBtn;

  const DecisionBottomSheet({
    this.title,
    this.note,
    this.icon,
    this.confirmTxt,
    this.cancelTxt,
    this.cancelBtnBorderColor,
    this.cancelBtnColor,
    this.cancelTxtColor,
    this.confirmBtnBorderColor,
    this.confirmBtnColor,
    this.confirmTxtColor,
    this.titleTxtColor,
    this.additionalField,
    this.hasCancelBtn,
    super.key,
  });

  @override
  State<DecisionBottomSheet> createState() => _DecisionBottomSheetState();
}

class _DecisionBottomSheetState extends State<DecisionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 8, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 24, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.title != null)
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 22,
                color: widget.titleTxtColor ?? AppColors.primaryColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
              ),
            ),
          if (widget.icon != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: widget.icon,
            ),
          if (widget.note != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.note!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textColorSecondary,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.additionalField != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: widget.additionalField,
            ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              if (widget.hasCancelBtn == null || widget.hasCancelBtn!)
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
                          backgroundColor: WidgetStateProperty.all(
                              widget.cancelBtnColor ?? AppColors.textColorSecondary),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: widget.cancelBtnBorderColor ?? const Color(0xffB3FA9A))))),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        widget.cancelTxt ?? "Cancel",
                        style: TextStyle(
                          color: widget.cancelTxtColor ?? Colors.white,
                          fontSize: 18,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
                      backgroundColor:
                          WidgetStateProperty.all(widget.confirmBtnColor ?? AppColors.primaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: widget.confirmBtnBorderColor ?? AppColors.primaryColor)))),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    widget.confirmTxt ?? "Confirm",
                    style: TextStyle(
                      color: widget.confirmTxtColor ?? Colors.black,
                      fontSize: 18,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}