# Základní obraz Pythonu
FROM python:3.9-slim

# Nastavení pracovního adresáře v kontejneru
WORKDIR /robotframework

# Instalace systémových závislostí
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalace Robot Framework a dalších nezbytných knihoven
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary 
    #robotframework-seleniumtestability \
    #robotframework-appiumlibrary \
    #robotframework-requests \
    #robotframework-databaselibrary 
    # robotframework-sshlibrary \
    # robotframework-ftplibrary \    
    # robotframework-jsonlibrary \
    # restinstance \
    # robotframework-soaplibrary \
    # robotframework-browser \
    # robotframework-excellibrary \
    # robotframework-pandaslibrary \
    # robotframework-sikulixlibrary \
    # robotframework-autoitlibrary \
    # robotframework-win32library \
    # robotframework-imagehorizonlibrary \
    # robotframework-imaplibrary \
    # robotframework-slacklibrary \
    # robotframework-jiralibrary \
    # robotframework-mongodblibrary \
    # robotframework-reportportal \
    # allure-robotframework

# Volitelně: Instalace Selenium WebDriver a prohlížečů (pro automatizaci prohlížečů)
# Pokud potřebujete používat Selenium WebDriver s různými prohlížeči
RUN pip install --no-cache-dir \
    selenium \
    && wget -q https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip -d /usr/local/bin/ \
    && rm chromedriver_linux64.zip

# Volitelně: Instalace headless Chromium browser
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver

# Kopírování vašeho Robot Framework projektu do pracovního adresáře v kontejneru
COPY . .

# Příkaz, který se spustí při startu kontejneru
CMD ["robot", "--variable", "BROWSER:chrome",  "--outputdir", "results", "tests"]


# Porty nebo další nastavení by se mohly přidat v případě potřeby
