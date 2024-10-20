-- Create 'customers' table
CREATE TABLE customers
(
    customer_id  SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cash        NUMERIC(12, 2) DEFAULT 0.00
);

-- Create 'assets' table
CREATE TABLE assets
(
    asset_id SERIAL PRIMARY KEY,
    name     VARCHAR(10)  NOT NULL,
    type     VARCHAR(255) NOT NULL
);

-- Create 'customers_assets' table with a composite primary key (customer_id, asset_id)
CREATE TABLE customers_assets
(
    customer_id INTEGER REFERENCES customers (customer_id),
    asset_id    INTEGER REFERENCES assets (asset_id),
    amount      NUMERIC(12, 2),
    PRIMARY KEY (customer_id, asset_id)
);

-- Create 'due_tasks' table
CREATE TABLE due_tasks
(
    task_id     SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (customer_id),
    title       VARCHAR(255) NOT NULL,
    category    VARCHAR(100),
    description TEXT,
    url         VARCHAR(255),
    priority    INTEGER,
    state       VARCHAR(255) DEFAULT 'todo',
    deadline    TIMESTAMP
);

-- Create 'information' table
CREATE TABLE news
(
    info_id     SERIAL PRIMARY KEY,
    title       VARCHAR(255),
    customer_id INTEGER REFERENCES customers (customer_id),
    content     TEXT NOT NULL,
    date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create 'mails' table
CREATE TABLE mails
(
    email_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (customer_id),
    date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subject     VARCHAR(255) NOT NULL,
    sender     VARCHAR(255) NOT NULL
);


-- Insert into 'customers' table (corporate clients)
INSERT INTO customers (company_name, created_date, cash)
VALUES ('Commerzbank AG', '2020-01-01', 17542.11),
       ('Siemens AG', '2015-01-01', 245590.87),
       ('Deutsche Bank AG', '2010-01-01', 3673489.78),
       ('BASF SE', '2005-01-01', 1231556.22),
       ('Adidas AG', '2000-01-01', 1220100.90),
       ('Allianz SE', '1995-01-01', 601234.76),
       ('BMW AG', '1990-01-01', 701200.98),
       ('Daimler AG', '1985-01-01', 80213234.65),
       ('Volkswagen AG', '1980-01-01', 9001214.90),
       ('SAP SE', '1975-01-01', 100023.42);


-- Insert into 'assets' table (50 EXAMPLE VALUES, 30 OF TYPE 'stock', 10 of type 'commodity', 10 of type 'currency
INSERT INTO assets (name, type)
VALUES
('AAPL', 'stock'),
('MSFT', 'stock'),
('AMZN', 'stock'),
('TSLA', 'stock'),
('META', 'stock'),
('GOOGL', 'stock'),
('NFLX', 'stock'),
('NVDA', 'stock'),
('INTC', 'stock'),
('AMD', 'stock'),
('IBM', 'stock'),
('ORCL', 'stock'),
('CSCO', 'stock'),
('CRM', 'stock'),
('BA', 'stock'),
('KO', 'stock'),
('PEP', 'stock'),
('PFE', 'stock'),
('JNJ', 'stock'),
('PG', 'stock'),
('XAU', 'commodity'),
('XAG', 'commodity'),
('CL', 'commodity'),
('NG', 'commodity'),
('XPT', 'commodity'),
('XPD', 'commodity'),
('HG', 'commodity'),
('C', 'commodity'),
('W', 'commodity'),
('S', 'commodity'),
('KC', 'commodity'),
('SB', 'commodity'),
('CT', 'commodity'),
('CC', 'commodity'),
('LC', 'commodity'),
('USD', 'currency'),
('EUR', 'currency'),
('GBP', 'currency'),
('JPY', 'currency'),
('CHF', 'currency'),
('CAD', 'currency'),
('AUD', 'currency'),
('NZD', 'currency'),
('CNY', 'currency'),
('MXN', 'currency'),
('INR', 'currency'),
('BRL', 'currency'),
('ZAR', 'currency'),
('RUB', 'currency'),
('KRW', 'currency');

INSERT INTO customers_assets (customer_id, asset_id, amount)
VALUES
(1, 1, 50),
(1, 2, 30),
(1, 3, 25),
(1, 4, 40),
(1, 5, 60),
(1, 6, 60),
(1, 7, 60),
(1, 21, 145),
(1, 22, 240),
(1, 23, 335),
(1, 24, 110),
(1, 25, 451),
(1, 26, 251),
(1, 36, 1001),
(1, 37, 20011),
(1, 38, 1520),
(1, 39, 2220);


-- Insert into 'due_tasks' table (company tasks)
INSERT INTO due_tasks (customer_id, title, category, description, url, priority, state, deadline)
VALUES (1, 'Complete Financial Audit 2023', 'Compliance', 'Complete the annual financial audit for 2023.',
        'https://commerzbank.com/audit', 1, 'todo', '2024-12-15 12:00:00'),
       (1, 'Submit Sustainability Report', 'Sustainability', 'Submit the company’s annual sustainability report.',
        'https://commerzbank.com/sustainability', 2, 'in-progress', '2024-11-30 08:30:00'),
       (1, 'Update Investment Portfolio', 'Investment', 'Review and update the current corporate investment portfolio.',
        'https://commerzbank.com/portfolio', 3, 'todo', '2024-11-30 10:45:00'),
       (1, 'Review R&D Budget Allocation', 'Finance', 'Reevaluate the R&D budget for 2024.',
        'https://commerzbank.com/rnd-budget', 2, 'todo', '2024-07-20 11:30:00'),
       (1, 'Prepare for Marketing Campaign', 'Marketing', 'Prepare the global marketing campaign for Q1 2024.',
        'https://commerzbank.com/marketing-campaign', 2, 'todo', '2024-06-10 09:15:00'),
       (1, 'Conduct Risk Assessment', 'Risk Management', 'Perform a corporate risk assessment for 2024.',
        'https://commerzbank.com/risk', 1, 'in-progress', '2024-05-05 14:45:00'),
       (7, 'EV Infrastructure Project Review', 'Sustainability', 'Review progress on the EV infrastructure expansion.',
        'https://commerzbank.com/ev-infrastructure', 3, 'todo', '2024-04-25 13:20:00'),
       (8, 'Renew Supply Chain Contracts', 'Operations', 'Renew the international supply chain contracts.',
        'https://commerzbank.com/supply-chain', 2, 'todo', '2024-03-30 15:50:00'),
       (9, 'Launch Green Technology Fund', 'Investment', 'Launch a new green technology investment fund.',
        'https://commerzbank.com/green-tech', 1, 'in-progress', '2024-02-15 16:00:00');

-- Insert into 'news' table (company-related news)
INSERT INTO news (customer_id, title, content, date)
VALUES (1, 'Commerzbank Achieves Record Profits in Q3 2023',
        'Commerzbank reports record profits for the third quarter of 2023, driven by strong performance in investment banking and asset management.',
        '2023-10-01 12:00:00'),
       (1, 'Siemens Launches New Renewable Energy Projects',
        'Siemens announces the launch of new renewable energy projects in Europe and Asia, focusing on wind and solar energy solutions.',
        '2023-09-15 08:30:00'),
       (1, 'Deutsche Bank Unveils Digital Banking Platform',
        'Deutsche Bank introduces a new digital banking platform, offering customers enhanced online banking services and features.',
        '2023-08-10 10:45:00'),
       (4, 'BASF Invests in Sustainable Chemical Solutions',
        'BASF invests in sustainable chemical solutions, aiming to reduce the environmental impact of its products and operations.',
        '2023-07-20 11:30:00'),
       (5, 'Adidas Announces Carbon-Neutral Product Line',
        'Adidas unveils a new carbon-neutral product line, featuring sustainable materials and production processes to reduce carbon emissions.',
        '2023-06-10 09:15:00'),
       (6, 'Allianz Reports Record Profits for Q3 2023',
        'Allianz reports record profits for the third quarter of 2023, driven by strong performance in insurance and asset management.',
        '2023-05-05 14:45:00'),
       (7, 'BMW Expands Electric Vehicle Production',
        'BMW announces the expansion of its electric vehicle production capacity, with plans to introduce new EV models in the market.',
        '2023-04-25 13:20:00'),
       (8, 'Daimler Invests in Electric Bus Production',
        'Daimler invests in electric bus production, aiming to increase the adoption of electric buses for sustainable urban transportation.',
        '2023-03-30 15:50:00'),
       (9, 'Volkswagen Partners with Battery Suppliers',
        'Volkswagen announces a partnership with battery suppliers to secure a stable supply chain for electric vehicle production.',
        '2023-02-15 16:00:00');




-- Insert into 'mails' table (company-related emails) with date
INSERT INTO mails (customer_id, subject, date, sender)
VALUES (1, 'Financial Report Q3 2023', '2023-10-01 12:00:00', 'example1@example.com'),
       (1, 'Renewable Energy Projects Update', '2023-09-15 08:30:00', 'example2@example.com'),
       (1, 'Digital Banking Platform Launch', '2023-08-10 10:45:00', 'example1@example.com'),
       (1, 'Sustainable Chemical Solutions Investment', '2023-07-20 11:30:00', 'example4@example.com'),
       (1, 'Carbon-Neutral Product Line Announcement', '2023-06-10 09:15:00', 'example1@example.com'),
       (6, 'Record Profits for Q3 2023', '2023-05-05 14:45:00', 'example5@example.com'),
       (7, 'Electric Vehicle Production Expansion', '2023-04-25 13:20:00', 'example8@example.com'),
       (8, 'Electric Bus Production Expansion', '2023-03-30 15:50:00', 'example1@example.com'),
       (9, 'Battery Suppliers Partnership Announcement', '2023-02-15 16:00:00', 'example1@example.com'),
       (10, 'Cloud Solutions for Enterprise Automation', '2023-01-10 08:00:00', 'example1@example.com');

