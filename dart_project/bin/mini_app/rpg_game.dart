import 'dart:io';
import 'dart:math';

// Kelas untuk item
abstract class Item {
  String nama;
  String deskripsi;

  Item(this.nama, this.deskripsi);
}

class PotionItem extends Item {
  int jumlahPulih;

  PotionItem(String nama, String deskripsi, this.jumlahPulih)
      : super(nama, deskripsi);

  void gunakan(Pemain pemain) {
    pemain.pulihkan(jumlahPulih);
    print('${pemain.nama} menggunakan $nama dan memulihkan $jumlahPulih HP!');
  }
}

class Senjata extends Item {
  int bonusAttack;

  Senjata(String nama, String deskripsi, this.bonusAttack)
      : super(nama, deskripsi);
}

class Armor extends Item {
  int bonusDefense;

  Armor(String nama, String deskripsi, this.bonusDefense)
      : super(nama, deskripsi);
}

// Kelas dasar untuk karakter
abstract class Karakter {
  final String nama;
  late int hp;
  int maxHp;
  int level;
  int _experience = 0;
  int attack;
  int defense;

  Karakter(this.nama, this.maxHp, this.level, this.attack, this.defense) {
    hp = maxHp;
  }

  int get experience => _experience;
  set experience(int value) {
    _experience = value;
  }

  void serang(Karakter target);
  void terima_damage(int damage);
  bool isDead() => hp <= 0;
  void pulihkan(int amount) {
    hp = min(hp + amount, maxHp);
  }
}

// Kelas untuk pemain
class Pemain extends Karakter {
  int maxExperience = 100;
  List<Item> inventory = [];
  Senjata? senjataEquipped;
  Armor? armorEquipped;
  int gold = 0;

  Pemain(String nama) : super(nama, 100, 1, 10, 5);

  void tambahExperience(int amount) {
    _experience += amount;

    while (_experience >= maxExperience) {
      levelUp();
    }
  }

  void levelUp() {
    level++;
    _experience -= maxExperience;
    maxExperience = (maxExperience * 1.5).toInt();
    maxHp += 20;
    hp = maxHp;
    attack += 5;
    defense += 3;
    print('\n🎉 LEVEL UP! 🎉');
    print('$nama mencapai level $level!');
    print('HP Max: $maxHp');
    print('Attack: $attack');
    print('Defense: $defense');
  }

  void tambahItem(Item item) {
    inventory.add(item);
    print('Mendapatkan ${item.nama}!');
  }

  void gunakanItem(int index) {
    if (index >= 0 && index < inventory.length) {
      Item item = inventory[index];
      if (item is PotionItem) {
        item.gunakan(this);
        inventory.removeAt(index);
      } else if (item is Senjata) {
        if (senjataEquipped != null) {
          inventory.add(senjataEquipped!);
        }
        senjataEquipped = item;
        inventory.removeAt(index);
        print('Menggunakan ${item.nama}');
      } else if (item is Armor) {
        if (armorEquipped != null) {
          inventory.add(armorEquipped!);
        }
        armorEquipped = item;
        inventory.removeAt(index);
        print('Menggunakan ${item.nama}');
      }
    }
  }

  void tampilkanStatus() {
    print('\n=== STATUS PEMAIN ===');
    print('Nama: $nama');
    print('Level: $level');
    print('HP: $hp/$maxHp');
    print('EXP: $_experience/$maxExperience');
    print('Attack: ${attack + (senjataEquipped?.bonusAttack ?? 0)}');
    print('Defense: ${defense + (armorEquipped?.bonusDefense ?? 0)}');
    print('Gold: $gold');
    print('Senjata: ${senjataEquipped?.nama ?? "Tidak ada"}');
    print('Armor: ${armorEquipped?.nama ?? "Tidak ada"}');
  }

  void tampilkanInventory() {
    print('\n=== INVENTORY ===');
    if (inventory.isEmpty) {
      print('Inventory kosong');
      return;
    }
    for (int i = 0; i < inventory.length; i++) {
      print('${i + 1}. ${inventory[i].nama}');
    }
  }

