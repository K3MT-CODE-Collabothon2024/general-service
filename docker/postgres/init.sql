-- Create 'customers' table
CREATE TABLE customers
(
    customer_id  SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    score        INTEGER
);

-- Create 'savings' table
CREATE TABLE savings
(
    saving_id   SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    customer_id INTEGER REFERENCES customers (customer_id),
    start_date  DATE,
    end_date    DATE,
    goal        NUMERIC(12, 2),
    history     JSONB -- Store the history of transactions as a JSONB object
);

-- Create 'assets' table
CREATE TABLE assets
(
    asset_id SERIAL PRIMARY KEY,
    name     VARCHAR(10)  NOT NULL, -- For example: 'AAPL', 'BTC', 'USDT'
    type     VARCHAR(255) NOT NULL  -- Store asset type as ENUM
);

-- Create 'customers_assets' table
CREATE TABLE customers_assets
(
    customer_asset_id SERIAL PRIMARY KEY,
    customer_id       INTEGER REFERENCES customers (customer_id),
    asset_id          INTEGER REFERENCES assets (asset_id),
    amount            NUMERIC(12, 2)
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
    state       VARCHAR(255) DEFAULT 'todo' -- Task state as ENUM
);

-- Create 'information' table
CREATE TABLE news
(
    info_id     SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (customer_id),
    content     TEXT NOT NULL,
    date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create 'mails' table
CREATE TABLE documents
(
    document_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers (customer_id),
    content     TEXT NOT NULL,
    date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE widget_types
(
    widget_type_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE customer_widgets
(
    customer_id    INTEGER REFERENCES customers (customer_id),
    widget_type_id INTEGER REFERENCES widget_types (widget_type_id),
    position       INTEGER,
    PRIMARY KEY (customer_id, widget_type_id)
);

-- Insert into 'customers' table (corporate clients)
INSERT INTO customers (company_name, created_date, score)
VALUES ('Zalando SE', '2014-05-10 09:30:00', 95),
       ('Siemens AG', '2000-10-12 14:45:00', 98),
       ('Deutsche Bank AG', '1980-06-30 11:00:00', 92),
       ('BASF SE', '1975-03-20 16:20:00', 88),
       ('Adidas AG', '1995-11-25 13:50:00', 93),
       ('Allianz SE', '1990-04-17 09:45:00', 99),
       ('BMW AG', '1985-07-11 08:30:00', 97),
       ('Daimler AG', '1999-09-22 12:15:00', 94),
       ('Volkswagen AG', '1970-01-01 10:00:00', 96),
       ('SAP SE', '1989-06-01 15:00:00', 98);

-- Insert into 'savings' table (corporate savings plans)
INSERT INTO savings (name, customer_id, start_date, end_date, goal, history)
VALUES ('Strategic Expansion Fund', 1, '2022-01-01', '2027-01-01', 50000000.00, '[
  {
    "date": "2022-01-01",
    "amount": 5000000.00
  },
  {
    "date": "2023-01-01",
    "amount": 10000000.00
  }
]'),
       ('R&D Innovation Fund', 2, '2020-01-01', '2025-01-01', 100000000.00, '[
         {
           "date": "2020-01-01",
           "amount": 20000000.00
         },
         {
           "date": "2023-01-01",
           "amount": 30000000.00
         }
       ]'),
       ('Liquidity Reserve', 3, '2015-05-01', '2030-05-01', 200000000.00, '[
         {
           "date": "2015-05-01",
           "amount": 50000000.00
         },
         {
           "date": "2020-05-01",
           "amount": 100000000.00
         }
       ]'),
       ('Sustainability Projects', 4, '2019-10-10', '2024-10-10', 75000000.00, '[
         {
           "date": "2019-10-10",
           "amount": 10000000.00
         },
         {
           "date": "2021-10-10",
           "amount": 20000000.00
         }
       ]'),
       ('Marketing & Sponsorship Fund', 5, '2021-01-01', '2026-01-01', 40000000.00, '[
         {
           "date": "2021-01-01",
           "amount": 5000000.00
         },
         {
           "date": "2022-01-01",
           "amount": 10000000.00
         }
       ]'),
       ('Insurance Risk Reserve', 6, '2018-07-01', '2028-07-01', 300000000.00, '[
         {
           "date": "2018-07-01",
           "amount": 50000000.00
         },
         {
           "date": "2020-07-01",
           "amount": 100000000.00
         }
       ]'),
       ('EV Infrastructure Fund', 7, '2021-09-01', '2031-09-01', 150000000.00, '[
         {
           "date": "2021-09-01",
           "amount": 25000000.00
         },
         {
           "date": "2023-09-01",
           "amount": 50000000.00
         }
       ]'),
       ('Sustainable Mobility Fund', 8, '2019-11-01', '2024-11-01', 200000000.00, '[
         {
           "date": "2019-11-01",
           "amount": 30000000.00
         },
         {
           "date": "2022-11-01",
           "amount": 70000000.00
         }
       ]'),
       ('Green Technology Investment', 9, '2020-01-15', '2025-01-15', 250000000.00, '[
         {
           "date": "2020-01-15",
           "amount": 50000000.00
         },
         {
           "date": "2021-01-15",
           "amount": 75000000.00
         }
       ]'),
       ('Digital Transformation Fund', 10, '2018-08-01', '2023-08-01', 100000000.00, '[
         {
           "date": "2018-08-01",
           "amount": 20000000.00
         },
         {
           "date": "2020-08-01",
           "amount": 30000000.00
         }
       ]');

-- Insert into 'assets' table
INSERT INTO assets (name, type)
VALUES ('AAPL', 'Stock'),
       ('BTC', 'Cryptocurrency'),
       ('MSFT', 'Stock'),
       ('ETH', 'Cryptocurrency'),
       ('TSLA', 'Stock'),
       ('GOLD', 'Commodity'),
       ('SILV', 'Commodity'),
       ('EURO', 'Currency'),
       ('CHF', 'Currency'),
       ('JPY', 'Currency');

-- Insert into 'customers_assets' table (company asset holdings)
INSERT INTO customers_assets (customer_id, asset_id, amount)
VALUES (1, 1, 150000.00),  -- Zalando holds 150,000 shares of AAPL
       (2, 2, 300.00),     -- Siemens holds 300 BTC
       (3, 3, 200000.00),  -- Deutsche Bank holds 200,000 shares of MSFT
       (4, 4, 1000.00),    -- BASF holds 1,000 ETH
       (5, 5, 50000.00),   -- Adidas holds 50,000 shares of TSLA
       (6, 6, 10000.00),   -- Allianz holds 10,000 units of GOLD
       (7, 7, 20000.00),   -- BMW holds 20,000 units of SILV (Silver)
       (8, 8, 5000000.00), -- Daimler holds €5,000,000
       (9, 9, 3000000.00), -- Volkswagen holds CHF 3,000,000
       (10, 10, 10000000.00);
-- SAP holds JPY 10,000,000

-- Insert into 'due_tasks' table (company tasks)
INSERT INTO due_tasks (customer_id, title, category, description, url, priority, state)
VALUES (1, 'Complete Financial Audit 2023', 'Compliance', 'Complete the annual financial audit for 2023.',
        'https://commerzbank.com/audit', 1, 'todo'),
       (2, 'Submit Sustainability Report', 'Sustainability', 'Submit the company’s annual sustainability report.',
        'https://commerzbank.com/sustainability', 2, 'in-progress'),
       (3, 'Update Investment Portfolio', 'Investment', 'Review and update the current corporate investment portfolio.',
        'https://commerzbank.com/portfolio', 3, 'todo'),
       (4, 'Review R&D Budget Allocation', 'Finance', 'Reevaluate the R&D budget for 2024.',
        'https://commerzbank.com/rnd-budget', 2, 'todo'),
       (5, 'Prepare for Marketing Campaign', 'Marketing', 'Prepare the global marketing campaign for Q1 2024.',
        'https://commerzbank.com/marketing-campaign', 2, 'todo'),
       (6, 'Conduct Risk Assessment', 'Risk Management', 'Perform a corporate risk assessment for 2024.',
        'https://commerzbank.com/risk', 1, 'in-progress'),
       (7, 'EV Infrastructure Project Review', 'Sustainability', 'Review progress on the EV infrastructure expansion.',
        'https://commerzbank.com/ev-infrastructure', 3, 'todo'),
       (8, 'Renew Supply Chain Contracts', 'Operations', 'Renew the international supply chain contracts.',
        'https://commerzbank.com/supply-chain', 2, 'todo'),
       (9, 'Launch Green Technology Fund', 'Investment', 'Launch a new green technology investment fund.',
        'https://commerzbank.com/green-tech', 1, 'in-progress'),
       (10, 'Update Cloud Security Protocols', 'IT', 'Update security protocols for cloud-based systems.',
        'https://commerzbank.com/cloud-security', 1, 'todo');

-- Insert into 'news' table (company-related news)
INSERT INTO news (customer_id, content, date)
VALUES (1, 'Zalando announces €100 million investment in logistics.', '2023-10-01 12:00:00'),
       (2, 'Siemens reports record growth in renewable energy projects.', '2023-09-15 08:30:00'),
       (3, 'Deutsche Bank launches new digital banking platform.', '2023-08-10 10:45:00'),
       (4, 'BASF to invest €50 million in sustainable chemical solutions.', '2023-07-20 11:30:00'),
       (5, 'Adidas unveils carbon-neutral product line for 2024.', '2023-06-10 09:15:00'),
       (6, 'Allianz reports record profits for Q3 2023.', '2023-05-05 14:45:00'),
       (7, 'BMW accelerates production of electric vehicles in Europe.', '2023-04-25 13:20:00'),
       (8, 'Daimler expands electric bus production in North America.', '2023-03-30 15:50:00'),
       (9, 'Volkswagen partners with leading battery suppliers for EVs.', '2023-02-15 16:00:00'),
       (10, 'SAP announces new cloud solutions for enterprise automation.', '2023-01-10 08:00:00');

-- Insert into 'documents' table (company documents)
INSERT INTO documents (customer_id, content, date)
VALUES (1, 'Zalando annual financial report 2023.', '2023-10-01 14:00:00'),
       (2, 'Siemens sustainability report 2023.', '2023-09-15 11:00:00'),
       (3, 'Deutsche Bank digital platform launch document.', '2023-08-10 13:00:00'),
       (4, 'BASF investment proposal for sustainable chemicals.', '2023-07-20 16:30:00'),
       (5, 'Adidas carbon-neutral product strategy.', '2023-06-10 10:45:00'),
       (6, 'Allianz Q3 financial results.', '2023-05-05 17:15:00'),
       (7, 'BMW EV production expansion plan.', '2023-04-25 14:45:00'),
       (8, 'Daimler electric bus production report.', '2023-03-30 17:30:00'),
       (9, 'Volkswagen EV battery partnership agreement.', '2023-02-15 18:00:00'),
       (10, 'SAP cloud solutions whitepaper.', '2023-01-10 09:30:00');

INSERT INTO widget_types (widget_type_id, name)
VALUES (1, 'Due Task Widget Wide'),
       (2, 'Due Task Widget'),
       (3, 'Account Summary Wide'),
       (4, 'Account Summary'),
       (5, 'Market Data Wide'),
       (6, 'Market Data'),
       (7, 'News Wide'),
       (8, 'News'),
       (9, 'Documents Wide'),
       (10, 'Documents');