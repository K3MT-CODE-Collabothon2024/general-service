-- Create 'customers' table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    score INTEGER
);

-- Create 'savings' table
CREATE TABLE savings (
    saving_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    customer_id INTEGER REFERENCES customers(customer_id),
    start_date DATE,
    end_date DATE,
    goal NUMERIC(12, 2),
    history JSONB  -- Store the history of transactions as a JSONB object
);

-- Create 'assets' table
CREATE TABLE assets (
    asset_id SERIAL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,  -- For example: 'AAPL', 'BTC', 'USDT'
    type VARCHAR(255) NOT NULL  -- Store asset type as ENUM
);

-- Create 'customers_assets' table
CREATE TABLE customers_assets (
    customer_asset_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    asset_id INTEGER REFERENCES assets(asset_id),
    amount NUMERIC(12, 2)
);

-- Create 'due_tasks' table
CREATE TABLE due_tasks (
    task_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    url VARCHAR(255),
    priority INTEGER,
    state VARCHAR(255) DEFAULT 'todo'  -- Task state as ENUM
);

-- Create 'information' table
CREATE TABLE news (
    info_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    content TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create 'mails' table
CREATE TABLE documents (
    document_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    content TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
