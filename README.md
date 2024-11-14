# Movie Booking API

This API allows you to manage movie bookings, theaters, movies, and showings. It provides endpoints to create tables, insert sample data, and retrieve movie shows for specific theaters and dates. The API is built using **Flask** and **Flask-RESTX**.

## Requirements

- Python 3.8 or higher
- Install the necessary dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## API Endpoints

### 1. Create Tables
- **Endpoint:** POST /create_tables
- **Description:** This endpoint creates the necessary tables in the PostgreSQL database.
- **Response:**
  - Success: `{"message": "Tables created successfully"}`
  - Error: `{"error": "Error message"}`

### 2. Insert Sample Data
- **Endpoint:** POST /insert_data
- **Description:** This endpoint inserts sample data into the database.
- **Response:**
  - Success: `{"message": "Sample data inserted successfully"}`
  - Error: `{"error": "Error message"}`

### 3. Get Shows by Theatre and Date
- **Endpoint:** GET /get_shows
- **Description:** This endpoint retrieves the list of available shows for a given theatre and date.
- **Query Parameters:**
  - `theatre_id`: The ID of the theatre (1 or 2).
  - `show_date`: The date of the show in YYYY-MM-DD format.
- **Example:**
    ```
    GET /get_shows?theatre_id=1&show_date=2024-11-15
    ```
- **Response:**
  - Success:
    ```json
    [
      {
        "Movie_Name": "Avengers: Endgame",
        "Show_Time": "10:00:00",
        "Available_Tickets": 50
      },
      {
        "Movie_Name": "The Lion King",
        "Show_Time": "13:00:00",
        "Available_Tickets": 75
      }
    ]
    ```
  - Error:
    ```json
    {
      "error": "Please provide theatre_id and show_date as query parameters"
    }
    ```

## Sample Data

### Insert Sample Data
To insert sample data into the tables, use the `/insert_data` endpoint. The sample data includes:

#### Theatre Table:
- **Theatre 1:** PVR Cinemas (Location: MG Road, Bangalore)
- **Theatre 2:** INOX (Location: Koramangala, Bangalore)

#### Movie Table:
- **Movie 1:** Avengers: Endgame (Genre: Action, Duration: 180 minutes)
- **Movie 2:** The Lion King (Genre: Animation, Duration: 120 minutes)

#### Show Table:
- **Show 1:** PVR Cinemas, Movie: Avengers: Endgame, Date: 2024-11-15, Time: 10:00 AM, Available Tickets: 50
- **Show 2:** PVR Cinemas, Movie: The Lion King, Date: 2024-11-15, Time: 1:00 PM, Available Tickets: 75
- **Show 3:** INOX, Movie: Avengers: Endgame, Date: 2024-11-16, Time: 3:30 PM, Available Tickets: 100

#### Customer Table:
- **Customer 1:** John Doe, Email: john.doe@example.com, Phone: 9876543210
- **Customer 2:** Jane Smith, Email: jane.smith@example.com, Phone: 9123456789

#### Booking Table:
- **Booking 1:** Show 1, Customer 1, Seats Booked: 2, Booking Date: 2024-11-10
- **Booking 2:** Show 2, Customer 2, Seats Booked: 4, Booking Date: 2024-11-12

### Date Format:
All date fields should be in the YYYY-MM-DD format. For example: 2024-11-15 for November 15, 2024.

## How to Run the API Locally
1. Clone this repository to your local machine.
2. Create and activate a virtual environment:
    ```bash
    python -m venv env
    source env/bin/activate  # On Windows use `env\Scripts\activate`
    ```
3. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
4. Run the Flask app:
    ```bash
    python app.py
    ```
   The app will run on http://127.0.0.1:5000.

## Example Requests
```bash
curl -X POST http://127.0.0.1:5000/create_table
curl -X POST http://127.0.0.1:5000/insert_data
curl "http://127.0.0.1:5000/get_shows?theatre_id=1&show_date=2024-11-15"
