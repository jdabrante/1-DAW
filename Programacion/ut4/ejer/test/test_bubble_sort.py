import unittest
import bubble_sort

class TestBubble_sort(unittest.TestCase):

    def test_bubble(self):
        self.assertEqual(bubble_sort.bubble([4,2,3,2,5]),[2,2,3,4,5])

if __name__ == "__main__":
    unittest.main()