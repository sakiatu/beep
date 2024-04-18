extension ListExtension<E> on List<E> {
  List<T> to<T>(T Function(E e) generator) => map((e) => generator(e)).toList();

  List<E> evenList() => [for (int i = 0; i < length; i += 2) this[i]];

  List<E> oddList() => [for (int i = 1; i < length; i += 2) this[i]];
}
