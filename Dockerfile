# Use the official WordPress image as a base
FROM wordpress:latest

# Copy your WordPress code into the image
COPY ./path-to-your-wordpress-code /var/www/html

# Ensure the WordPress files are owned by the correct user
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for the WordPress service
EXPOSE 80
