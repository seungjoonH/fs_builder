extension StringExtension on String {
  String get capitalize => this[0].toUpperCase() + substring(1, length);

  String get toSpaceCase {
    String text = this;

    if (text.contains('-')) {
      return text.split('-').map((e) => e.toLowerCase()).join(' ');
    }
    if (text.contains('_')) {
      return text.split('_').map((e) => e.toLowerCase()).join(' ');
    }
    if (text.toLowerCase() != text) {
      if (text.capitalize == text) {
        text = text[0].toLowerCase() + text.substring(1, text.length);
      }
      return text.replaceAllMapped(
        RegExp(r'([A-Z])'),
        (m) => ' ${m.group(1)!.toLowerCase()}',
      );
    }

    return trim();
  }

  String get toCamelCase {
    String text = toSpaceCase;
    return text.replaceAllMapped(
      RegExp(r' ([a-zA-Z])'),
      (m) => m.group(1)!.toUpperCase(),
    );
  }

  String get toPascalCase {
    String text = toCamelCase;
    return text[0].toUpperCase() + text.substring(1, text.length);
  }

  String get toKebabCase {
    String text = toSpaceCase;
    return text.split(' ').map((e) => e.toLowerCase()).join('-');
  }

  String get toSnakeCase {
    String text = toSpaceCase;
    return text.split(' ').map((e) => e.toLowerCase()).join('_');
  }
}
