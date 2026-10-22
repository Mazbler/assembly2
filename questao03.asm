.data
valor1: .asciiz "digite o primeiro valor:"
valor2: .asciiz "digite o segundo valor:"
resultado: .asciiz "a diferença é de:"
.text
main:
li $v0, 4
la $a0, valor1
syscall
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, valor2
syscall
li $v0, 5
syscall
move $t1, $v0 

bgt $t0, $t1, primeiro_maior

sub $t2, $t1, $t0
j jerson

primeiro_maior:
sub $t2, $t0, $t1

jerson:
li $v0, 4
la $a0, resultado
syscall
li $v0, 1
move $a0, $t2
syscall
li $v0, 10
syscall