$(BUILD_DIR)/boot.o: src/boot/$(TARGET)/boot.S
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) -o $(@D)/$(*F).s src/boot/$(TARGET)/$(*F).S
	$(AS) $(ASFLAGS) -o $(@D)/$(*F).o $(@D)/$(*F).s -a=$(@D)/$(*F).lst

$(BUILD_DIR)/boot.elf: $(BUILD_DIR)/boot.o
	@mkdir -p $(@D)
	$(LD) $(LDFLAGS) -Ttext 0x7C00 -s -e _start -o $(@D)/boot.elf $(@D)/boot.o

$(BUILD_DIR)/boot.img: $(BUILD_DIR)/boot.elf
	@mkdir -p $(@D)
	objcopy --remove-section=.note.gnu.property -O binary $(@D)/boot.elf $(@D)/boot.img 

boot.img: $(BUILD_DIR)/boot.img