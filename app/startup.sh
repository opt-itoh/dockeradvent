#!/bin/sh

# env
if [ "x$RAILS_ENV" = "x" ]; then
  export RAILS_ENV="production"
fi

# init db
rake db:migrate

# radvent bugfix
sed -i -e "s/'page:load'/'turbolinks:load'/g" app/assets/javascripts/items.js.coffee

# asset pipeline
cp vendor/assets/javascripts/* app/assets/javascripts/
cp vendor/assets/stylesheets/* app/assets/stylesheets/
rake assets:precompile

# secret key
cat <<EOF > ./config/secrets.yml
$RAILS_ENV:
  secret_key_base: `rake secret`
EOF

# run
rails server -b 0.0.0.0
