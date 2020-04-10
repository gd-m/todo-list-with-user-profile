# Todo App with User Profile

I am using following gems  
- bcrypt
- rack-cors
- database- pg
- active model serializer


### Port 3001
- config --> puma.rb
### cors setup done
- cors.rb --> credentials: true

### cookies: done
- config -->application.rb
- app--> controllers --> application_controller.rb

## Models
### User
    has_secure_password
    has_one :profile
    has_many :todos
- Attributes
    - email:string
    - password_digest:string

### Profile
    belongs_to :user
    has_one_attached :avatar
- Attributes
    - first_name:string
    - last_name:string
    - username:string
    - user_id:integer


### Todo
    belongs_to :user
- Attributes
    - content:string
    - isCompleted:boolean
    - user_id:integer