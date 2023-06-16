from __future__ import annotations

MONTHS_DATA = {
    1: {"name": "ENERO", "days": 31},
    2: {"name": "FEBRERO", "days": 28},
    3: {"name": "MARZO", "days": 31},
    4: {"name": "ABRIL", "days": 30},
    5: {"name": "MAYO", "days": 31},
    6: {"name": "JUNIO", "days": 30},
    7: {"name": "JULIO", "days": 31},
    8: {"name": "AGOSTO", "days": 31},
    9: {"name": "SEPTIEMBRE", "days": 30},
    10: {"name": "OCTUBRE", "days": 31},
    11: {"name": "NOVIEMBRE", "days": 30},
    12: {"name": "DICIEMBRE", "days": 31},
}

WEEK_DAYS = {
    1: "LUNES",
    2: "MARTES",
    3: "MIÉRCOLES",
    4: "JUEVES",
    5: "VIERNES",
    6: "SÁBADO",
    0: "DOMINGO",
}


MIN_YEAR = 1900
MAX_YEAR = 2050


class Date:
    def __init__(self, day: int, month: int, year: int):
        """Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos."""
        self.year = year if MAX_YEAR >= year >= MIN_YEAR else MIN_YEAR
        self.month = month if len(MONTHS_DATA) >= month >= 1 else 1
        self.day = day if self.days_in_month >= day >= 1 else 1

    @staticmethod
    def is_leap_year(year: int) -> bool:
        return year % 4 == 0 and year % 100 != 0 or year % 400 == 0

    def get_delta_days(self) -> int:
        """Número de días transcurridos desde una fecha de referencia hasta la fecha dada. Por defecto la fecha de referencia será el 1-1-1900"""
        years_difference = self.year - MIN_YEAR
        days_between_months = 0
        for month in range(1, self.month):
            if month < self.month:
                days_between_months += MONTHS_DATA[month]["days"]
            else:
                break
        days_difference = self.day - 1
        days_of_leap_years = 0
        for i in range(1, years_difference + 1):
            if Date.is_leap_year((MIN_YEAR) + i):
                days_of_leap_years += 1
        return (
            (years_difference * 365)
            + days_between_months
            + days_difference
            + days_of_leap_years
        )

    @property
    def days_in_month(self) -> int:
        """Día de la semana de la fecha (0 para domingo, ..., 6 para sábado).
        El 1-1-1900 fue domingo."""
        if self.month == 2 and Date.is_leap_year(self.year):
            return 29
        return MONTHS_DATA[self.month]["days"]

    @property
    def weekday(self) -> int:
        return (self.get_delta_days() + 1) % 7

    @property
    def is_weekend(self) -> bool:
        return self.weekday == 0 or self.weekday == 6

    @property
    def short_date(self) -> str:
        """02/09/2003"""
        return f"{self.day:02d}/{self.month:02d}/{self.year}"

    def __str__(self):
        """MARTES 2 DE SEPTIEMBRE DE 2003"""
        return f"{WEEK_DAYS[self.weekday]} {self.day} DE {MONTHS_DATA[self.month]['name']} DE {self.year}"

    def __add__(self, days: int) -> Date:
        """Sumar un número de días a la fecha"""
        day = self.day + days
        month = self.month
        year = self.year
        while day > (month_days := MONTHS_DATA[month]["days"]):
            day -= month_days
            month += 1
            if month > len(MONTHS_DATA):
                year += 1
                month = 1
        return Date(day, month, year)

    def __sub__(self, other: Date | int) -> int | Date:
        """Dos opciones:
        1) Restar una fecha a otra fecha -> Número de días
        2) Restar un número de días la fecha -> Nueva fecha"""
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
                day = MONTHS_DATA[month]["days"]
            day -= other
            return Date(day, month, year)
        return self.get_delta_days() - other.get_delta_days()

    def __eq__(self, other: Date) -> bool:
        return str(self) == str(other)

    def __gt__(self, other: Date) -> bool:
        return Date.get_delta_days(self) > Date.get_delta_days(other)

    def __lt__(self, other: Date) -> bool:
        return Date.get_delta_days(self) < Date.get_delta_days(other)


date1 = Date(1, 3, 1979)
print(date1)
date = date1 - 231
print(date1 - 231)
