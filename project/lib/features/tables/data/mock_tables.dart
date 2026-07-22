import '../../../data/database/enums.dart';

class MockTable {
  final int id;
  final String name;
  final int capacity;
  final TableStatus status;
  final double? total;

  const MockTable({
    required this.id,
    required this.name,
    required this.capacity,
    required this.status,
    this.total,
  });
}

const mockTables = [
  MockTable(
    id: 1,
    name: "Masa 1",
    capacity: 4,
    status: TableStatus.available,
  ),
  MockTable(
    id: 2,
    name: "Masa 2",
    capacity: 6,
    status: TableStatus.occupied,
    total: 52.40,
  ),
  MockTable(
    id: 3,
    name: "VIP 1",
    capacity: 8,
    status: TableStatus.reserved,
  ),
  MockTable(
    id: 4,
    name: "Masa 4",
    capacity: 2,
    status: TableStatus.available,
  ),
  MockTable(
    id: 5,
    name: "Masa 5",
    capacity: 4,
    status: TableStatus.occupied,
    total: 31.80,
  ),
  MockTable(
    id: 6,
    name: "VIP 2",
    capacity: 10,
    status: TableStatus.reserved,
  ),
];