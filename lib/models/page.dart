class Page<T> {
  final int number;
  final List<T> items;
  final bool hasPrev;
  final bool hasNext;

  const Page(this.number, this.items, this.hasNext, this.hasPrev);
}