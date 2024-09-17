CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price" REAL,
    "unit" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "gluten_free" INTEGER,
    "price" REAL,
    PRIMARY KEY("id")
);

CREATE TABLE "ingredients_of_a_donut" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "donuts_in_order" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT
);

CREATE TABLE "order_history" (
    "customer_id" INTEGER,
    "order_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);
