<h1 align="center">
 <a href="https://www.benbox.org/">
 <picture>
  <source media="(prefers-color-scheme: dark)" srcset="images/Logo.png">
  <img height="70" src="images/Logo.png">
 </picture>
 </a>
 <br>
Car Pool
</h1>
<p align="center">
find, propose and book business trips to share resources
<p align="center">
  <a href="https://www.benbox.org/Car_Pool/Introduction.html"><img src="https://img.shields.io/badge/View%20Documentation-Docs-yellow"></a>
  <a href="https://github.com/DrBenjamin/Car_Pool"><img src="https://img.shields.io/github/stars/DrBenjamin/Car_Pool" /></a>
</p>

# Car Pool App

The Car Pool App gives the staff the opportunity to find, propose and book business trips to share resources such as a vehicle, fuel and drivers to reduce costs, eco-system impact and to increase the opportunities to reach a destination.

## Installation and configuration of all needed Software

All Software which is used to run the **Car Pool App** is **Open Source**. Please be aware of different licenses with varying policies.

### Installation of Python and Streamlit

Install **[Streamlit &amp; Python](https://docs.streamlit.io/library/get-started/installation)** to run the source code locally. A virtual Python environment like **[Anaconda](https://anaconda.org/conda-forge/download)** / **[Miniconda](https://docs.conda.io/en/latest/miniconda.html)** is highly recommend.

#### Getting the source code and install dependencies

Clone the *repository* of **Car Pool** with following command:

```bash
git clone https://github.com/DrBenjamin/Car_Pool.git
```

After that you need to install some *Python libraries*. To do so use the `requirements.txt` file with:

```bash
cd Car_Pool
python -m pip install --upgrade -r requirements.txt
```

### Configuration of Streamlit config files

First make a directory `.streamlit`. After that create the file `.streamlit/config.toml`. Here you define the *theming* and some *Streamlit server behaviour* flags:

#### Theming and Streamlit server behaviour

Theming can be customized with these configuration:

```toml
# Theming
[theme]
primaryColor = "#F63366"
backgroundColor = "#FFFFFF"
secondaryBackgroundColor = "#F0F2F6"
textColor = "#262730"
font = "sans serif"

# Disable stats collecting
[browser]
gatherUsageStats = false

# Streamlit server behaviour
[server]
headless = true
```

#### Activating Secure Socket Layer (ssl)

If you want a secure connection (https), you need to generate the **[OpenSSL](https://slproweb.com/products/Win32OpenSSL.html)** certificate and the public key:

```bash
openssl genrsa 2048 > host.key
chmod 400 host.key
openssl req -new -x509 -nodes -sha256 -days 365 -key host.key -out host.cert
```

Streamlit brings secure connection out of the box, you just need to add these two lines to `.streamlit/config.toml`:

```toml
# Server certificate file for connecting via HTTPS. Must be set at the same time as "server.sslKeyFile"
sslCertFile = "<path-to-file>/host.cert"

# Cryptographic key file for connecting via HTTPS. Must be set at the same time as "server.sslCertFile"
sslKeyFile = "<path-to-file>/host.key"
```

#### Adding Mapbox API key

```toml
# Custom Mapbox token for elements like st.pydeck_chart and st.map
[mapbox]
token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Hidden configuration file

Now create the file `.streamlit/secrets.toml` where you define some customisations and the *user / password* combinations:

```toml
# Customization
[custom]
organisation = "Company Name"
organisation_abbreviation = "CN"
logo_image = "images/Logo_Header.png"
sidebar_image = "images/Logo.png"

# User management
[passwords]
# Follow the rule: username = "password"
car = "pool"
```

### MySQL Server

A local **MySQL Server** is needed to run **HR Staff Portal**. Please install **MySQL Community Server** on your system (**[Windows](https://dev.mysql.com/downloads/mysql/)**, **[Ubuntu Linux](https://dev.mysql.com/doc/refman/8.0/en/binary-installation.html)**) or on Raspberry Pi use **MariaDB**:

```bash
sudo apt-get install mariadb-server mariadb-client
```

Use **[MySQL Workbench](https://dev.mysql.com/downloads/workbench/)** to configure the databases and user rights. Create a Schema with the name `carpool` and import the SQL sample file.

#### User, Schema and table structures

Name the database schema `carpool`. Create a user with access to it. Use the definded password in the ``.streamlit/secrets.toml`` file. The table structures and sample data are defined in the `files/carpool_dump.sql` file.

Table structures:

```sql
CREATE TABLE `cities` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `LAT` varchar(45) DEFAULT NULL,
  `LON` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `distances` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `City name 1` int DEFAULT NULL,
  `City name 2` int DEFAULT NULL,
  ...
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `gamification` (
  `ID` int NOT NULL,
  `NAME` varchar(99) DEFAULT NULL,
  `POINTS` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `routes` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `City name 1` varchar(200) DEFAULT NULL,
  `City name 2` varchar(200) DEFAULT NULL,
  ...
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `trips` (
  `ID` int NOT NULL,
  `DRIVER` varchar(99) DEFAULT NULL,
  `PHONE` varchar(99) DEFAULT NULL,
  `MAIL` varchar(99) DEFAULT NULL,
  `DEPARTURE` varchar(99) DEFAULT NULL,
  `DESTINATION` varchar(99) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `ARRIVAL` datetime DEFAULT NULL,
  `SEATS` int DEFAULT '1',
  `REQUEST` tinyint DEFAULT '0',
  `FEMALE` tinyint DEFAULT '0',
  `FEMALE_GUESTS` tinyint DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Use the `files/Car_Pool_Sample.xlsx` Excel document to prepare location and routes data for your country. Export the sheets as csv and import to your database tables accordingly.

#### MySQL server configuration in Streamlit

In the `.streamlit/secrets.toml` you define the MySQL server settings:

```toml
# MySQL configuration
[connections.sql]
type = "sql"
dialect = "mysql"
host = "127.0.0.1"
port = 3306
database = "carpool"
username = "car"
password = "pool"
```

## Testing

To run an automated test just run the following command:

```bash
python files/Testing.py
```

## Build Windows help

To rebuild the Windows help file (after changes in the App and documentation 'Markdown' files), you first have to run the following command:

```bash
python files/Md2Html.py
```

to create the updated html files. Replace the images. Now rebuild the Help with **[HTML Help Workshop](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/htmlhelp/microsoft-html-help-downloads)**. Open the `docs/Html/Car_Pool.hhp` project file with the **HTML Help Workshop** Application and compile the `Car_Pool.chm` document. The help is accessible in the App through pressing the `F1` button.

## Run Application

To run the application just run the following command:

```bash
python -m streamlit run Car_Pool.py
```

### Run Application within Docker container

You can also run the Application within docker container without the need to install dependencies on the local system.

#### Install Docker

First install Docker on your machine with the following command:

```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Give super-user rights
sudo usermod -aG docker pi
```

#### Build and run Docker container

Now you can run the following commands to run the Streamlit app and the pre-configured MariaDB SQL server as Docker containers:

```bash
# Create shared network
docker network create carpool-network

# Build and run MariaDB SQL server
docker-compose build --no-cache && docker-compose up -d
# Connect database to Streamlit App
docker network connect carpool-network carpool-db-1

# Build Streamlit app
docker build --no-cache -t streamlit .
# Run Streamlit app
docker run --name carpool -p 8501:8501 --network=carpool-network streamlit

# Check network support of the 2 docker container
docker network inspect carpool-network # If the database connection fails, 
# please check the IP address of the database container and put it in `secrets.toml`
# under [mysql] host = "xxx.xxx.xxx.xxx" and re-build the Streamlit docker container!
```

## Contact

If you have any questions, please reach out to me at:

[ben@benbox.org](mailto:ben@benbox.org)

## Demo Application

 ```toml
user: car
password: pool
 ```

[![Open in Streamlit][share_badge]][share_link]

[share_badge]: https://static.streamlit.io/badges/streamlit_badge_black_white.svg
[share_link]: https://carpool.streamlit.app/
