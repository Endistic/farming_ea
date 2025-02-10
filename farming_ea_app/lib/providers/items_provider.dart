import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/items_model.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super(mockItems); // เริ่มต้นด้วย mock-up items

  // ฟังก์ชันสำหรับเพิ่มไอเท็มใหม่
  void addItem(Item newItem) {
    state = [...state, newItem]; // เพิ่มไอเท็มเข้าไปในรายการ
  }

  void deleteItem(String id) {
    state = state.where((item) => item.id != id).toList(); // ลบไอเท็มตาม ID
  }
}

// สร้าง StateNotifierProvider สำหรับรายการไอเท็ม
final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});
