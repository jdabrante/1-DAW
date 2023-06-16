# FIBONACCI ITERABLE


class Fibonacci:
    def __init__(self, value: int):
        self.first_value = 0
        self.second_value = 1
        self.value = value
        self.pointer = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.pointer == self.value:
            raise StopIteration
        if self.first_value == 0 and self.pointer == 0:
            self.pointer += 1
            return self.first_value
        if self.second_value == 1 and self.pointer == 1:
            self.pointer += 1
            return self.second_value
        new_value = self.first_value + self.second_value
        self.first_value = self.second_value
        self.second_value = new_value
        self.pointer += 1
        return new_value


def run(value):
    return list(number for number in Fibonacci(value))
