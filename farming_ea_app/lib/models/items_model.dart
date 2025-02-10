class Item {
  final String id;
  final String name;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.description,
  });
}

// ตัวอย่าง mock-up items
final List<Item> mockItems = [
  Item(id: '1', name: 'EA 1', description: 'This is the first item.'),
  Item(id: '2', name: 'EA 2', description: 'This is the second item.'),
  Item(id: '3', name: 'EA 3', description: 'This is the third item.'),
];
