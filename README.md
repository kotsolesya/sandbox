- Add ability to create multiple lists and navigate between them
- Add ability to share lists by email
  - Create table `lists_users` with fields `user_id` and `list_id`
  - User `has_and_belongs_to_many` association

- Encrypt user id in cookies (cookies.signed)
  - http://api.rubyonrails.org/classes/ActionDispatch/Cookies.html
- Mark user if he is on list
- Add tasks sorting by title and created_at (ASC && DESC)
