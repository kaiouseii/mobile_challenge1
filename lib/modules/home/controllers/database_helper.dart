import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const _databaseName = "video.db";
  static const _databaseVersion = 1;

  static const table = 'videos';

  static const index = 'id';
  static const sourceUrl = 'sourceUrl';
  static const imageUrl = 'imageUrl';
  static const category = 'category';
  Future onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $table (
        $index INTEGER PRIMARY KEY,
        $imageUrl TEXT NOT NULL,
        $sourceUrl TEXT NOT NULL,
        $category TEXT NOT NULL
      )
    ''',
    );
  }

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreate,
    );
  }
}
