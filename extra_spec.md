ApplicationController
  Homepage
- [X] loads the homepage
  Signup Page
- [X] loads the signup page
- [X] signup directs user to twitter index
- [X] does not let a user sign up without a username
- [X] does not let a user sign up without an email
- [X] does not let a user sign up without a password
- [X] does not let a logged in user view the signup page
  login
- [X] loads the login page
- [ ] loads the tweets index after login
- [X] does not let user view login page if already logged in
  logout
- [X] lets a user logout if they are already logged in and redirects to the HOME(login) page
- [X] redirects a user to the index page if the user tries to access /logout while not logged in
- [ ] redirects a user to the login route if a user tries to access /tweets route if user not logged in
- [ ] loads /tweets if user is logged in
  user show page
- [ ] shows all a single users tweets
index action
  logged in
  - [ ] lets a user view the tweets index if logged in
  logged out
 - [ ] does not let a user view the tweets index if not logged in
  new action
    logged in
  - [ ] lets user view new tweet form if logged in
  - [ ] lets user create a tweet if they are logged in
  - [ ] does not let a user tweet from another user
  - [ ] does not let a user create a blank tweet
    logged out
  - [ ] does not let user view new tweet form if not logged in
  show action
    logged in
  - [ ] displays a single tweet
  logged out
  - [ ] does not let a user view a tweet
  edit action
    logged in
  - [ ] lets a user view tweet edit form if they are logged in
  - [ ] does not let a user edit a tweet they did not create
  - [ ] lets a user edit their own tweet if they are logged in
  - [ ] does not let a user edit a text with blank content
  logged out
  - [ ] does not load -- requests user to login
  delete action
    logged in
  - [ ] lets a user delete their own tweet if they are logged in
  - [ ] does not let a user delete a tweet they did not create
  logged out
  - [ ] does not load let user delete a tweet if not logged in

User
  - [ ] can slug the username
  - [ ] can find a user based on the slug
  - [ ] has a secure password
