# README

Employee attendances control is an API developed in Ruby on Rails to control employees check-in/check-outs, through this API yu can sign up as Admin by default, create your set of employees, and control their information. During the day you can control the check-ins and chek outs by adding labels like :lunch, :company_errand, :personal_errand, :emergency, :others and :check_out, to get an status of not only for the presence or absence but also the reason the employee leve their workplace, as well as the control of the time the employee spend at work.

## API requirements
  * Ruby version 2.5.1p57
  * Ruby on Rails gem version 5.2.3
  * Bundler version 1.16.2
  * Postgresql version 10.10

## Running the API in development environment
To run the app locally you need to:
- make sure you have ruby, ruby on rails and postgres database installed and running and the versions I mentioned below.
- clone this rerpositoy to your local by typing `git clone git@github.com:YuriDelgado/employee_control_api.git`
- change to the directory you choose
- run `bundle install`
if no errors then:
- run `rails s` or `rails s -p [num-port]` 

## Database management
 - `rails db:create` to create the databas
 - `rails db:migrate` to create the table and schema
 - `rails db:seed` to add sample data
 - `rails db:drop` to drop the database

## How to run the test suite
  run `rspec` or `rspec route/to/file/spec.rb`
  

## Endpoint description

### Admin auth endpoints
- Sign up
 	+ method: `POST`
 	+ URI: `/signup`
 	+ JSON example data:
```
 {
	  "user": {
		  "name":"Admin",
		  "email": "admin@test.com",
		  "password": "123qwe",
	  }
 }
```

- Login
	+ method: `POST`
	+ URI: `/login`
	+ JSON example data:
```
{
	"user": {
		"email": "yuri@test.com",
		"password": "123qwe"
	}
}
```

- Logout
	+ method: `DELETE`
	+ URI: `/logout`

### Admin endpoints
- Create employee
	+ requirement: logged as admin user
	+ method: `POST`
	+ URI: `/api/admin/employees`
 	+ JSON example data
```
 {
  "employee": {
   "name": "Johnette Stracke",
	  "email": "johnette.stracke@test.com",
	  "password": "123qwe",
	 }
 }
```
 
- Update employee
	+ requirement: logged as admin user
	+ method: `PUT`/`PATCH`
	+ URI: `/api/admin/employees`
	+ JSON example data
```
{
	"employee": {
		"name": "Rusty Jacobs",
	}
}
```

- Employees attendances report
	+ requirement: logged as admin user
	+ method: `GET`
	+ URI: `/api/admin/reports/employees_attendances`
	+ JSON example data
```
  {
	  "pivot_date": "2019-10-25",
	  "date_word_range": "year"
  }
``` 
 
### Employee endpoints
- employee attendances report
	+ requirement: logged as admin user
	+ method: `GET`
	+ URI: `/api/reports/employee_attendances`
	+ JSON example data
```
{
	"pivot_date": "2019-10-25",
	"date_word_range": "year"
}
```

 
