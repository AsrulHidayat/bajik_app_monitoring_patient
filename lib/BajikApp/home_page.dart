import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List untuk status checklist card
  List<bool> checklistStatuses = [true, false]; // Status awal checklist

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Bagian atas dengan background biru dan rounded
          Container(
            height: 166,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5A5AFA),
                  Color(0xFF5FBBFD),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
          ),

          // Konten utama
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Bagian 1: Logo dan Notifikasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "BAJIK",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Aksi ketika tombol notifikasi ditekan
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Bagian 2: Card Penyakit dan Tombol
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Card dengan ukuran dinamis
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 64,
                          height: 132,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "PASCA OPERASI RINGAN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Ashid Kun",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Pantau kondisi kesehatan anda!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Tombol di luar Card
                        Positioned(
                          bottom: -24,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Aksi tombol cek sekarang
                              },
                              icon: const Icon(
                                Icons.event_note,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Cek Sekarang",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF4D91),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                                elevation: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Bagian 3: Tanggal
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(30, (index) {
                          final today = DateTime.now();
                          final dayDate = today.add(Duration(days: index - today.weekday + 1));
                          final dayName = DateFormat.E().format(dayDate).substring(0, 1);
                          final dayNumber = DateFormat.d().format(dayDate);

                          final isToday = dayDate.day == today.day &&
                              dayDate.month == today.month &&
                              dayDate.year == today.year;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isToday ? const Color(0xFF4F75FF) : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: isToday
                                    ? null
                                    : Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    dayName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isToday ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    dayNumber,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isToday ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Bagian 4: Checklist
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Checklist Minuman Anda",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Dynamic Checklist Cards
                    Column(
                      children: List.generate(
                        checklistStatuses.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              checklistStatuses[index] = !checklistStatuses[index];
                            });
                          },
                          child: _buildHorizontalCard(
                            iconAsset: index == 0
                                ? 'assets/icons/pills 1.svg'
                                : 'assets/icons/Antidepressant.svg',
                            title: index == 0 ? "Paracetamol" : "Anti Depressant",
                            subtitle: index == 0
                                ? "Hari ini, 08.00 Pagi"
                                : "Hari ini, 12.00 Siang",
                            isChecked: checklistStatuses[index],
                            isGreenBackground: index == 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Bagian 5: Pengukuran Hari Ini
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pengukuran Hari Ini",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildMeasurementCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety), label: "Periksa"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Konsultasi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
        selectedItemColor: const Color(0xFF4F75FF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Card Checklist
  Widget _buildHorizontalCard({
    required String iconAsset,
    required String title,
    required String subtitle,
    required bool isChecked,
    required bool isGreenBackground, // Menambahkan parameter untuk menentukan warna
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isGreenBackground ? Color(0xFFFFF9E4) : Color(0xFFFFEDEF), // Ubah warna latar belakang menjadi hijau jika isGreenBackground
        boxShadow: [],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              shape: BoxShape.rectangle,
            ),
            child: SvgPicture.asset(
              iconAsset,
              width: 48,
              height: 48,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Icon(
              isChecked ? Icons.check_circle : Icons.circle_outlined,
              size: 32,
              color: isChecked ? Colors.green : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }



  // Card untuk pengukuran hari ini
  Widget _buildMeasurementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(
            Icons.access_alarm,
            size: 48,
            color: Color(0xFF4F75FF),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tekanan Darah",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "140/90 mmHg",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
