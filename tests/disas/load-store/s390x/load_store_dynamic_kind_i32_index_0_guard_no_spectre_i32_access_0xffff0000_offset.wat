;;! target = "s390x"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

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
;;       lg      %r1, 8(%r2)
;;       lg      %r1, 0(%r1)
;;       la      %r1, 0xa0(%r1)
;;       clgrtle %r15, %r1
;;       stmg    %r7, %r15, 0x38(%r15)
;;       lgr     %r1, %r15
;;       aghi    %r15, -0xa0
;;       stg     %r1, 0(%r15)
;;       llgfr   %r3, %r4
;;       lgr     %r9, %r4
;;       llilf   %r4, 0xffff0004
;;       algfr   %r4, %r9
;;       jgnle   0x3c
;;       lg      %r7, 0x68(%r2)
;;       clgr    %r4, %r7
;;       jgh     0x68
;;       ag      %r3, 0x60(%r2)
;;       llilh   %r2, 0xffff
;;       strv    %r5, 0(%r2, %r3)
;;       lmg     %r7, %r15, 0xd8(%r15)
;;       br      %r14
;;       .byte   0x00, 0x00
;;
;; wasm[0]::function[1]:
;;       lg      %r1, 8(%r2)
;;       lg      %r1, 0(%r1)
;;       la      %r1, 0xa0(%r1)
;;       clgrtle %r15, %r1
;;       stmg    %r14, %r15, 0x70(%r15)
;;       lgr     %r1, %r15
;;       aghi    %r15, -0xa0
;;       stg     %r1, 0(%r15)
;;       llgfr   %r3, %r4
;;       lgr     %r5, %r4
;;       llilf   %r4, 0xffff0004
;;       algfr   %r4, %r5
;;       jgnle   0xa8
;;       lg      %r5, 0x68(%r2)
;;       clgr    %r4, %r5
;;       jgh     0xd4
;;       ag      %r3, 0x60(%r2)
;;       llilh   %r2, 0xffff
;;       lrv     %r2, 0(%r2, %r3)
;;       lmg     %r14, %r15, 0x110(%r15)
;;       br      %r14
;;       .byte   0x00, 0x00
