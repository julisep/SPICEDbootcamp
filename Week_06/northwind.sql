CREATE TABLE territories (
  territory_id INTEGER UNIQUE,
  territory_description VARCHAR(50),
  region_id INTEGER
);

COPY territories FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/territories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE categories (
  category_id INTEGER UNIQUE,
  category_name VARCHAR(50),
  category_description VARCHAR(200),
  picture TEXT
);

COPY categories FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/categories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE customers (
  customer_id VARCHAR(5),
  company_name VARCHAR(100),
  contact_name VARCHAR(100),
  contact_title VARCHAR(50),
  customer_address VARCHAR(100),
  customer_city VARCHAR(50),
  customer_region VARCHAR(4)
  customer_postal_code VARCHAR(10),
  customer_country VARCHAR(50),
  customer_phone VARCHAR(50),
  customer_fax VARCHAR(50)
);

COPY customers FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/customers.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE employee_territories (
  employee_id INTEGER,
  territory_id VARCHAR(5)
);

COPY employee_territories FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/employee_territories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE employees (
  employee_id INTEGER UNIQUE,
  employee_last_name VARCHAR(50),
  employee_first_name VARCHAR(50),
  employee_title VARCHAR(50),
  employee_title_courtesy VARCHAR(10),
  employee_birth_date DATETIME,
  employee_hire_date DATETIME,
  employee_address VARCHAR(100),
  employee_city VARCHAR(50),
  employee_region VARCHAR(4)
  employee_postal_code VARCHAR(10),
  employee_country VARCHAR(50),
  employee_phone VARCHAR(50),
  employee_extension INTEGER,
  picture TEXT
);

COPY employees FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/employees.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE order_details (
  order_id INTEGER,
  product_id INTEGER,
  unit_price REAL,
  quantity INTEGER,
  discount REAL
);

COPY order_details FROM '/Users/julia/Documents/SPICED/_week6/northwind_data_clean/order_details.csv' DELIMITER ',' CSV HEADER;
