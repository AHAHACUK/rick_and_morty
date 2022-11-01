class ContentPage<T> {
  final int pages;
  final int number;
  final List<T> items;
  final bool hasPrev;
  final bool hasNext;

  const ContentPage(this.pages, this.number, this.items, this.hasNext, this.hasPrev);
}