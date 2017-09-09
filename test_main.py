import unittest
import main


class TestStringMethods(unittest.TestCase):
    def test_sentiment(self):
        p, s = main._sentiment("it's a good day")
        self.assertTrue(p > 0)
        self.assertTrue(s > 0)
        p, s = main._sentiment("it's a bad day")
        self.assertTrue(p < 0)
        self.assertTrue(s > 0)


if __name__ == '__main__':
    unittest.main()