  @override
  void serang(Karakter target) {
    int totalAttack = attack + (senjataEquipped?.bonusAttack ?? 0);
    int damage = max(1, totalAttack - target.defense);
    target.terima_damage(damage);
    print('$nama menyerang ${target.nama} dan memberikan $damage damage!');
  }

  @override
  void terima_damage(int damage) {
    int totalDefense = defense + (armorEquipped?.bonusDefense ?? 0);
    int actualDamage = max(1, damage - totalDefense);
    hp -= actualDamage;
    print('$nama menerima $actualDamage damage!');
  }
}

// Kelas untuk monster
class Monster extends Karakter {
  int experienceReward;
  int goldReward;

  Monster(String nama, int hp, int level, int attack, int defense,
      this.experienceReward, this.goldReward)
      : super(nama, hp, level, attack, defense);

  @override
  void serang(Karakter target) {
    int damage = max(1, attack - target.defense);
    target.terima_damage(damage);
    print('$nama menyerang ${target.nama} dan memberikan $damage damage!');
  }

  @override
  void terima_damage(int damage) {
    hp -= damage;
    print('$nama menerima $damage damage!');
  }
}

// Kelas untuk mengelola game
class Game {
  late Pemain pemain;
  List<Monster> daftarMonster = [
    Monster('Slime', 30, 1, 5, 2, 20, 10),
    Monster('Goblin', 45, 2, 8, 3, 35, 20),
    Monster('Orc', 70, 3, 12, 5, 50, 35),
    Monster('Dragon', 150, 5, 20, 10, 100, 100),
  ];

  List<Item> daftarItem = [
    PotionItem('Potion Kecil', 'Memulihkan 30 HP', 30),
    PotionItem('Potion Besar', 'Memulihkan 70 HP', 70),
    Senjata('Pedang Besi', 'Senjata dasar yang kuat', 15),
    Senjata('Pedang Legendaris', 'Pedang kuno yang sangat kuat', 30),
    Armor('Baju Besi', 'Armor dasar yang kuat', 10),
    Armor('Armor Legendaris', 'Armor kuno yang sangat kuat', 25),
  ];

  void mulaiGame() {
    print('=== SELAMAT DATANG DI GAME RPG ===');
    stdout.write('Masukkan nama karakter Anda: ');
    String nama = stdin.readLineSync() ?? 'Hero';
    pemain = Pemain(nama);

    // Berikan item awal
    pemain.tambahItem(daftarItem[0]); // Potion Kecil
    pemain.tambahItem(daftarItem[2]); // Pedang Besi
    pemain.tambahItem(daftarItem[4]); // Baju Besi

    while (true) {
      tampilkanMenu();
      String? pilihan = stdin.readLineSync();

      switch (pilihan) {
        case '1':
          bertualang();
          break;
        case '2':
          pemain.tampilkanStatus();
          break;
        case '3':
          kelolaInventory();
          break;
        case '4':
          belanja();
          break;
        case '5':
          print('\nTerima kasih telah bermain!');
          return;
        default:
          print('\nPilihan tidak valid!');
      }
    }
  }

  void tampilkanMenu() {
    print('\n=== MENU UTAMA ===');
    print('1. Bertualang');
    print('2. Lihat Status');
    print('3. Kelola Inventory');
    print('4. Belanja');
    print('5. Keluar');
    stdout.write('Pilihan Anda: ');
  }

  void bertualang() {
    print('\n=== AREA BERTUALANG ===');
    for (int i = 0; i < daftarMonster.length; i++) {
      print(
          '${i + 1}. Lawan ${daftarMonster[i].nama} (Level ${daftarMonster[i].level})');
    }
    print('5. Kembali');

    stdout.write('Pilih monster untuk dilawan: ');
    String? pilihan = stdin.readLineSync();

    if (pilihan == '5') return;

    int index = int.parse(pilihan!) - 1;
    if (index >= 0 && index < daftarMonster.length) {
      bertarung(daftarMonster[index]);
    }
  }

