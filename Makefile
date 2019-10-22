IMAGE_NAME := waja/php73-fpm

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it $(IMAGE_NAME) -v | grep -E '^PHP\s7\.3' | cut -d'.' -f3 --complement)" = "PHP 7.3" ]; then exit 1; fi
#	@if ! [ "$$(docker run --rm -it $(IMAGE_NAME) /opt/calcardbackup/calcardbackup -h | head -4 | tail -1 | cut -d' ' -f11)" = "calcardbackup" ]; then exit 1; fi
