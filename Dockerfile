# Use an official Ruby runtime as a parent image
FROM ruby:3.2

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y nodejs npm

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Build the Sitepress site
RUN bundle exec sitepress build

# Expose port 8080
EXPOSE 80

# Start the server
CMD ["bundle", "exec", "sitepress", "server", "-p", "80", "-a", "0.0.0.0"]
