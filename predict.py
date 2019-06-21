import numpy as np
from sklearn.linear_model import LinearRegression 
from sklearn.isotonic import IsotonicRegression

# year, trim (1 - ex, 2 - lx), miles
x = np.array([
    [2006, 0, 167351],
    [2003, 1, 141284],
    [2011, 0, 110460],
    [2004, 1, 12300],
    [2010, 1, 91869],
    [2007, 1, 183000],
    [2007, 1, 122736]
])

x_miles = np.array([
    [167351],
    [141284],
    [110460],
    [12300],
    [91869],
    [183000],
    [122736]
])

# prices
y = np.array([
    5495,
    5800,
    10925,
    6999,
    11695,
    4995,
    7450
])

model = LinearRegression().fit(x, y)
model_miles = LinearRegression().fit(x_miles, y)

print("actual...")
print(y)

prices = model.predict(x)
print("predicted...")
print(prices)

price_miles = model_miles.predict(x_miles)
print("predicted with miles alone...")
print(price_miles)

# 2009 EX w/117260 in 17601
print("KKB Price:", 9755)
print("Edmunds Price:", 10214)

sample = np.array([[2009, 1, 117260]])
price = model.predict(sample)
print("Model Price:", price)

sample = np.array([[117260]])
price = model_miles.predict(sample)
print("Model (miles alone) Price :", price)
