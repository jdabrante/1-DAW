import pytest
import fraction

oper1 = fraction.Fraction(10, 5)
oper2 = fraction.Fraction(20, 10)
oper3 = fraction.Fraction(3, 2)

def test_sum():
    oper3 = oper1 + oper2
    assert f'{oper3}' == '4/1'