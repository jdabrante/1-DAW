MONTHS_DATA = {
    1: {"name": "enero", "days": 31},
    2: {"name": "febrero", "days": 28},
    3: {"name": "marzo", "days": 31},
    4: {"name": "abril", "days": 30},
    5: {"name": "mayo", "days": 31},
    6: {"name": "junio", "days": 30},
    7: {"name": "julio", "days": 31},
    8: {"name": "agosto", "days": 31},
    9: {"name": "septiembre", "days": 30},
    10: {"name": "octubre", "days": 31},
    11: {"name": "noviembre", "days": 30},
    12: {"name": "diciembre", "days": 31},
}

WEEK_DAYS = {
    0: "lunes",
    1: "martes",
    2: "miércoles",
    3: "jueves",
    4: "viernes",
    5: "sábado",
    6: "domingo",
}

MIN_YEAR = 1900
MAX_YEAR = 2050


class Date:
    def __init__(self, day: int, month: int, year: int):
        """Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos.
        """
        self.year = year if MAX_YEAR >= year >= MIN_YEAR else MIN_YEAR
        self.month = month if len(MONTHS_DATA) >= month >= 1 else 1
        self.day = day if Date.days_in_month(self.month, self.year) >= day >= 1 else 1

    @staticmethod
    def is_leap_year(year: int) -> bool:
        return year % 4 == 0 and year % 100 != 0 or year % 400 == 0

    @staticmethod
    def days_in_month(month: int, year: int) -> int:
        if month == 2 and Date.is_leap_year(year):
            return 29
        return MONTHS_DATA[month]["days"]

    def delta_days(
        self,
        reference_year: int = MIN_YEAR,
        reference_day: int = 1,
        reference_month: int = 1,
    ) -> int:
        """Número de días transcurridos desde una fecha de referencia hasta la fecha dada. Por defecto la fecha de referencia será el 1-1-1900"""
        years_difference = self.year - reference_year
        days_between_months = 0
        start_month = min(reference_month, self.month)
        end_month = max(reference_month, self.month)
        for month in range(start_month, end_month):
            if month < self.month:
                days_between_months += MONTHS_DATA[month]["days"]
            else:
                break
        days_difference = self.day - reference_day
        days_of_leap_years = 0
        for i in range(1, years_difference + 1):
            if Date.is_leap_year(min(reference_year, self.year) + i):
                days_of_leap_years += 1
        return (
            (years_difference * 365)
            + days_between_months
            + days_difference
            + days_of_leap_years
        )

    def weekday(self) -> int:
        """día de la semana de la fecha (0 para domingo, ..., 6 para sábado).
        El 1-1-1900 fue domingo."""
        return self.delta_days() % 7

    def is_weekend(self) -> bool:
        return self.weekday() == 0 or self.weekday == 6

    def short_date(self) -> str:
        """02/09/2003"""
        return f"{self.day:02d}/{self.month:02d}/{self.year}"

    def __str__(self) -> str:
        """martes 2 de septiembre de 2003"""
        return f"{WEEK_DAYS[self.weekday()]} {self.day} de {MONTHS_DATA[self.month]['name']} de {self.year}"

    def __add__(self, other):
        day = self.day + other
        month = self.month
        year = self.year
        while day > (month_days := Date.days_in_month(month, year)):
            day -= month_days
            month += 1
            if month > len(MONTHS_DATA):
                year += 1
                month = 1
        return Date(day, month, year)

    def __sub__(self, other):
        if isinstance(other, int):
            month = self.month
            year = self.year
            day = self.day
            while day - other <= 0:
                month -= 1
                other -= day
                if month == 0:
                    year -= 1
                    month = len(MONTHS_DATA)
                day = Date.days_in_month(month, year)
            day -= other
            return Date(day, month, year)
        return self.delta_days(
            reference_year=other.year,
            reference_day=other.day,
            reference_month=other.month,
        )

    def __eq__(self, other):
        return str(self) == str(other)

    def __gt__(self, other):
        return Date.delta_days(self) > Date.delta_days(other)

    def __lt__(self, other):
        return Date.delta_days(self) < Date.delta_days(other)


date1 = Date(8, 9, 1998)
print(date1)
print(date1.short_date())
print(date1.delta_days())
date2 = date1 + 1092
date3 = Date(1, 1, 1900)
print(date2)
print(date2 - date1)
print(date1 - date3)
print(date1 == date2)
print(date1 < date2)
print(date1 > date2)
print(date1.short_date())
print(date2.short_date())
