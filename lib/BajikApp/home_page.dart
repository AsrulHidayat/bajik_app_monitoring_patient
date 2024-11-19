import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background utama putih
      body: Stack(
        children: [
          // Bagian atas dengan background biru dan rounded
          Container(
            height: 166,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5A5AFE),
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
                      clipBehavior: Clip.none, // Agar tombol di luar card tidak terpotong
                      children: [
                        // Card dengan ukuran 312 x 124
                        SizedBox(
                          width: MediaQuery.of(context).size.width -64, // Total padding kiri dan kanan (32 + 32)
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
                              crossAxisAlignment: CrossAxisAlignment.center, // Menyelaraskan teks ke tengah secara horizontal
                              children: const [
                                Text(
                                  "PASCA OPERASI RINGAN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12, // Ukuran font 12
                                    fontWeight: FontWeight.w300, // Ketebalan light
                                    color: Colors.black, // Warna hitam
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Ashid Kun",
                                  textAlign: TextAlign.center, // Rata tengah
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Pantau kondisi kesehatan anda!",
                                  textAlign: TextAlign.center, // Rata tengah
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
                          bottom: -24, // Agar tombol keluar dari card
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (index) {
                        final day = ["S", "M", "T", "W", "T", "F", "S"];
                        final isToday = index == 1; // Contoh: hari ini Senin
                        return Container(
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
                          child: Text(
                            day[index],
                            style: TextStyle(
                              color: isToday ? Colors.white : Colors.black,
                              fontWeight:
                              isToday ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),

                    // Bagian 4: Checklist Minuman
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Checklist Minuman Anda",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildHorizontalCard(
                      icon: Icons.medical_services,
                      title: "Paracetamol",
                      subtitle: "Hari ini, 08.00 Pagi",
                      isChecked: true,
                    ),
                    const SizedBox(height: 16),
                    _buildHorizontalCard(
                      icon: Icons.medical_services,
                      title: "Anti Depressant",
                      subtitle: "Hari ini, 12.00 Siang",
                      isChecked: false,
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
      // Bagian 6: Navbar
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

  // Widget Card Checklist
  Widget _buildHorizontalCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isChecked,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: const Color(0xFF4F75FF)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          isChecked
              ? const Icon(Icons.check_circle, color: Colors.green)
              : const Icon(Icons.circle_outlined, color: Colors.grey),
        ],
      ),
    );
  }

  // Widget Card Pengukuran
  Widget _buildMeasurementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
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
          const Icon(Icons.water_drop, size: 32, color: Colors.blue),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "1.500 / 2.000 ml",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text("Tambahkan 250 ml"),
              ],
            ),
          ),
          const Icon(Icons.local_drink, size: 32, color: Colors.blue),
        ],
      ),
    );
  }
}
