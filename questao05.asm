.data
msg1:   .asciiz "Digite um numero inteiro: "
msgRes: .asciiz "Somatoria dos impares = "
.text
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    move $t2, $t0
    move $t3, $t1
    ble  $t0, $t1, ordem_ok
    move $t2, $t1       
    move $t3, $t0       
ordem_ok:

    addi $t4, $t2, 1    
    li   $t5, 0         

laco_impar:
    bge  $t4, $t3, fim_laco  

    andi $t6, $t4, 1
    beqz $t6, nao_impar
    add  $t5, $t5, $t4       

nao_impar:
    addi $t4, $t4, 1      
    j    laco_impar

fim_laco:
    li $v0, 4
    la $a0, msgRes
    syscall
    
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall