import 'package:flutter/material.dart';
import 'package:great_form/form_field/great_form_field.dart';
import 'package:great_form/great_form.dart';

/// [ScrollableForm] is a [GreatForm] but with the ability to be scrollable
/// 2 factory constructors [ScrollableForm.vertical] and [ScrollableForm.horizontal] define [isVertical] parameter
class ScrollableForm extends StatefulWidget implements GreatForm {
  const ScrollableForm({
    super.key,
    required this.builder,
    required this.childCount,
    required this.isVertical,
    this.gap,
    this.fields = const [],
  });

  final GreatFormField Function(BuildContext context, int index) builder;
  final int childCount;
  final bool isVertical;
  @override
  final double? gap;
  @override
  final List<GreatFormField> fields;

  factory ScrollableForm.vertical({
    required GreatFormField Function(BuildContext context, int index) builder,
    double? gap,
    required int childCount,
  }) =>
      ScrollableForm(builder: builder, childCount: childCount, isVertical: true, gap: gap);

  factory ScrollableForm.horizontal({
    required GreatFormField Function(BuildContext context, int index) builder,
    double? gap,
    required int childCount,
  }) =>
      ScrollableForm(builder: builder, childCount: childCount, isVertical: false, gap: gap);

  @override
  State<ScrollableForm> createState() => _ScrollableFormState();
}

class _ScrollableFormState extends State<ScrollableForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: ListView.separated(
          scrollDirection: widget.isVertical ? Axis.vertical : Axis.horizontal,
          itemBuilder: widget.builder,
          separatorBuilder: (_, __) => SizedBox(width: widget.gap ?? 10, height: widget.gap ?? 10),
          itemCount: widget.childCount,
        ));
  }
}
