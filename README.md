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
			* [{"id":1,:"email":"example@email.com","name":"Name"},{"id":2,:"email":"example2@email.com","name":"Name2"},{"id":3,:"email":"example3@email.com","name":"Name3"}]
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
			* {"result": "success","user": {"id": 5,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}}
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
			* {"result": "success","user": {"id": 5,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}
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
			* {"result": "success","user": {"id": 5,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}
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
			
1. Create talk concert
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
			* {"result": "success","user": {"id": 5,"email": "example@email.com","created_at": 2015-05-04T08:27:54.975+09:00","updated_at": 2015-05-04T08:27:54.975+09:00","name": "Name","auth_token": AUTH_TOKEN}
