# Talk on server with Rails

This app is an web service for Talk on.

## API
### Users
1. Read all users
	* Method
		* GET
	* URL
		* http://talkon.originerd.com/api/v1/users
	* Headers
		* None
	* Parameters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users
		* Response
			* [{"id":100,:"email":"example@email.com","name":"Name"},{"id":101,:"email":"example2@email.com","name":"Name2"},{"id":102,:"email":"example3@email.com","name":"Name3"}]
1. Read a user
	* Method
		* GET
	* URL
		* http://talkon.originerd.com/api/v1/users/(:id)
	* Headers
		* None
	* Paramters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users/1
		* Response
			* {"id":1,:"email":"example@email.com","name":"Name"}
1. Create a user
	* Method
		* POST
	* URL
		* http://talkon.originerd.com/api/v1/users
	* Headers
		* Content-Type
	* Parameters
		* user
			* email
			* name
			* password
			* password_confirmation
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users
			* Headers
				* Content-Type
					* application/json
			* Parameter Body
				* {"user": {"email": "example@email.com", "name": "Name", "password": "password", "password_confirmation": "password"}}
		* Response
			* {"result": "success","user": {"id": 100,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}}
1. Update a user
	* Method
		* PUT
	* URL
		* http://talkon.originerd.com/api/v1/users
	* Headers
		* Content-Type
		* Authorization
	* Parameters
		* user
			* email
			* name
			* password
			* password_confirmation
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users
			* Headers
				* Content-Type
					* application/json
				* Authorization
					* AUTH_TOKEN
			* Parameter Body
				* {"user": {"email": "example@email.com", "name": "Name", "password": "password", "password_confirmation": "password"}}
		* Response
			* {"result": "success","user": {"id": 100,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}
1. Delete a user
	* Method
		* DELETE
	* URL
		* http://talkon.originerd.com/api/v1/users
	* Headers
		* Authorization
	* Paramters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users
			* Authorization
				* AUTH_TOKEN
		* Response
			* {"result":"success"}

### Sessions
1. Sign in
	* Method
		* POST
	* URL
		* http://talkon.originerd.com/api/v1/sessions
	* Headers
		* Content-Type
	* Parameters
		* session
			* email
			* password
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/sessions
			* Headers
				* Content-Type
					* application/json
			* Parameter Body
				* {"session": {"email": "example@email.com", "password": "password"}}
		* Response
			* {"result": "success","user": {"id": 100,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}
1. Sign out
	* Method
		* DELETE
	* URL
		* http://talkon.originerd.com/api/v1/sessions
	* Headers
		* Authorization
	* Paramters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/sessions
			* Headers
				* Autorization
					* AUTH_TOKEN
		* Response
			* {"result": "success"}

### Talk concert
1. Read all talk concerts
	* Method
		* GET
	* URL
		* http://talkon.originerd.com/api/v1/talk_concerts
	* Headers
		* None
	* Parameters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/talk_concerts
		* Response
			* {"result": "success",
"talk_concerts": [{"id": 100,"user_id": 100,"start_time": "2015-04-15T01:04:24.358+09:00","end_time": "2015-04-15T01:04:24.358+09:00","location": "Example_place1","people_limit": 100,"content": "EXAMPLE1","enroll_start_time": "2015-04-15T01:04:24.358+09:00","enroll_end_time": "2015-04-15T01:04:24.358+09:00","created_at": "2015-04-15T01:04:24.358+09:00","updated_at": "2015-04-15T01:04:24.358+09:00","title": "EXAMPLE1"
},{"id": 101,"user_id": 101,"start_time": "2015-04-15T01:04:24.358+09:00","end_time": "2015-04-15T01:04:24.358+09:00","location": "Example_place2","people_limit": 100,"content": "EXAMPLE2","enroll_start_time": "2015-04-15T01:04:24.358+09:00","enroll_end_time": "2015-04-15T01:04:24.358+09:00","created_at": "2015-04-15T01:04:24.358+09:00","updated_at": "2015-04-15T01:04:24.358+09:00","title": "EXAMPLE2"
},{"id": 102,"user_id": 102,"start_time": "2015-04-15T01:04:24.358+09:00","end_time": "2015-04-15T01:04:24.358+09:00","location": "Example_place3","people_limit": 100,"content": "EXAMPLE3","enroll_start_time": "2015-04-15T01:04:24.358+09:00","enroll_end_time": "2015-04-15T01:04:24.358+09:00","created_at": "2015-04-15T01:04:24.358+09:00","updated_at": "2015-04-15T01:04:24.358+09:00","title": "EXAMPLE3"
}]}
1. Read a talk concert
	* Method
		* GET
	* URL
		* http://talkon.originerd.com/api/v1/users/(:id)
	* Headers
		* None
	* Paramters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/users/100
		* Response
			* {"result": "success",
"talk_concert": {"id": 100,"user_id": 100,"start_time": "2015-04-15T01:04:24.358+09:00","end_time": "2015-04-15T01:04:24.358+09:00","location": "Example_place1","people_limit": 100,"content": "EXAMPLE1","enroll_start_time": "2015-04-15T01:04:24.358+09:00","enroll_end_time": "2015-04-15T01:04:24.358+09:00","created_at": "2015-04-15T01:04:24.358+09:00","updated_at": "2015-04-15T01:04:24.358+09:00","title": "EXAMPLE1"
}}
1. Create a talk concert
	* Method
		* PUT
	* URL
		* http://talkon.originerd.com/api/v1/talk_concerts
	* Headers
		* Content-Type
		* Authorization
	* Parameters
		* talk_concert
			* title
			* start_time
			* end_time
			* location
			* people_limit
			* content
			* enroll_start_time
			* enroll_end_time
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/talk_concerts
			* Headers
				* Content-Type
					* application/json
				* Authorization
					* AUTH_TOKEN
			* Parameter Body
				* {"talk_concert": {"title":"EXAMPLE1","start_time":"2015-05-04T08:27:54.975+09:00","end_time":"2015-05-04T08:27:54.975+09:00","location":"Example_place1","people_limit":100,"content":"EXAMPLE1","enroll_start_time":"2015-05-04T08:27:54.975+09:00","enroll_end_time":"2015-05-04T08:27:54.975+09:00"}}
		* Response
			* {"result": "success","talk_concert": {"id": 100,"user_id": 100,"start_time": 2015-05-04T08:27:54.975+09:00","end_time": "2015-05-04T08:27:54.975+09:00","location": "Example_place1","people_limit": 100,"content": "EXAMPLE1","enroll_start_time": "2015-05-04T08:27:54.975+09:00","enroll_end_time": "2015-05-04T08:27:54.975+09:00","created_at": "2015-05-04T12:27:12.939+09:00","updated_at": "2015-05-04T12:27:12.939+09:00","title": "EXAMPLE1"}}
1. Update a talk concert
	* Method
		* PUT
	* URL
		* http://talkon.originerd.com/api/v1/talk_concerts/(:id)
	* Headers
		* Content-Type
		* Authorization
	* Parameters
		* talk_concert
			* title
			* start_time
			* end_time
			* location
			* people_limit
			* content
			* enroll_start_time
			* enroll_end_time
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/talk_concerts/100
			* Headers
				* Content-Type
					* application/json
				* Authorization
					* AUTH_TOKEN
			* Parameter Body
				* {"talk_concert": {"title":"EXAMPLE1","start_time":"2015-05-04T08:27:54.975+09:00","end_time":"2015-05-04T08:27:54.975+09:00","location":"Example_place1","people_limit":100,"content":"EXAMPLE1","enroll_start_time":"2015-05-04T08:27:54.975+09:00","enroll_end_time":"2015-05-04T08:27:54.975+09:00"}}
		* Response
			* {"result": "success","talk_concert": {"id": 100,"user_id": 100,"start_time": 2015-05-04T08:27:54.975+09:00","end_time": "2015-05-04T08:27:54.975+09:00","location": "Example_place1","people_limit": 100,"content": "EXAMPLE1","enroll_start_time": "2015-05-04T08:27:54.975+09:00","enroll_end_time": "2015-05-04T08:27:54.975+09:00","created_at": "2015-05-04T12:27:12.939+09:00","updated_at": "2015-05-04T12:27:12.939+09:00","title": "EXAMPLE1"}}
1. Delete a talk concert
	* Method
		* DELETE
	* URL
		* http://talkon.originerd.com/api/v1/talk_concerts/(:id)
	* Headers
		* Authorization
	* Paramters
		* None
	* Example
		* Request
			* URL
				* http://talkon.originerd.com/api/v1/talk_concerts/100
			* Authorization
				* AUTH_TOKEN
		* Response
			* {"result":"success"}