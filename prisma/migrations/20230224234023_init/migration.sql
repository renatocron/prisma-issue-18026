-- CreateTable
CREATE TABLE "Person" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "parent_id" INTEGER,

    CONSTRAINT "Person_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Person_email_key" ON "Person"("email");

CREATE OR REPLACE FUNCTION f_trg_xpto() RETURNS trigger AS $emp_stamp$
DECLARE
BEGIN

    -- should be "parent_id", for example
    IF NEW.parent IS NULL THEN
        -- perform ...
    END IF;

    RETURN NEW;
END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER trg_foo_insert AFTER INSERT ON "Person"
    FOR EACH ROW
    EXECUTE FUNCTION f_trg_xpto();
