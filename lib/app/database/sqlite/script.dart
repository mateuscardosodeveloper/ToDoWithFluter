final createTable = '''
  CREATE TABLE todo(
    id INTEGER NOT NULL PRIMARY KEY,
    createdTime DATE,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(255),
    isDone BOOLEAN
  )
''';

final insert1 = '''
INSERT INTO todo (createdTime, title, description)
VALUES (
  '2021-05-19', 
  'Buy Food 😋', 
  '- Eggs 
  - Milk 
  - Bread 
  - Water'
)
''';

final insert2 = '''
INSERT INTO todo (createdTime, title, description, isDone)
VALUES (
  '2021-03-12', 
  'Plan family trip to Norway', 
  '- Rent some hotels 
  - Rent a car 
  - Pack suitcase',
  'FALSE'
)
''';

final insert3 = '''
INSERT INTO todo (createdTime, title, description)
VALUES (
  '2021-03-15', 
  'Walk the Dog 🐕',
  'blah blah'
)
''';
