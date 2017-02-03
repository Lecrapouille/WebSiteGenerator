SOURCES=$(patsubst %-fr.m4,%-fr.html,$(wildcard *-fr.m4))
OBJS=$(SOURCES:.m4=.html)

ifeq ($(BUILD),)
BUILD = ../../build
endif
M4X_PATH=../../m4x
EMACS_PATH=../../emacs
M4X_FILES=$(M4X_PATH)/oueb.m4x $(M4X_PATH)/helico.m4x $(M4X_PATH)/liens.m4x

VPATH=$(BUILD):$(BUILD)/css

all: $(OBJS) css img proper

%.html: %.m4
	@echo "Generating file $@"
	@m4 $(M4X_FILES) -DTHISFILE=$(patsubst %-fr.m4,%,$<) -DLANG=fr $< | cat -s | sed -e '1d' > $(BUILD)/$@
	@emacs -batch --no-init-file --load $(EMACS_PATH)/html-accent.el --file $(BUILD)/$@ --funcall html-accent --funcall save-buffer 2> /dev/null

css:
	@echo "Copying css files" 
	@cp -r ../../data/css/* $(BUILD)/css

img:
	@echo "Copying pictures files" 
	@cp -r ../../data/img/* $(BUILD)/img

proper:
	@rm -fr $(BUILD)/*~

$(OBJS): | $(BUILD)
$(BUILD):
	@mkdir -p $(BUILD)/css
	@mkdir -p $(BUILD)/img

clean:
	@rm -fr *~ $(BUILD)
