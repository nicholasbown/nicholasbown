import sqlite3

# Connect to SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('python_programming.db')
cursor = conn.cursor()

# Step 1: Create the table python_programming
cursor.execute('''
CREATE TABLE IF NOT EXISTS python_programming (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
)
''')

# Clear the table to prevent duplicate entries
cursor.execute('''
DELETE FROM python_programming
''')

# Step 2: Insert the provided rows
cursor.executemany('''
INSERT INTO python_programming (id, name, grade) VALUES (?, ?, ?)
''', [
    (55, 'Carl David', 62),
    (66, 'Dennis Fridrickson', 88),
    (77, 'Jane Richards', 78),
    (12, 'Peyton Sawyer', 45),
    (2, 'Lucas Brooke', 99)
])

# Commit the changes
conn.commit()

# Step 3: Select all records with a grade between 60 and 80
cursor.execute('''
SELECT * FROM python_programming
WHERE grade BETWEEN 60 AND 80
''')
results = cursor.fetchall()
print("Records with grades between 60 and 80:")
for row in results:
    print(row)

# Step 4: Update Carl David's grade to 65
cursor.execute('''
UPDATE python_programming
SET grade = 65
WHERE name = 'Carl David'
''')

# Step 5: Delete Dennis Fridrickson's row
cursor.execute('''
DELETE FROM python_programming
WHERE name = 'Dennis Fridrickson'
''')

# Step 6: Change the grade of all students with an id greater than 55 to a grade of 80
cursor.execute('''
UPDATE python_programming
SET grade = 80
WHERE id > 55
''')

# Commit the changes
conn.commit()

# Verify the final state of the table
cursor.execute('''
SELECT * FROM python_programming
''')
final_results = cursor.fetchall()
print("Final state of the table:")
for row in final_results:
    print(row)

# Close the connection
conn.close()
