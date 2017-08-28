
-- Switching to the new database
\c todolist

--  Creating a todo table with schema
CREATE TABLE todo (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details TEXT NULL,
  priority INTEGER NOT NULL DEFAULT '1',
  created_at TIMESTAMP NOT NULL,
  completed_at TIMESTAMP NULL);

-- Inserting data into the database
INSERT INTO todo (title, details, priority, created_at, completed_at)
  VALUES ('Clean Car', 'Wash and detail the car, clean mats, and use tire shine.', 1, CURRENT_TIMESTAMP(0), null),
          ('Wash Dishes', 'Put all dirty dishes in the dishwasher, load the dishwashing detergent, close door and turn on dishwasher', 1, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0));

-- More data
INSERT INTO todo (title, details, priority, created_at, completed_at)
  VALUES ('Walk the dog', 'Get little dudes leash, walk the dog, clean any    poo he creates, give the dog a treat', 5, CURRENT_TIMESTAMP(0), null),
         ('GET PAID', 'Fight Floyd, lose, collect that 30 million dollar check!', 9000, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0)),
         ('Complete daily project', 'Follow directions provided in Newline', 4, CURRENT_TIMESTAMP(0), null);

-- Selecting todos that are not complete
SELECT * FROM todo WHERE completed_at IS NULL;

-- selecting todos with a higher priority than 1
SELECT * FROM todo WHERE priority > 1;

--  updating a todo to be complete
UPDATE todo SET completed_at = CURRENT_TIMESTAMP(0) WHERE id = 3;

-- deleting all completed todos
DELETE FROM todo WHERE completed_at IS NOT NULL;
