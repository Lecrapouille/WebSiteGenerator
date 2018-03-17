#################################################################
SOURCES=$(patsubst %-fr.m4,%-fr.html,$(wildcard *-fr.m4))
OBJS=$(SOURCES:.m4=.html)

#################################################################
ifeq ($(BUILD),)
BUILD = ../../build
endif

#################################################################
LAYOUT=../../layout-01

#################################################################
M4X_PATH=../../html-generator
M4X_FILES=$(M4X_PATH)/main.m4x
EMACS_SCRIPT_PATH=$(M4X_PATH)/emacs
VPATH=$(BUILD):$(M4X_PATH)

#################################################################
all: $(OBJS)
	@xdg-open ../../build/index-fr.html >/dev/null

%.html: %.m4 Makefile $(M4X_FILES) $(LAYOUT)/layout.m4x
	@echo "Generating file $@"
	@m4 -I$(M4X_PATH) $(M4X_FILES) $(LAYOUT)/layout.m4x -DTHISFILE=$(patsubst %-fr.m4,%,$<) -DLANG=fr $< | cat -s | awk 'NF {f=1} f' > $(BUILD)/$@
	@emacs -batch --no-init-file --load $(EMACS_SCRIPT_PATH)/html-accent.el --file $(BUILD)/$@ --funcall html-accent --funcall save-buffer 2> /dev/null
	@rm -fr $(BUILD)/*~

$(OBJS): | $(BUILD)
$(BUILD):
	@mkdir -p $(BUILD)/css
	@mkdir -p $(BUILD)/img
	@echo "Copying css files"
	@cp -r $(LAYOUT)/css/* $(BUILD)/css/
	@echo "Copying pictures files"
	@cp -r ../../icons/ $(BUILD)/img

clean:
	@rm -fr *~ $(BUILD)
