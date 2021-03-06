# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
Required Sinatra and used Sinatra methods.
- [x] Use ActiveRecord for storing information in a database
Required ActiveRecord and used it to build models and interact with data
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
Three models: User, Pannier, and Item.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
User has_many Panniers; Pannier has_many Items
- [x] Include user accounts
User class allows for creation of accounts
- [x] Ensure that users can't modify content created by other users
Panniers and Items views will only show those created by the same user. URLs for IDs to Panniers and Items that are not those made by the same user result in redirecting to that user's Panniers or Items page instead.
- [x] Include user input validations
Added validations to the models by checking for valid params before saving or updating.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
When validation checks fail, locals are populated and displayed at the top of the page explaining the error.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
