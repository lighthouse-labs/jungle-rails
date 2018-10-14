# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of ordering mostly pointless goods.
As well as one nice looking shirt.


## Final Product

!["Users, can post with or without names"](https://github.com/erik-mackie/ChattyApp/blob/master/Media/Chat.png)

!["New User cannot see chat history"](https://github.com/erik-mackie/ChattyApp/blob/master/Media/NewUser.png)

!["User in chat updates "](https://github.com/erik-mackie/ChattyApp/blob/master/Media/ChatWithNewUser.png)






## Setup

1. Run `bundle install` to install dependencies
2. Run `bin/rake db:reset` to create, load and seed db
3. Run `bin/rails s -b 0.0.0.0` to start the server
4. Navigate to http://localhost:3000/

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

Any month/year combination in the future is accepted.

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
