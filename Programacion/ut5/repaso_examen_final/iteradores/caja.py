class Box:
    def __init__(self):
        self.items = []
        
    def storing_objets(self, *objects):
        for item in objects:
            self.items.append(item)
    
    def __len__(self):
        return len(self.items)
        
    def __iter__(self):
        return BoxIterator(self)

class BoxIterator:
    def __init__(self, box):
        self.box = box
        self.pointer = 0
        
    def __next__(self):
        if self.pointer >= len(self.box):
            raise StopIteration
        result = self.box.items[self.pointer]
        self.pointer += 1
        return result
        

box1 = Box()
box1.storing_objets('nintendo','zapato','gorra')
for item in box1:
    print(item)
