import os
import psycopg2
from flask import Flask, jsonify, request
from flask_restx import Api, Resource, fields

app = Flask(__name__)

api = Api(app, version='1.0', title='Movie Booking API', description='A simple movie booking API')

DATABASE_URL = "postgresql://postgres_sxfy_user:hk99PoFhEsoU3aRpcB6ELQ7JrSyi0wBc@dpg-csn6nl8gph6c73fu10cg-a.oregon-postgres.render.com/postgres_sxfy"
def get_db_connection():
    conn = psycopg2.connect(DATABASE_URL)
    return conn

movie_model = api.model('Movie', {
    'Movie_Name': fields.String(required=True, description='Name of the movie'),
    'Show_Time': fields.String(required=True, description='Time of the movie show'),
    'Available_Tickets': fields.Integer(required=True, description='Number of available tickets')
})

@api.route('/create_tables')
class CreateTables(Resource):
    def post(self):
        try:
            with open('create_tables.sql', 'r') as file:
                sql_script = file.read()

            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(sql_script)
            conn.commit()

            cursor.close()
            conn.close()

            return {'message': 'Tables created successfully'}, 200

        except Exception as e:
            return {'error': str(e)}, 500

@api.route('/insert_data')
class InsertData(Resource):
    def post(self):
        try:
            with open('insert_data.sql', 'r') as file:
                sql_script = file.read()

            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(sql_script)
            conn.commit()

            cursor.close()
            conn.close()

            return {'message': 'Sample data inserted successfully'}, 200

        except Exception as e:
            return {'error': str(e)}, 500

@api.route('/get_shows')
class GetShows(Resource):
    @api.doc(params={'theatre_id': 'Theatre ID', 'show_date': 'The date of the show'})
    @api.marshal_list_with(movie_model)
    def get(self):
        theatre_id = request.args.get('theatre_id', type=int)
        show_date = request.args.get('show_date', type=str)

        if not theatre_id or not show_date:
            api.abort(400, "Please provide theatre_id and show_date as query parameters")

        try:
            with open('query_show_list.sql', 'r') as file:
                sql_script = file.read()

            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute(sql_script, (theatre_id, show_date))
            shows = cursor.fetchall()

            cursor.close()
            conn.close()

            show_list = [{"Movie_Name": show[0], "Show_Time": show[1], "Available_Tickets": show[2]} for show in shows]
            return show_list, 200

        except Exception as e:
            return {'error': str(e)}, 500

if __name__ == '__main__':
    app.run(debug=True)
