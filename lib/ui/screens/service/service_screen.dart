part of 'package:heaven_canceller_hospital/ui/screens/screens.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /// SECTION: TITLE SEARCH BOX
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Layanan",
                  style: semiBoldBaseFont.copyWith(
                    color: darkGreyColor,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SearchBoxField(
                  controller: searchController,
                ),
              ],
            ),
          ),

          /// SECTION: FACILITY & SERVICE SLIDER CARD
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 16,
                ),
                child: Text(
                  "Fasilitas & Layanan Terkini",
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 16,
                    color: darkGreyColor,
                  ),
                ),
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.only(
                      left: (index == 0) ? 20 : 16,
                      right: (index == 5) ? 20 : 0,
                    ),
                    child: HospitalFacilityCard(
                      title: "Ruang Operasi Darurat",
                      imagePath: "assets/image/room.jpg",
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}