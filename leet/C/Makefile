BUILD_DIR=build
debug=all

all: $(BUILD_DIR)
	meson compile -C  $(BUILD_DIR) -v

$(BUILD_DIR):
	meson setup $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
