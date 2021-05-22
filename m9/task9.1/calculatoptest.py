import unittest
import calculator

class CalculatorTests(unittest.TestCase):
    
    def test_add(self):
        self.assertEqual(calculator.Calculator.add(2, 7), 9)

    def test_subtract(self):
        self.assertEqual(calculator.Calculator.subtract(7, 2), 5)

    def test_multiply(self):
        self.assertEqual(calculator.Calculator.multiply(3, 6), 18)

    def test_divide(self):
        self.assertEqual(calculator.Calculator.divide(12, '3'), 4)

if __name__ == '__main__':
    unittest.main()        
