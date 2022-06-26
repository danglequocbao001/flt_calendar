1) Backend should return this JSON:

a) API years: 

{
  "years": [
    {
      "year": "2020"
    },
    {
      "year": "2021"
    },
    {
      "year": "2022"
    }
  ]
}

b) API month by year (example FE request month June 2022 ):

{
  "data-month": [
    {
      "date": "Sat 2022-06-26",
      "upcoming-events": [
        {
          "id": "txz34f56",
          "title": "Meeting with client John",
          "time": "09:00 AM - 10:00 AM GMT +8"
        }
      ]
    },
    {
      "date": "Sat 2022-06-27",
      "upcoming-events": [
        {
          "id": "txz34f57",
          "title": "Meeting with client Cena",
          "time": "09:00 AM - 10:00 AM GMT +8"
        }
      ]
    },
    {
      "date": "Sat 2022-06-28",
      "upcoming-events": [
        {
          "id": "txz34f58",
          "title": "Meeting with client Kim",
          "time": "09:00 AM - 10:00 AM GMT +8"
        }
      ]
    }
  ]
}

c) Explain: I choosed this structure because it optimize time for APIs's requesting.
FE just only call exactly what data they need (by month for this screen, instead of
call whole year or whole years). If call whole year or whole years, it'll be fast when
change from month to month but it'll make server work hard, and client may not need it.
So we should request data for month by month.

4) I have learned many things on this project. Flutter's widget, dart programing, flutter syntax,
how state work, how to create function component, what is child and children, init flutter project,
build flutter app, feel how the deadline is coming too soon.

5) With me, this project is pretty bad because it's been almost two years since I last code with Dart&Flutter.
I'll continue work with remaining screen and function.


