// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterOption {
  final String title;
  final List<FilterOption> options;
  FilterOption({
    required this.title,
    required this.options,
  });
}

List<FilterOption> filterMenuOptions = [
  FilterOption(title: 'Radius', options: radiusFilterOptions),
  FilterOption(title: 'Size', options: sizeFilterOptions),
  FilterOption(title: 'Gender', options: genderFilterOptions),
  FilterOption(title: 'Age', options: ageFilterOptions),
  FilterOption(title: 'Shelter', options: shelterFilterOptions),
  FilterOption(title: 'Don\'t Show', options: dontShowFilterOptions),
];

List<FilterOption> radiusFilterOptions = [
  FilterOption(title: '5 miles', options: []),
  FilterOption(title: '10 miles', options: []),
  FilterOption(title: '20 miles', options: []),
  FilterOption(title: '20+ miles', options: []),
];

List<FilterOption> sizeFilterOptions = [
  FilterOption(title: 'Small', options: []),
  FilterOption(title: 'Medium', options: []),
  FilterOption(title: 'Large', options: []),
  FilterOption(title: 'Giant', options: []),
];

List<FilterOption> genderFilterOptions = [
  FilterOption(title: 'Male', options: []),
  FilterOption(title: 'Female', options: []),
];

List<FilterOption> ageFilterOptions = [
  FilterOption(title: '< 1>', options: []),
  FilterOption(title: '1-4', options: []),
  FilterOption(title: '4-7', options: []),
  FilterOption(title: '7+', options: []),
];

List<FilterOption> shelterFilterOptions = [
  FilterOption(title: 'Dali dog Rescue', options: []),
  FilterOption(title: 'Be Kind Rescue', options: []),
  FilterOption(title: 'Love underdogs', options: []),
  FilterOption(title: 'Miracle\'s Mission', options: []),
];

List<FilterOption> dontShowFilterOptions = [
  FilterOption(title: 'Unknown with children', options: []),
  FilterOption(title: 'Unknown with dogs', options: []),
  FilterOption(title: 'Unknown with cats', options: []),
];
