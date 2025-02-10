import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/items_model.dart';
import '../providers/items_provider.dart';
import '../routes/app_routes.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Farming EA'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: items.length,
          shrinkWrap:
              true, // ใช้ shrinkWrap เมื่อ ListView อยู่ในพื้นที่ที่มีขนาดไม่แน่นอน
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                ref.read(itemProvider.notifier).deleteItem(item.id);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} deleted')),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigator.pushNamed(context, '/notification');

                    Navigator.pushNamed(
                      context,
                      AppRoutes.itemDetail,
                      arguments: item, // ส่งข้อมูลที่ต้องการไปยังหน้าใหม่
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context, ref),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New EA'),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Item Name'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด Dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final newItem = Item(
                  id: DateTime.now().toString(), // สร้าง ID ใหม่จากเวลา
                  name: nameController.text,
                  description: descriptionController.text,
                );

                // เพิ่มไอเท็มใหม่โดยใช้ provider
                ref.read(itemProvider.notifier).addItem(newItem);

                Navigator.pop(context); // ปิด Dialog หลังจากเพิ่มไอเท็ม
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