  void bertarung(Monster monster) {
    print('\n=== PERTARUNGAN DIMULAI ===');
    print('${pemain.nama} VS ${monster.nama}');

    Monster monsterTemp = Monster(
        monster.nama,
        monster.maxHp,
        monster.level,
        monster.attack,
        monster.defense,
        monster.experienceReward,
        monster.goldReward);

    while (true) {
      print('\nHP Pemain: ${pemain.hp}/${pemain.maxHp}');
      print('HP Monster: ${monsterTemp.hp}/${monsterTemp.maxHp}');
      print('\n1. Serang');
      print('2. Gunakan Item');
      print('3. Lari');

      stdout.write('Pilihan Anda: ');
      String? pilihan = stdin.readLineSync();

      switch (pilihan) {
        case '1':
          pemain.serang(monsterTemp);
          break;
        case '2':
          pemain.tampilkanInventory();
          stdout.write('Pilih item untuk digunakan (0 untuk batal): ');
          int itemIndex = int.parse(stdin.readLineSync() ?? '0') - 1;
          if (itemIndex >= -1) pemain.gunakanItem(itemIndex);
          break;
        case '3':
          if (Random().nextBool()) {
            print('Berhasil melarikan diri!');
            return;
          } else {
            print('Gagal melarikan diri!');
          }
          break;
        default:
          print('Pilihan tidak valid!');
          continue;
      }

      if (monsterTemp.isDead()) {
        print('\n🎉 MENANG! 🎉');
        print(
            'Mendapatkan ${monsterTemp.experienceReward} EXP dan ${monsterTemp.goldReward} Gold!');
        pemain.tambahExperience(monsterTemp.experienceReward);
        pemain.gold += monsterTemp.goldReward;

        if (Random().nextDouble() < 0.3) {
          Item hadiah = daftarItem[Random().nextInt(daftarItem.length)];
          pemain.tambahItem(hadiah);
        }
        return;
      }

      monsterTemp.serang(pemain);

      if (pemain.isDead()) {
        print('\n💀 GAME OVER 💀');
        print('${pemain.nama} telah dikalahkan...');
        pemain.hp = pemain.maxHp ~/ 2;
        pemain.gold = (pemain.gold * 0.7).toInt();
        print('Kehilangan 30% Gold dan HP dipulihkan setengah...');
        return;
      }
    }
  }

  void kelolaInventory() {
    while (true) {
      pemain.tampilkanInventory();
      print('\n1. Gunakan Item');
      print('2. Kembali');

      stdout.write('Pilihan: ');
      String? pilihan = stdin.readLineSync();

      if (pilihan == '2') break;

      if (pilihan == '1') {
        stdout.write('Pilih item untuk digunakan (0 untuk batal): ');
        int itemIndex = int.parse(stdin.readLineSync() ?? '0') - 1;
        if (itemIndex >= -1) pemain.gunakanItem(itemIndex);
      }
    }
  }

  void belanja() {
    print('\n=== TOKO ITEM ===');
    print('Gold Anda: ${pemain.gold}');

    Map<Item, int> daftarHarga = {
      daftarItem[0]: 50, // Potion Kecil
      daftarItem[1]: 100, // Potion Besar
      daftarItem[2]: 200, // Pedang Besi
      daftarItem[3]: 500, // Pedang Legendaris
      daftarItem[4]: 200, // Baju Besi
      daftarItem[5]: 500, // Armor Legendaris
    };

    while (true) {
      print('\nDaftar Item:');
      int index = 1;
      daftarHarga.forEach((item, harga) {
        print('$index. ${item.nama} - $harga Gold');
        index++;
      });
      print('${daftarHarga.length + 1}. Kembali');

      stdout.write('Pilih item untuk dibeli: ');
      int? pilihan = int.tryParse(stdin.readLineSync() ?? '');

      if (pilihan == null || pilihan == daftarHarga.length + 1) break;

      if (pilihan > 0 && pilihan <= daftarHarga.length) {
        Item itemDipilih = daftarHarga.keys.elementAt(pilihan - 1);
        int harga = daftarHarga[itemDipilih]!;

        if (pemain.gold >= harga) {
          pemain.gold -= harga;
          pemain.tambahItem(itemDipilih);
          print('Berhasil membeli ${itemDipilih.nama}!');
        } else {
          print('Gold tidak cukup!');
        }
      }
    }
  }
}

void main() {
  Game game = Game();
  game.mulaiGame();
}
