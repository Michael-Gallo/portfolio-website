PORT ?= 8080

.PHONY: serve

serve:
	@echo "Serving at http://localhost:$(PORT) (Ctrl+C to stop)"
	docker run --rm -p $(PORT):80 \
		-v "$(CURDIR)/templates/index.html:/usr/share/nginx/html/index.html:ro" \
		-v "$(CURDIR)/static:/usr/share/nginx/html/static:ro" \
		nginx:latest
