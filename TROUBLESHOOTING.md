# Surveyor Gem Troubleshooting Guide

## Common Issues and Solutions

### 1. Formtastic Version Conflicts

**Error:** `uninitialized constant Formtastic::SemanticFormBuilder`

**Cause:** Surveyor expects an older version of formtastic (~2.2.1) but newer Rails versions install formtastic 5.x.

**Solution:** Use Rails 4.2 with compatible gem versions as shown in the main README.

### 2. Rails Version Incompatibility

**Error:** Various undefined method errors or constant conflicts

**Cause:** Surveyor was built for Rails 3.2-4.0 and uses deprecated Rails APIs.

**Solution:** 
- Use Rails 4.2.11.3 (last supported version)
- Or consider migrating to a modern survey solution

### 3. Ruby Version Issues

**Error:** Gem compilation failures or version conflicts

**Cause:** Modern Ruby versions (3.x) may have compatibility issues with older gems.

**Solution:** Use Ruby 2.1-2.3 for best compatibility:
```bash
rbenv install 2.3.8
rbenv local 2.3.8
```

### 4. Dependency Resolution Problems

**Error:** Bundler cannot resolve gem dependencies

**Cause:** Complex dependency conflicts between old and new gems.

**Solution:** Use the exact Gemfile provided in the installation script.

## Working Configuration

For a guaranteed working setup:

```ruby
# Gemfile for Rails 4.2 + Surveyor
source 'https://rubygems.org'

gem 'rails', '4.2.11.3'
gem 'sqlite3', '~> 1.3.13'
gem 'surveyor', git: 'https://github.com/NUARIG/surveyor.git'
gem 'therubyracer', platforms: :ruby
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'formtastic', '~> 2.3.0'  # Explicitly specify compatible version

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
end
```

## Alternative Survey Solutions

If you cannot get Surveyor working, consider these modern alternatives:

### 1. Custom Rails Solution
Build surveys with:
- `simple_form` or `formtastic` (latest versions)
- Custom models for Survey, Question, Answer
- JSON columns for flexible question types

### 2. SaaS Solutions
- **Typeform**: User-friendly interface
- **Google Forms**: Free and simple
- **SurveyMonkey**: Feature-rich
- **JotForm**: Good Rails integration

### 3. Modern Rails Gems
- `reform` + `dry-validation` for complex forms
- `wicked` for multi-step forms
- `cocoon` for dynamic nested forms

## Getting Additional Help

1. **Check the original repository issues:** https://github.com/NUBIC/surveyor/issues
2. **Look for community forks** with updated compatibility
3. **Consider the NUARIG fork:** https://github.com/NUARIG/surveyor
4. **Join Rails communities** for migration advice

## Migration Path

If you have existing Surveyor data and need to migrate:

1. Export surveys using Surveyor's built-in JSON export
2. Design new survey system with modern Rails
3. Write migration scripts to transform the data
4. Test thoroughly with sample surveys

Remember: Surveyor served its purpose well but modern Rails applications have better alternatives for survey functionality.