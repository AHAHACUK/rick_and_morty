class ContentPage<T> {
  final int number;
  final List<T> items;
  final bool hasPrev;
  final bool hasNext;

  const ContentPage(this.number, this.items, this.hasNext, this.hasPrev);
}