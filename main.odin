package main

import "core:fmt"
import "core:math"
import rl "vendor:raylib"

set_characters_in_mem :: proc(memory: ^[]u8) {
	NUM_BYTES_CHARACTER :: 5
	for i in 0 ..= 0xF {
		character := i / 5
		byte := i - character
		character_bytes: [NUM_BYTES_CHARACTER]u8
		switch character {
		case 0x0:
			character_bytes = {0xF0, 0x90, 0x90, 0x90, 0xF0}
		case 0x1:
			character_bytes = {0x20, 0x60, 0x20, 0x20, 0x70}
		case 0x2:
			character_bytes = {0xF0, 0x10, 0xF0, 0x80, 0xF0}
		case 0x3:
			character_bytes = {0xF0, 0x10, 0xF0, 0x10, 0xF0}
		case 0x4:
			character_bytes = {0x90, 0x90, 0xF0, 0x10, 0x10}
		case 0x5:
			character_bytes = {0xF0, 0x80, 0xF0, 0x10, 0xF0}
		case 0x6:
			character_bytes = {0xF0, 0x80, 0xF0, 0x90, 0xF0}
		case 0x7:
			character_bytes = {0xF0, 0x10, 0x20, 0x40, 0x40}
		case 0x8:
			character_bytes = {0xF0, 0x90, 0xF0, 0x90, 0xF0}
		case 0x9:
			character_bytes = {0xF0, 0x90, 0xF0, 0x10, 0xF0}
		case 0xA:
			character_bytes = {0xF0, 0x90, 0xF0, 0x90, 0x90}
		case 0xB:
			character_bytes = {0xE0, 0x90, 0xE0, 0x90, 0xE0}
		case 0xC:
			character_bytes = {0xF0, 0x80, 0x80, 0x80, 0xF0}
		case 0xD:
			character_bytes = {0xE0, 0x90, 0x90, 0x90, 0xE0}
		case 0xE:
			character_bytes = {0xF0, 0x80, 0xF0, 0x80, 0xF0}
		case 0xF:
			character_bytes = {0xF0, 0x80, 0xF0, 0x80, 0x80}
		}

		for byte, j in character_bytes {
			memory[(character * NUM_BYTES_CHARACTER) + j] = byte
		}
	}
}

complete_instruction :: proc(instruction: u16) {
	nibble_one := instruction | 0xF000 >> 12
	nibble_two := instruction | 0x0F00 >> 8
	nibble_three := instruction | 0x00F0 >> 4
	nibble_four := instruction | 0x000F

	instruction_addr := instruction & 0x0FFF
	instruction_vx := u8(nibble_two)
	instruction_vy := u8(nibble_three)
	instruction_byte := u8(instruction & 0x00FF)
	switch nibble_one {
	case 0x0:
		switch {
		// 00E0 CLS
		case nibble_two == 0x0 && nibble_three == 0xE && nibble_four == 0x0:
			cls_instr()
		// 00EE RET
		case nibble_two == 0x0 && nibble_three == 0xE && nibble_four == 0xE:
			ret_instr()
		// 0nnn SYS addr
		case:
			sys_instr(instruction_addr)
		}
	// 1nnn JP addr
	case 0x1:
		jp_addr_instr(instruction_addr)
	// 2nnn CALL addr
	case 0x2:
		jp_addr_instr(instruction_addr)
	case 0x3:
		se_vx_byte_instr(instruction_vx, instruction_byte)
	case 0x4:
		sne_vx_byte_instr(instruction_vx, instruction_byte)
	case 0x5:
		se_vx_vy_instr(instruction_vx, instruction_vy)
	case 0x6:
		ld_vx_byte_instr(instruction_vx, instruction_byte)
	case 0x7:
		add_vx_byte_instr(instruction_vx, instruction_byte)
	}
}

cls_instr :: proc() {

}

ret_instr :: proc() {

}

sys_instr :: proc(addr: u16) {

}

jp_addr_instr :: proc(addr: u16) {

}

call_instr :: proc(addr: u16) {

}

se_vx_byte_instr :: proc(register, byte: u8) {

}

sne_vx_byte_instr :: proc(register, byte: u8) {

}

se_vx_vy_instr :: proc(register_x, register_y: u8) {

}

ld_vx_byte_instr :: proc(regsiter, byte: u8) {

}

add_vx_byte_instr :: proc(register, byte: u8) {

}

ld_vx_vy_instr :: proc(register_x, register_y: u8) {

}

or_instr :: proc(register_x, register_y: u8) {

}

and_instr :: proc(register_x, register_y: u8) {

}

