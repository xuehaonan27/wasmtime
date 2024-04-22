;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0x1000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0x1000))

;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     x9, #0
;;       ldr     x10, [x0, #0x60]
;;       add     x10, x10, x2
;;       add     x10, x10, #1, lsl #12
;;       mov     w8, #-0x1004
;;       cmp     x2, x8
;;       csel    x11, x9, x10, hi
;;       csdb
;;       str     w3, [x11]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;
;; wasm[0]::function[1]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     x9, #0
;;       ldr     x10, [x0, #0x60]
;;       add     x10, x10, x2
;;       add     x10, x10, #1, lsl #12
;;       mov     w8, #-0x1004
;;       cmp     x2, x8
;;       csel    x11, x9, x10, hi
;;       csdb
;;       ldr     w0, [x11]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
