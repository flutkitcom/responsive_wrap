# ResponsiveWrap

A Flutter widget for building responsive layouts with configurable breakpoints and column ratios.

ResponsiveWrap automatically adapts your content layout across desktop, tablet, and mobile screens without requiring multiple widget trees, nested Rows, or complex LayoutBuilders.

Perfect for:

- Admin dashboards
- Analytics applications
- CRM systems
- ERP systems
- Project management apps
- Responsive Flutter Web applications

---

## Why ResponsiveWrap?

Building responsive layouts in Flutter often requires:

- Multiple `LayoutBuilder` widgets
- Separate mobile/tablet/desktop layouts
- Complex breakpoint calculations
- Nested `Row` and `Column` structures

ResponsiveWrap simplifies this into a single widget.

```dart
ResponsiveWrap(
  breakpoints: const {
    576: 1, // Use a single-column layout when width is below 576px
    768: 2, // Use a two-column layout when width is below 768px
  },
  columnRatios: const [
    0.7, // First child takes 70% of the available width
    0.3, // Second child takes 30% of the available width
  ],
  spacing: 16, // Horizontal spacing between columns
  runSpacing: 16, // Vertical spacing between wrapped rows
  children: [
    WidgetA(),
    WidgetB(),
  ],
)
```

---

## Features

✅ Responsive content layout

✅ Custom screen breakpoints

✅ Flexible column width ratios

✅ Mobile, tablet, and desktop support

✅ Dashboard-friendly design

✅ Adjustable spacing and run spacing

✅ Lightweight and dependency-free

---

## Installation

Add the package to your `pubspec.yaml`.

```yaml
dependencies:
  responsive_wrap: ^1.0.0
```

Install packages:

```bash
flutter pub get
```

Import:

```dart
import 'package:responsive_wrap/responsive_wrap.dart';
```

---

## Quick Example

```dart
ResponsiveWrap(
  breakpoints: const {
    576: 1,
    768: 2,
  },
  columnRatios: const [
    0.7,
    0.3,
  ],
  spacing: 16,
  runSpacing: 16,
  children: [
    ContentWidget(),
    SidebarWidget(),
  ],
)
```

Desktop:

```text
+----------------------+----------+
|                      |          |
|      Content         | Sidebar  |
|                      |          |
+----------------------+----------+
```

Mobile:

```text
+----------------------+
|      Content         |
+----------------------+

+----------------------+
|      Sidebar         |
+----------------------+
```

---

## Breakpoints

Breakpoints define when the layout changes.

```dart
breakpoints: const {
  576: 1,
  768: 2,
}
```

| Screen Width | Layout |
|--------------|---------|
| < 576px | 1 Column |
| 576px - 767px | 2 Columns & uses column ratios |
| >= 768px | 2 Columns & uses column ratios |

---

## Column Ratios

Column ratios determine how available width is distributed.

```dart
columnRatios: const [
  0.7,
  0.3,
]
```

Result:

| Column | Width |
|----------|----------|
| First | 70% |
| Second | 30% |

Useful for:

- Content + Sidebar
- Chart + Statistics
- Master + Detail
- Dashboard layouts

---

## Real World Example

Project Dashboard:

```dart
ResponsiveWrap(
  breakpoints: const {
    576: 1,
    768: 2,
  },
  columnRatios: const [
    0.75,
    0.25,
  ],
  spacing: 24,
  runSpacing: 24,
  children: [
    ProjectOverviewCard(),
    TeamMembersCard(),
  ],
)
```

Analytics Dashboard:

```dart
ResponsiveWrap(
  breakpoints: const {
    576: 1,
    992: 2,
  },
  columnRatios: const [
    0.65,
    0.35,
  ],
  spacing: 20,
  runSpacing: 20,
  children: [
    RevenueChart(),
    RevenueSummary(),
  ],
)
```

---

## Example Application

A complete runnable example is available in the `/example` folder.

Run:

```bash
cd example
flutter run
```

---

## Live Demo

Try it here:

👉 https://ademin.flutkit.com/#/ui-layout

---

## Documentation

Full documentation:

https://flutkit.com/docs/flutter-dashboard-ui-kits/layout-ui-widgets-components/responsive-content-layout-with-responsivewrap/

---

## Built with FlutKit

ResponsiveWrap is extracted from the FlutKit ecosystem and maintained as an open-source package for the Flutter community. It powers responsive content layouts used throughout FlutKit dashboard templates.

Explore more:

https://flutkit.com

---

## Issues & Contributions

Bug reports, feature requests, and pull requests are welcome.

When reporting issues, please include:

- Flutter version
- Package version
- Platform
- Reproduction steps

---

## License

MIT License