xor_instr :: proc(register_x, register_y: u8) {

}

add_vx_vy_instr :: proc(register_x, register_y: u8) {

}

sub_instr :: proc(register_x, register_y: u8) {

}

shr_instr :: proc(register_x, register_y: u8) {

}

subn_instr :: proc(register_x, register_y: u8) {

}

shl_instr :: proc(register_x, register_y: u8) {

}

sne_vx_vy_instr :: proc(register_x, register_y: u8) {

}

ld_instr :: proc(addr: u16) {

}

jp_v0_instr :: proc(addr: u16) {

}

rnd_instr :: proc(register, byte: u8) {

}

drw_instr :: proc(register_x, register_y, nibble: u8) {

}

skp_instr :: proc(register: u8) {

}

sknp_instr :: proc(register: u8) {

}

ld_vx_dt_instr :: proc(register: u8) {

}

ld_k_instr :: proc(register: u8) {

}

ld_dt_vx_instr :: proc(register: u8) {

}

ld_st_vx_instr :: proc(register: u8) {

}

add_i_vx_instr :: proc(register: u8) {

}

ld_f_vx_instr :: proc(register: u8) {

}

ld_b_vx_instr :: proc(register: u8) {

}

ld_i_vx_instr :: proc(register: u8) {

}

ld_vx_i_instr :: proc(register: u8) {

}

main :: proc() {
	SCREEN_WIDTH :: 800
	SCREEN_HEIGHT :: 450

	VIRTUAL_SCREEN_WIDTH :: 64
	VIRTUAL_SCREEN_HEIGHT :: 32
	virtualRatio :: SCREEN_WIDTH / VIRTUAL_SCREEN_WIDTH
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "hellooo")
	defer rl.CloseWindow()

	worldSpaceCamera, screenSpaceCamera: rl.Camera2D
	worldSpaceCamera.zoom = 1
	screenSpaceCamera.zoom = 1

	target := rl.LoadRenderTexture(VIRTUAL_SCREEN_WIDTH, VIRTUAL_SCREEN_HEIGHT)
	defer rl.UnloadRenderTexture(target)

	sourceRec := rl.Rectangle{0, 0, f32(target.texture.width), f32(-target.texture.height)}
	destRec := rl.Rectangle {
		-virtualRatio,
		-virtualRatio,
		SCREEN_WIDTH + (virtualRatio * 2),
		SCREEN_HEIGHT + (virtualRatio * 2),
	}

	origin := rl.Vector2{0, 0}

	TARGET_FPS :: 60
	rl.SetTargetFPS(TARGET_FPS)

	MEMORY_SIZE_BYTES :: 4096
	memory: [MEMORY_SIZE_BYTES]u8

	BYTES_FOR_CHARACTERS :: 90
	CHARACTERS_START :: 0
	characters_slice := memory[CHARACTERS_START:][:BYTES_FOR_CHARACTERS]
	set_characters_in_mem(&characters_slice)

	NUM_REGISTERS :: 0xF
	registers: [NUM_REGISTERS]u8
	i_register: u16

	program_counter: u16
	stack_pointer: u8

	STACK_SIZE :: 16
	stack: [STACK_SIZE]u16

	delay_timer: u8 = 0
	sound_timer: u8 = 255

	rl.InitAudioDevice()
	defer rl.CloseAudioDevice()

	tone := rl.LoadSound("tone.wav")
	defer rl.UnloadSound(tone)

	for !rl.WindowShouldClose() {
		{ 	// Update game
			if sound_timer != 0 {
				sound_timer -= 1
				if !rl.IsSoundPlaying(tone) {
					rl.PlaySound(tone)
				}
			} else if rl.IsSoundPlaying(tone) {
				rl.StopSound(tone)
			}

			if delay_timer != 0 {
				delay_timer -= 1
			}

		}
		{ 	// Draw world space
			rl.BeginTextureMode(target)
			defer rl.EndTextureMode()
			rl.ClearBackground(rl.RAYWHITE)
			{
				rl.BeginMode2D(worldSpaceCamera)
				defer rl.EndMode2D()
			}
		}
		{ 	// Draw screen space
			rl.BeginDrawing()
			defer rl.EndDrawing()
			rl.ClearBackground(rl.RED)
			{
				rl.BeginMode2D(screenSpaceCamera)
				defer rl.EndMode2D()
				rl.DrawTexturePro(target.texture, sourceRec, destRec, origin, 0, rl.WHITE)
			}
			rl.DrawFPS(rl.GetScreenWidth() - 95, 10)
		}
	}
}
