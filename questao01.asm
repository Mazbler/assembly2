.data
comprimento: .asciiz "digite o valor do comprimento:"
largura: .asciiz "digite o valor da largura:"
altura: .asciiz "digite o valor de altura:"
volume: .asciiz "o valor do volume é de:"
.text

main:
li $v0, 4
la $a0, comprimento
syscall
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, largura
syscall
li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, altura
syscall
li $v0, 5
syscall
move $t2, $v0

mul $t3, $t0, $t1
mul $t3, $t3, $t2

li $v0, 4
la $a0, volume
syscall
li $v0, 1
move $a0, $t3
syscall
li $v0, 10
syscall