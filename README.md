# Surveyor Gem Installation Guide

This repository contains a setup for installing and running the Surveyor gem from https://github.com/NUARIG/surveyor.

## Overview

The Surveyor gem is a Rails plugin that enables surveys in Rails applications. It allows you to create surveys using a Domain Specific Language (DSL), making it easier to build and manage complex surveys with skip logic and dependencies.

## Compatibility Issues

**Important:** The Surveyor gem was designed for older versions of Rails (3.2 and 4.0) and has compatibility issues with modern Rails versions (7.x and 8.x). The current Rails 8.0.2.1 installation in this repository is incompatible with the surveyor gem due to:

1. **Formtastic version conflicts**: Surveyor expects formtastic ~2.2.1, but Rails 8 installs formtastic 5.0.0
2. **Rails API changes**: Many Rails APIs have changed significantly since Rails 4.0
3. **Dependency conflicts**: Various gem dependencies have evolved incompatibly

## Recommended Installation Approaches

### Option 1: Use a Compatible Rails Version (Recommended)

For a working Surveyor installation, you should use Rails 4.0-4.2:

1. **Create a new Rails 4.2 application:**
```bash
# Install Rails 4.2
gem install rails -v '4.2.11.3'

# Create new app
rails _4.2.11.3_ new surveyor_app
cd surveyor_app
```

2. **Add surveyor to your Gemfile:**
```ruby
gem 'surveyor', git: 'https://github.com/NUARIG/surveyor.git'
```

3. **Install and setup:**
```bash
bundle install
rails generate surveyor:install
rake db:migrate
```

4. **Load the sample survey:**
```bash
rake surveyor FILE=surveys/kitchen_sink_survey.rb
```

### Option 2: Use Ruby Version Manager for Compatibility

```bash
# Using rbenv to install Ruby 2.1 (compatible with Rails 4.2)
rbenv install 2.1.10
rbenv local 2.1.10

# Install Rails 4.2
gem install rails -v '4.2.11.3'

# Follow steps from Option 1
```

### Option 3: Look for Modern Alternatives

Consider using more modern survey solutions:
- **Formidable Forms** (WordPress plugin)
- **Typeform** (SaaS solution)
- **Google Forms** (Free option)
- **Rails-based alternatives** like "simple_form" + custom survey logic

## What This Repository Contains

This repository demonstrates the compatibility issues and provides:

1. A Rails 8.0.2.1 application (current as of 2024)
2. Documentation of the surveyor gem installation process
3. Explanation of compatibility issues
4. Recommended workarounds and alternatives

## Current Setup Status

- ✅ Rails 8.0.2.1 installed and working
- ❌ Surveyor gem incompatible with current Rails version
- ✅ Documentation and setup guide provided
- ✅ Alternative approaches documented

## Files in This Repository

- `README.md` - This installation guide
- `Gemfile` - Rails 8 application dependencies
- `config/` - Rails application configuration
- `app/` - Rails application structure

## Running the Current Rails App

Even though Surveyor isn't compatible, you can run the base Rails application:

```bash
bundle install
rails server
```

Visit http://localhost:3000 to see the Rails welcome page.

## Getting Help

If you need to use Surveyor specifically:

1. **Use the compatibility approach** (Option 1 above) with Rails 4.2
2. **Check for community forks** that might have updated compatibility
3. **Consider migrating** to a more modern survey solution

## Resources

- [Original Surveyor GitHub](https://github.com/NUBIC/surveyor)
- [NUARIG Fork](https://github.com/NUARIG/surveyor)
- [Rails 4.2 Documentation](https://guides.rubyonrails.org/v4.2/)
- [Surveyor DSL Documentation](http://github.com/NUBIC/surveyor/blob/master/lib/generators/surveyor/templates/surveys/kitchen_sink_survey.rb)

## Support

This is a demonstration setup. For production use, please follow the compatibility recommendations above.
