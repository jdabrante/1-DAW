import filecmp
from pathlib import Path


class DNA:
    ADENINE = "A"
    GUANINE = "G"
    CYTOSINE = "C"
    THYMINE = "T"
    BASES = "AGTC"

    def __init__(self, bases: str):
        self.sequence = bases

    def __str__(self):
        return self.sequence

    def __len__(self):
        return len(self.sequence)

    def __getitem__(self, index: int):
        return self.sequence[index]

    def __setitem__(self, index: int, new_base: str):
        bases = list(self.sequence)
        if new_base in DNA.BASES:
            bases[index] = new_base
        else:
            bases[index] = DNA.ADENINE
        self.sequence = "".join(bases)

    @classmethod
    def build_from_file(cls, input_path):
        sequence = ""
        with open(input_path) as f:
            for bases in f:
                bases = bases.strip()
                sequence += bases
        return DNA(sequence)

    def dump_to_file(self, output_path):
        with open(output_path, "w") as f:
            f.write(self.sequence)

    @property
    def adenines(self):
        return self.sequence.count(DNA.ADENINE)

    @property
    def guanines(self):
        return self.sequence.count(DNA.GUANINE)

    @property
    def cytosines(self):
        return self.sequence.count(DNA.CYTOSINE)

    @property
    def thymines(self):
        return self.sequence.count(DNA.THYMINE)

    def __add__(self, other):
        new_sequence = ""
        for base1, base2 in zip(self.sequence, other.sequence):
            new_sequence += max(base1, base2)
        if len(new_sequence) != max(len(self), len(other)):
            new_sequence += max(self.sequence, other.sequence)[len(new_sequence) :]
        return DNA(new_sequence)

    def stats(self):
        total_bases_amount = len(self.sequence)
        adenine_percentage = (self.adenines / total_bases_amount) * 100
        guanine_percentage = (self.guanines / total_bases_amount) * 100
        cytosine_percentage = (self.cytosines / total_bases_amount) * 100
        timina_percentage = (self.thymines / total_bases_amount) * 100
        return {
            "A": adenine_percentage,
            "G": guanine_percentage,
            "C": cytosine_percentage,
            "T": timina_percentage,
        }

    def __mul__(self, other):
        return DNA(
            "".join(
                base1
                for base1, base2 in zip(self.sequence, other.sequence)
                if base1 == base2
            )
        )


dna1 = DNA("GGATC")
dna2 = DNA("GTA")
print(dna1)
print(dna1.adenines)
dna3 = dna1 + dna2
print(dna3)
print(dna3.stats())
dna4 = dna1 * dna2
print(dna4)
print(len(dna1))
