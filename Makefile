SHELL := /bin/bash

# ====== RUN SERVICES IN PARALLEL ======
run-all:
	$(MAKE) run-api-gateway &
	$(MAKE) run-user-service &
	$(MAKE) run-order-service &
	$(MAKE) run-book-service &
	wait

# ====== INDIVIDUAL RUN TARGETS ======
run-api-gateway:
	cd api-gateway && go run ./cmd

run-user-service:
	cd user-service && \
	source ../.profile && \
	go run ./cmd

run-order-service:
	cd order-service && \
	source ../.profile && \
	go run ./cmd

run-book-service:
	cd book-service && \
	source ../.profile && \
	go run ./cmd

# ====== CLEANUP ======
clean:
	find . -type d -name "__pycache__" -exec rm -r {} + 2>/dev/null || true

.PHONY: run-all run-api-gateway run-user-service run-order-service run-book-service \
        migrate-up-user migrate-up-order migrate-up-book migrate-up-all \
        migrate-force-user migrate-force-order migrate-force-book \
        clean

stop-all:
	-kill `cat $(PID_DIR)/api.pid` || true
	-kill `cat $(PID_DIR)/user.pid` || true
	-kill `cat $(PID_DIR)/order.pid` || true
	-kill `cat $(PID_DIR)/book.pid` || true
	rm -rf $(PID_DIR)