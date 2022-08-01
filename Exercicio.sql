CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"price" bigint NOT NULL,
	"category" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"principal" TEXT NOT NULL,
	"secondary" TEXT NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("principal")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"order_id" serial NOT NULL,
	"product_id" serial NOT NULL,
	"user_id" numeric NOT NULL,
	"status" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("order_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Address" (
	"user_id" serial NOT NULL,
	"address" TEXT NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("principal") REFERENCES "products"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "Address" ADD CONSTRAINT "Address_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");






