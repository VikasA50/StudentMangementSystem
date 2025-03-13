import pymysql
import csv

try:
    print("Connecting to MySQL...")  # Debugging print

    # Database connection
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="Chanukya@99",
        database="studentmanagementsystem",
        port=3306
    )

    print("Connected successfully!")  # Debugging print
    cursor = db.cursor()

    # Query to retrieve student performance data
    query = """
    SELECT s.StudentID, s.Name, d.DepartmentName, c.CourseName, g.OverallGrade
    FROM Students s
    JOIN Grades g ON s.StudentID = g.StudentID
    JOIN Courses c ON g.CourseID = c.CourseID
    JOIN Departments d ON s.DepartmentID = d.DepartmentID;
    """

    print("Executing query...")  # Debugging print
    cursor.execute(query)
    results = cursor.fetchall()

    print(f"Number of records fetched: {len(results)}")  # Debugging print

    if not results:
        print("No student performance data found. Check your database.")
    else:
        print("Writing to text file...")  # Debugging print
        with open("student_performance_report.txt", "w") as file:
            file.write("Student Performance Report\n")
            file.write("=" * 40 + "\n")
            for row in results:
                file.write(f"Student ID: {row[0]}, Name: {row[1]}, Department: {row[2]}, Course: {row[3]}, Grade: {row[4]}\n")

        print("Writing to CSV file...")  # Debugging print
        with open("student_performance_report.csv", "w", newline="") as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["Student ID", "Name", "Department", "Course", "Grade"])
            writer.writerows(results)

        print("Report generated successfully!")

except pymysql.MySQLError as err:
    print(f"Database error: {err}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'db' in locals() and db.open:
        db.close()
