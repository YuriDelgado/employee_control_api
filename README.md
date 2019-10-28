# README

Employee attendances control is an API developed in Ruby on Rails to control employees check-in/check-outs, through this API yu can sign up as Admin by default, create your set of employees, and control their information. During the day you can control the check-ins and check-outs by adding labels like :lunch, :company_errand, :personal_errand, :emergency, :others and :check_out, to get an accurate status, not only for the presence or absence but also the reason the employee leave their workplace, as well as the control of the time the employee spend at work.

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

> Auth is provideed for admins only, when you sign up, admin role is automatically setted to your account, once when you login the API, you can add employees to your account, this employeees are not availeable for the rest of the admins

- ##### Sign up
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

- ##### Login
	+ method: `POST`
	+ URI: `/login`
	+ JSON example data:
```
{
	"user": {
		"email": "admin@test.com",
		"password": "123qwe"
	}
}
```

- Logout
	+ method: `DELETE`
	+ URI: `/logout`

### Admin endpoints

> When you login as admin the API provide an Authentication Bearer token to be sure your account is authorized to perform actions related to the management of employees, like create, update and see the employees report. To do so, yu need to set this Authentication Bearer token in the headers of all the requests you made, in order to success. Next here, you have the end-points related for this actions.
	
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
		"password": "123qwe"
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

> Logged in as employee, you can only see the report of your check-ins/check-outs, this action require the employee to provide the date or the date range to get the information. As well as the Admin user, the Authirization Berer token is required at the headers for each request.
	
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
