part of 'package:heaven_canceller_hospital/ui/ui.dart';

void filterModalBottomSheet(BuildContext context) {
  final FilterProvider filter = Provider.of<FilterProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
    ),
    builder: (BuildContext context) {
      return ListenableProvider.value(
        value: filter,
        child: Wrap(
          children: [
            Container(
              width: deviceWidth(context),
              height: 406,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.filter_list,
                        size: 28,
                        color: darkGreyColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Filter Dokter",
                        style: semiBoldBaseFont.copyWith(
                          color: darkGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Spesialis",
                    style: semiBoldBaseFont.copyWith(
                      color: darkGreyColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: specialities.map((data) => SelectableBoxButton(
                      borderRadius: 20,
                      thickBorder: 1.5,
                      content: data,
                      isSelected: filter.selectedSpecialities.contains(data),
                      onTap: () {
                        filter.onSelectSpeciality(data);
                      },
                    )).toList(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Gender",
                    style: semiBoldBaseFont.copyWith(
                      color: darkGreyColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: genders.map((data) => SelectableBoxButton(
                      borderRadius: 20,
                      thickBorder: 1.5,
                      content: data,
                      isSelected: filter.selectedGenders.contains(data),
                      onTap: () {
                        filter.onSelectGender(data);
                      },
                    )).toList(),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  AccentRaisedButton(
                    width: defaultWidth(context),
                    height: 44,
                    borderRadius: 8,
                    color: accentColor,
                    fontSize: 12,
                    text: "Terapkan",
                    onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
      );
    },
  );
}
