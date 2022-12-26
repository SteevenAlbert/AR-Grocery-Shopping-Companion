import requests
from bs4 import BeautifulSoup

def get_price(URL):
  print("extracting price from carrefour website...")
  # Make a request to the website and retrieve the HTML content
  HEADERS = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',
      'path': '/egypt-en/automatic-downy-washing-powder-6kg/N48979474A/p/?o=e3af2715c131cbaa',
      'method': 'GET'
      }
  page = requests.get(URL, timeout=5, headers=HEADERS)
  page.status_code
  soup = BeautifulSoup(page.content, 'html.parser')
  
  # Find the element containing the price
  price_element = soup.find(class_='-b -ltr -tal -fs24')
  
  # Extract the price from the element
  try:
    price = price_element.getText().strip()
  except:
    print("Error Caught: AttributeError")
  
    
  
  # price = price.partition("EGP ")[2]
  # price = price.partition("(")[0]
  return price

# Test the function

price = get_price("https://www.jumia.com.eg/")
print(price)
