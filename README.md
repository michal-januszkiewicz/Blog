# Setup
1. Create secrets.yml file
```
mv /config/secrets.example.yml config/secrets.yml
```

2. Generate one key with
```
rake secret
```
and add it to the secrets.yml file

3. Create application.yml file
```
mv /config/application.example.yml /config/application.yml
```
and set up the variables with your email account data

4. Set up the database
```
rake db:migrate
```

5. Deploy the app or run rails server
```
rails s
```

6. Create admin user using the application or rails console

7. Add admin privileges for created user
```
rails c
u = User.first
u.admin = true
u.save
exit
```

8. Now as admin user you have unlimited power.
