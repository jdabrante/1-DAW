class InfiniteList:
    def __init__(self, *items: str | int | float, fill_value=None):
        self.items = [item for item in items]
        self.fill_value = fill_value

    def __getitem__(self, index: int) -> str | int | float:
        return self.items[index]

    def __setitem__(self, index: int, new_item: str | int | float):
        indexes_to_add = index - len(self.items)
        while indexes_to_add > 0:
            self.items.append(self.fill_value)
            indexes_to_add -= 1
        self.items.append(new_item)

    def __len__(self):
        return len(self.items)


infinitelist1 = InfiniteList("No", "Yes", 1, 2, fill_value="+")
infinitelist1[20] = "Yes"
print(list(item for item in infinitelist1))
