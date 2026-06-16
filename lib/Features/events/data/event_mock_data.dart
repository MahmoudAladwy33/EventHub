class EventMockData {
  final String title;
  final String image;
  final String date;
  final String month;
  final String address;
  final String? time;

  EventMockData({
    required this.title,
    required this.image,
    required this.date,
    required this.month,
    required this.address,
    this.time,
  });
}

class EventMockDataLists {
  static final List<EventMockData> upcomingEvents = [
    EventMockData(
      title: 'Jo Malone London’s Mother’s Day Presents',
      image: 'https://images.unsplash.com/photo-1506157786151-b8491531f063?q=80&w=400',
      date: '28',
      month: 'APR',
      address: 'Radius Gallery • Santa Cruz, CA',
      time: 'Wed, Apr 28 • 5:30 PM',
    ),
    EventMockData(
      title: 'A Virtual Evening of Smooth Jazz',
      image: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?q=80&w=400',
      date: '01',
      month: 'MAY',
      address: 'Lot 13 • Oakland, CA',
      time: 'Sat, May 1 • 2:00 PM',
    ),
    EventMockData(
      title: 'Women\'s Leadership Conference 2021',
      image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
      date: '24',
      month: 'APR',
      address: '53 Bush St • San Francisco, CA',
      time: 'Sat, Apr 24 • 1:30 PM',
    ),
    EventMockData(
      title: 'International Kids Safe Parents Night Out',
      image: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400',
      date: '23',
      month: 'APR',
      address: 'Lot 13 • Oakland, CA',
      time: 'Fri, Apr 23 • 6:00 PM',
    ),
    EventMockData(
      title: 'Collectivity Plays the Music of Jimi',
      image: 'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?q=80&w=400',
      date: '21',
      month: 'JUN',
      address: 'Longboard Margarita Bar • Pacifica, CA',
      time: 'Mon, Jun 21 • 10:00 PM',
    ),
    EventMockData(
      title: 'International Gala Music Festival',
      image: 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=400',
      date: '25',
      month: 'APR',
      address: 'Lot 13 • Oakland, CA',
      time: 'Sun, Apr 25 • 10:15 AM',
    ),
  ];

  static final List<EventMockData> pastEvents = [
    EventMockData(
      title: 'International Gala Music Festival',
      image: 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=400',
      date: '25',
      month: 'APR',
      address: 'Lot 13 • Oakland, CA',
      time: 'Sun, Apr 25 • 10:15 AM',
    ),
    EventMockData(
      title: 'Women\'s Leadership Conference 2021',
      image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
      date: '24',
      month: 'APR',
      address: '53 Bush St • San Francisco, CA',
      time: 'Sat, Apr 24 • 1:30 PM',
    ),
  ];
}
