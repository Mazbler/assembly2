.data
msg1:   .asciiz "Digite um numero positivo: "
msgErr: .asciiz "Valor invalido! Apenas numeros positivos.\n"
msgMax: .asciiz "Maior valor = "
msgMin: .asciiz "\nMenor valor = "

.text
main:
    li $t0, 0       
    li $t1, 10      
laco_10:
    beq $t0, $t1, fim_programa
    
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0  

    blez $t2, invalido

    bnez $t0, verifica_limites
    move $t3, $t2   
    move $t4, $t2   
    j numero_aceito

verifica_limites:
  
    ble  $t2, $t3, nao_maior
    move $t3, $t2
nao_maior:

    bge  $t2, $t4, nao_menor
    move $t4, $t2
nao_menor:

numero_aceito:
    addi $t0, $t0, 1   
    j    laco_10

invalido:
    li $v0, 4
    la $a0, msgErr
    syscall
    j    laco_10      

fim_programa:
  
    li $v0, 4
    la $a0, msgMax
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, msgMin
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall