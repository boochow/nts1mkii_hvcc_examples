# --- Config ---
PLATFORMDIR   ?= $(HOME)/logue-sdk/platform
INSTALLDIR    ?= ..
PD_DIR        ?= ./pd
PDLIBDIR      ?= ./heavylib

INSTALL := INSTALLDIR=$(INSTALLDIR) install

CATS := osc mod del rev

SCRIPTS := \
  osc:nts1mkii_osc \
  mod:nts1mkii_modfx \
  del:nts1mkii_delfx \
  rev:nts1mkii_revfx

up = $(shell echo $(1) | tr '[:lower:]' '[:upper:]')

define DEF_PATCHES_UP
$(call up,$(1))_PATCHES := \
  $(notdir $(basename $(wildcard $(PD_DIR)/$(1)/*.pd)))
endef

$(foreach c,$(CATS),$(eval $(call DEF_PATCHES_UP,$(c))))

PATCHES := $(OSC_PATCHES) $(MOD_PATCHES) $(DEL_PATCHES) $(REV_PATCHES)

ALL_PATCH_DIRS := \
  $(OSC_PATCHES:%=osc/%) \
  $(MOD_PATCHES:%=mod/%) \
  $(DEL_PATCHES:%=del/%) \
  $(REV_PATCHES:%=rev/%)


# build rule generator
# usage: $(eval $(call GEN_RULE,<cat>,<hvcc -G>))
define GEN_RULE
$(1)/%: $(PD_DIR)/$(1)/%.pd
	@echo "Processing $$(@F) in $(1)..."
	@mkdir -p $$@
	hvcc $$< -G $(2) -o $$@ -n $$(@F) -p $(PDLIBDIR)
	$$(MAKE) -C $$@/logue_unit PLATFORMDIR=$$(PLATFORMDIR)/nts-1_mkii $(INSTALL)

# define target for each unit
%: $(1)/%
	@:
endef

# Generate rules for all categories
$(foreach kv,$(SCRIPTS), \
  $(eval CAT := $(word 1,$(subst :, ,$(kv)))) \
  $(eval GEN := $(word 2,$(subst :, ,$(kv)))) \
  $(eval $(call GEN_RULE,$(CAT),$(GEN))) \
)

# Targets

.PHONY: all
all: $(ALL_PATCH_DIRS)

.SECONDARY: $(ALL_PATCH_DIRS)

%.zip: %
	@echo "Archiving $@..."
	$(MAKE) -C $</logue_unit clean
	cd $< && \
	  ln -s logue_unit src && \
	  zip -r $(@F) src $(@F:.zip=.nts1mkiiunit) ; \
	  rm -f src

.PHONY: zip
zip: $(ALL_PATCH_DIRS:%=%.zip)
	@echo "All patch archives have been created."

.PHONY: clean
clean:
	@set -e; for d in $(ALL_PATCH_DIRS); do \
	  if [ -d $$d/logue_unit ]; then \
	    $(MAKE) -C $$d/logue_unit clean; \
	  fi; \
	done

.PHONY: clean-all
clean-all:
	@set -e; \
	for d in $(ALL_PATCH_DIRS); do \
		rm -rf -- "$$d"; \
	done
