import 'package:flutter/material.dart';
import 'package:great_form/great_form.dart';
import 'package:great_form/ui/form_field/great_form_field.dart';

/// [ScrollableForm] is a [GreatForm] but with the ability to be scrollable
/// 2 factory constructors [ScrollableForm.vertical] and [ScrollableForm.horizontal] define [isVertical] parameter
class ScrollableForm extends StatefulWidget implements GreatForm {
  /// [ScrollableForm] constructor
  const ScrollableForm({
    super.key,
    required this.builder,
    required this.childCount,
    required this.isVertical,
    this.gap,
    this.fields = const [],
    this.constraints,
  });

  /// [builder] is a function that returns a [GreatFormField] with the index of the field
  final GreatFormField Function(BuildContext context, int index) builder;

  /// [childCount] is the amount of fields to be displayed
  final int childCount;

  /// [isVertical] is the direction of the scroll
  final bool isVertical;

  /// [gap] is the space between the fields
  @override
  final double? gap;

  /// [fields] is the list of fields in a form
  @override
  final List<GreatFormField> fields;

  /// [constraints] is the constraints of the form
  final BoxConstraints? constraints;

  /// [ScrollableForm.vertical] factory constructor
  /// Vertical scroll with [builder] function, [childCount] amount of fields, [gap] space between fields, [constraints] of the form
  factory ScrollableForm.vertical({
    required GreatFormField Function(BuildContext context, int index) builder,
    double? gap,
    required int childCount,
    BoxConstraints? constraints,
  }) =>
      ScrollableForm(
        builder: builder,
        childCount: childCount,
        isVertical: true,
        gap: gap,
        constraints: constraints,
      );

  /// [ScrollableForm.horizontal] factory constructor
  /// Horizontal scroll with [builder] function, [childCount] amount of fields, [gap] space between fields, [constraints] of the form
  factory ScrollableForm.horizontal({
    required GreatFormField Function(BuildContext context, int index) builder,
    double? gap,
    required int childCount,
    BoxConstraints? constraints,
  }) =>
      ScrollableForm(
        builder: builder,
        childCount: childCount,
        isVertical: false,
        gap: gap,
        constraints: constraints,
      );

  @override
  State<ScrollableForm> createState() => _ScrollableFormState();
}

class _ScrollableFormState extends State<ScrollableForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ConstrainedBox(
      constraints: widget.constraints ?? const BoxConstraints(),
      child: Form(
          key: formKey,
          child: ListView.separated(
            scrollDirection: widget.isVertical ? Axis.vertical : Axis.horizontal,
            itemBuilder: widget.builder,
            separatorBuilder: (_, __) => SizedBox(width: widget.gap ?? 10, height: widget.gap ?? 10),
            itemCount: widget.childCount,
          )),
    );
  }
}
