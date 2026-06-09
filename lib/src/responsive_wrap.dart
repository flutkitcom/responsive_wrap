import 'package:flutter/material.dart';

/// A responsive, flexible wrap-based layout widget that adapts to screen width.
class ResponsiveWrap extends StatelessWidget {
  /// Widgets to display in the layout
  final List<Widget> children;

  /// Spacing between items horizontally
  final double spacing;

  /// Spacing between items vertically
  final double runSpacing;

  /// Maximum column count (if not using breakpoints)
  final int? maxColumns;

  /// Minimum column count
  final int? minColumns;

  /// Custom column ratios (e.g., [0.5, 0.3, 0.2])
  final List<double>? columnRatios;

  /// Breakpoints mapping (e.g. `{600: 1, 1000: 2, 1400: 3}`)
  final Map<double, int>? breakpoints;

  /// Main axis alignment of items
  final WrapAlignment alignment;

  /// Cross axis alignment of items
  final WrapCrossAlignment crossAlignment;

  /// Callback triggered when column count changes
  final void Function(int columnCount)? onLayoutChanged;

  // Use screen width as breakpoint
  final bool useScreenWidth;

  const ResponsiveWrap({
    super.key,
    required this.children,
    this.spacing = 16,
    this.runSpacing = 16,
    this.maxColumns,
    this.minColumns,
    this.columnRatios,
    this.breakpoints,
    this.alignment = WrapAlignment.start,
    this.crossAlignment = WrapCrossAlignment.start,
    this.onLayoutChanged,
    this.useScreenWidth = false,
  });

  int _getColumnCount(double width) {
    if (breakpoints != null && breakpoints!.isNotEmpty) {
      final sorted = breakpoints!.entries.toList()
        ..sort((a, b) => a.key.compareTo(b.key));
      for (final bp in sorted) {
        if (width <= bp.key) return bp.value;
      }
      return sorted.last.value;
    }
    return maxColumns ?? columnRatios?.length ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. Determine the reference width ONLY to calculate the number of columns (Breakpoint Logic)
        final breakpointWidth = useScreenWidth
            ? MediaQuery.of(context).size.width
            : constraints.maxWidth;

        int columnCount = _getColumnCount(breakpointWidth);

        if (minColumns != null && columnCount < minColumns!) {
          columnCount = minColumns!;
        }

        // Call the callback if there is a layout change
        onLayoutChanged?.call(columnCount);

        // 2. Determine the available physical width based on parent constraints (Layout Logic)
        // CORRECTION: Always use constraints.maxWidth to render widgets,
        // regardless of which breakpoint is being used.
        final layoutWidth = constraints.maxWidth;

        final totalSpacing = spacing * (columnCount - 1);
        final availableWidth = layoutWidth - totalSpacing;

        // --- Ratio Calculation ---
        List<double> effectiveRatios;
        if (columnRatios != null && columnRatios!.isNotEmpty) {
          effectiveRatios = List.generate(
            columnCount,
            (i) => columnRatios![i % columnRatios!.length],
          );
          final sum = effectiveRatios.reduce((a, b) => a + b);
          if (sum > 0) {
            effectiveRatios = effectiveRatios.map((r) => r / sum).toList();
          } else {
            effectiveRatios = List<double>.filled(columnCount, 1 / columnCount);
          }
        } else {
          effectiveRatios = List<double>.filled(columnCount, 1 / columnCount);
        }

        Widget buildChild(int index) {
          final ratio = effectiveRatios[index % effectiveRatios.length];
          final itemWidth = availableWidth * ratio;

          return SizedBox(width: itemWidth, child: children[index]);
        }

        return Wrap(
          alignment: alignment,
          crossAxisAlignment: crossAlignment,
          spacing: spacing,
          runSpacing: runSpacing,
          children: List.generate(children.length, buildChild),
        );
      },
    );
  }
}
