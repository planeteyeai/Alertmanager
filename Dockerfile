# Use official Prometheus Alertmanager image
FROM prom/alertmanager:latest

# Copy alertmanager configuration
COPY alertmanager.yml /etc/alertmanager/alertmanager.yml

# Expose port (Railway will use $PORT env variable)
EXPOSE 9093

# Start Alertmanager
# Note: Railway.json handles the PORT variable in startCommand
ENTRYPOINT ["/bin/alertmanager"]
CMD ["--config.file=/etc/alertmanager/alertmanager.yml", \
     "--storage.path=/alertmanager"]
