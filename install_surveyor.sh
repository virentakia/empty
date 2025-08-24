#!/bin/bash

# Surveyor Installation Script
# This script helps install the Surveyor gem with compatible Rails version

echo "Surveyor Installation Helper Script"
echo "=================================="
echo ""

# Check if user wants to proceed
echo "This script will help you set up a working Surveyor installation."
echo "Note: This requires creating a new Rails 4.2 application for compatibility."
echo ""
read -p "Do you want to proceed? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

# Create project directory
PROJECT_NAME="surveyor_app"
echo "Creating project directory: $PROJECT_NAME"
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Create Gemfile for Rails 4.2
echo "Creating Gemfile with compatible versions..."
cat > Gemfile << 'EOF'
source 'https://rubygems.org'

# Use compatible Rails version
gem 'rails', '4.2.11.3'

# Database
gem 'sqlite3', '~> 1.3.13'

# Surveyor gem from NUARIG fork
gem 'surveyor', git: 'https://github.com/NUARIG/surveyor.git'

# JavaScript runtime (required for Rails 4.2)
gem 'therubyracer', platforms: :ruby

# Sass for stylesheets
gem 'sass-rails', '~> 5.0'

# jQuery for JavaScript
gem 'jquery-rails'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
EOF

echo "Gemfile created successfully!"
echo ""

echo "Next steps to complete the installation:"
echo "1. cd $PROJECT_NAME"
echo "2. bundle install"
echo "3. rails new . --force --skip-bundle"
echo "4. bundle install"
echo "5. rails generate surveyor:install"
echo "6. rake db:migrate"
echo "7. rake surveyor FILE=surveys/kitchen_sink_survey.rb"
echo "8. rails server"
echo ""

echo "After completing these steps, visit http://localhost:3000/surveys"
echo ""
echo "For detailed instructions, see the README.md file."