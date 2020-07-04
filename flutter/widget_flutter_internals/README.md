# Widget & Flutter internals

- https://flutter.dev/docs/resources/inside-flutter
- https://flutter.dev/docs/perf/rendering/best-practices
- Use const wherever you have the constant content widget
- Build widgets as much as possible to easy to maintain and improvement

- Widget lifecycle
  - Stateless -> constructor() -> build()
  - Stateful -> constructor() -> initState() -> build() -> setState() -> didUpdateWidget() -> build() -> dispose()
