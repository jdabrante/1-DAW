class Fraction:
    def __init__(self, num: int, den: int):
        self.grt_common_div = self.gcd(num, den)
        self.num = num // self.grt_common_div
        self.den = den // self.grt_common_div

    def __add__(self, other):
        num = (other.num * self.den) + (self.num * other.den)
        den = other.den * self.den
        return Fraction(num, den)

    def __sub__(self, other):
        num = (other.num * self.den) - (self.num * other.den)
        den = other.den * self.den
        return Fraction(num, den)

    def __mul__(self, other):
        num = other.num * self.num
        den = other.den * self.den
        return Fraction(num, den)

    def __floordiv__(self, other):
        num = self.den * other.num
        den = self.num * other.den
        return Fraction(num, den)

    def __str__(self) -> str:
        return f"{self.num}/{self.den}"

    @staticmethod
    def gcd(a: int, b: int) -> int:
        """Algoritmo de Euclides para el cálculo del Máximo Común Divisor."""
        while b > 0:
            a, b = b, a % b
        return a


fraction1 = Fraction(10, 5)
fraction2 = Fraction(20, 10)

fraction3 = fraction1 + fraction2
print(fraction3)
