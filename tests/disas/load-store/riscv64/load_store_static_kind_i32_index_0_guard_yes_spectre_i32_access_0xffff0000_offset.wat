;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a4, a2, 0x20
;;       srli    a5, a4, 0x20
;;       lui     a4, 0x10
;;       addi    a1, a4, -4
;;       sltu    a4, a1, a5
;;       ld      a0, 0x60(a0)
;;       add     a5, a0, a5
;;       lui     a0, 0xffff
;;       slli    a0, a0, 4
;;       add     a5, a5, a0
;;       neg     a2, a4
;;       not     a4, a2
;;       and     a0, a5, a4
;;       sw      a3, 0(a0)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;
;; wasm[0]::function[1]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a3, a2, 0x20
;;       srli    a5, a3, 0x20
;;       lui     a3, 0x10
;;       addi    a1, a3, -4
;;       sltu    a4, a1, a5
;;       ld      a0, 0x60(a0)
;;       add     a5, a0, a5
;;       lui     a3, 0xffff
;;       slli    a0, a3, 4
;;       add     a5, a5, a0
;;       neg     a2, a4
;;       not     a4, a2
;;       and     a0, a5, a4
;;       lw      a0, 0(a0)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
