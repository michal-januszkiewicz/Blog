# Setup
1. Install dependencies
```
bundle install
```

2. Create secrets.yml file
```
mv /config/secrets.example.yml config/secrets.yml
```

3. Generate one key with
```
rake secret
```
and add it to the secrets.yml file

4. Create application.yml file
```
mv /config/application.example.yml /config/application.yml
```
and set up the variables with your email account data

5. Set up the database
```
rake db:migrate
```

6. Deploy the app or run rails server
```
rails s
```

7. Create admin user using the application or rails console

8. Add admin privileges for created user
```
rails c
u = User.first
u.admin = true
u.save
exit
```

9. Now as admin user you have unlimited power.
