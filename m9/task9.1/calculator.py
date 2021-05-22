class Calculator:
 def add(a, b):
   return a+b
 def subtract(a, b):
   return a-b
 def multiply(a, b):
   return a*b
 def divide(a, b):
   return a/b

print(Calculator.add(3, 2))

'''
class CalcTest(unittest.TestCase):
    def test_add(self):
        self.assertEqual(calc.add(1, 2), 3)
        
    def test_sub(self):
        self.assertEqual(calc.sub(4, 2), 2)
        
    def test_mul(self):
        self.assertEqual(calc.mul(2, 5), 10)
        
    def test_div(self):
        self.assertEqual(calc.div(8, 4), 2)
        
if __name__ == '__main__':
    unittest.main()
'''
    
