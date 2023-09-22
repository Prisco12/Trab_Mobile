import 'dart:io';
import 'package:trab_mobile/cliente.dart';
import 'package:trab_mobile/conta.dart';

void main() {
  var cliente1 = PessoaFisica('João', 1, '123.456.789-00');
  var cliente2 = PessoaFisica('Maria', 2, '987.654.321-00');
  var cliente3 = PessoaJuridica('Empresa XYZ', 3, '12.345.678/0001-90');

  var contaPoupanca1 = Poupanca(101, 0.0);
  var contaPoupanca2 = Poupanca(102, 0.0);
  var contaSalario = Salario(201);
  var contaCorrente = Corrente(301);

  contaPoupanca1.adicionarTitular(cliente1);
  contaPoupanca1.adicionarTitular(cliente2);

  contaPoupanca2.adicionarTitular(cliente2);

  contaSalario.adicionarTitular(cliente3);

  stdout.writeln('Bem-vindo ao My Banco App');
  while (true) {
    stdout.writeln('Escolha uma opção:');
    stdout.writeln('1 - Consultar Saldo');
    stdout.writeln('2 - Realizar Depósito');
    stdout.writeln('3 - Realizar Saque');
    stdout.writeln('4 - Extrato');
    stdout.writeln('5 - Solicitar Empréstimo');
    stdout.writeln('6 - Fazer Investimento');
    stdout.writeln('7 - Sair');

    var opcao = stdin.readLineSync();
    switch (opcao) {
      case '1':
        stdout.writeln('Escolha a conta:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        switch (escolhaConta) {
          case '1':
            print(contaPoupanca1.extrato());
            break;
          case '2':
            print(contaPoupanca2.extrato());
            break;
          case '3':
            print(contaSalario.extrato());
            break;
          case '4':
            print(contaCorrente.extrato());
            break;
          default:
            stdout.writeln('Conta inválida');
            break;
        }
        break;
      case '2':
        stdout.writeln('Escolha a conta para depósito:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        stdout.writeln('Digite o valor do depósito:');
        var valorDepositoStr = stdin.readLineSync();
        var valorDeposito = double.tryParse(valorDepositoStr ?? '');
        if (valorDeposito != null && valorDeposito > 0) {
          switch (escolhaConta) {
            case '1':
              contaPoupanca1.depositar(valorDeposito);
              break;
            case '2':
              contaPoupanca2.depositar(valorDeposito);
              break;
            case '3':
              contaSalario.depositar(valorDeposito);
              break;
            case '4':
              contaCorrente.depositar(valorDeposito);
              break;
            default:
              stdout.writeln('Conta inválida');
              break;
          }
        } else {
          stdout.writeln('Valor de depósito inválido');
        }
        break;
      case '3':
        stdout.writeln('Escolha a conta para saque:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        stdout.writeln('Digite o valor do saque:');
        var valorSaqueStr = stdin.readLineSync();
        var valorSaque = double.tryParse(valorSaqueStr ?? '');
        if (valorSaque != null && valorSaque > 0) {
          switch (escolhaConta) {
            case '1':
              if (contaPoupanca1.sacar(valorSaque)) {
                stdout.writeln('Saque realizado com sucesso');
              } else {
                stdout.writeln('Saldo insuficiente para saque');
              }
              break;
            case '2':
              if (contaPoupanca2.sacar(valorSaque)) {
                stdout.writeln('Saque realizado com sucesso');
              } else {
                stdout.writeln('Saldo insuficiente para saque');
              }
              break;
            case '3':
              if (contaSalario.sacar(valorSaque)) {
                stdout.writeln('Saque realizado com sucesso');
              } else {
                stdout.writeln('Saldo insuficiente para saque');
              }
              break;
            case '4':
              if (contaCorrente.sacar(valorSaque)) {
                stdout.writeln('Saque realizado com sucesso');
              } else {
                stdout.writeln('Saldo insuficiente para saque');
              }
              break;
            default:
              stdout.writeln('Conta inválida');
              break;
          }
        } else {
          stdout.writeln('Valor de saque inválido');
        }
        break;
      case '4':
        stdout.writeln('Escolha a conta para extrato:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        switch (escolhaConta) {
          case '1':
            print(contaPoupanca1.extrato());
            break;
          case '2':
            print(contaPoupanca2.extrato());
            break;
          case '3':
            print(contaSalario.extrato());
            break;
          case '4':
            print(contaCorrente.extrato());
            break;
          default:
            stdout.writeln('Conta inválida');
            break;
        }
        break;
      case '5':
        stdout.writeln('Escolha a conta para solicitar empréstimo:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        stdout.writeln('Digite o valor do empréstimo:');
        var valorEmprestimoStr = stdin.readLineSync();
        var valorEmprestimo = double.tryParse(valorEmprestimoStr ?? '');
        if (valorEmprestimo != null && valorEmprestimo > 0) {
          stdout.writeln('Digite a taxa de juros:');
          var taxaJurosStr = stdin.readLineSync();
          var taxaJuros = double.tryParse(taxaJurosStr ?? '');
          if (taxaJuros != null && taxaJuros >= 0) {
            switch (escolhaConta) {
              case '1':
                contaPoupanca1.solicitarEmprestimo(valorEmprestimo, taxaJuros);
                break;
              case '2':
                contaPoupanca2.solicitarEmprestimo(valorEmprestimo, taxaJuros);
                break;
              case '3':
                contaSalario.solicitarEmprestimo(valorEmprestimo, taxaJuros);
                break;
              case '4':
                contaCorrente.solicitarEmprestimo(valorEmprestimo, taxaJuros);
                break;
              default:
                stdout.writeln('Conta inválida');
                break;
            }
          } else {
            stdout.writeln('Taxa de juros inválida');
          }
        } else {
          stdout.writeln('Valor de empréstimo inválido');
        }
        break;
      case '6':
        stdout.writeln('Escolha a conta para fazer investimento:');
        stdout.writeln('1 - Conta Poupança 1');
        stdout.writeln('2 - Conta Poupança 2');
        stdout.writeln('3 - Conta Salário');
        stdout.writeln('4 - Conta Corrente');
        var escolhaConta = stdin.readLineSync();
        stdout.writeln('Digite o valor do investimento:');
        var valorInvestimentoStr = stdin.readLineSync();
        var valorInvestimento = double.tryParse(valorInvestimentoStr ?? '');
        if (valorInvestimento != null && valorInvestimento > 0) {
          stdout.writeln('Digite a taxa de rendimento:');
          var taxaRendimentoStr = stdin.readLineSync();
          var taxaRendimento = double.tryParse(taxaRendimentoStr ?? '');
          if (taxaRendimento != null && taxaRendimento >= 0) {
            switch (escolhaConta) {
              case '1':
                contaPoupanca1.fazerInvestimento(valorInvestimento, taxaRendimento);
                break;
              case '2':
                contaPoupanca2.fazerInvestimento(valorInvestimento, taxaRendimento);
                break;
              case '3':
                contaSalario.fazerInvestimento(valorInvestimento, taxaRendimento);
                break;
              case '4':
                contaCorrente.fazerInvestimento(valorInvestimento, taxaRendimento);
                break;
              default:
                stdout.writeln('Conta inválida');
                break;
            }
          } else {
            stdout.writeln('Taxa de rendimento inválida');
          }
        } else {
          stdout.writeln('Valor de investimento inválido');
        }
        break;
      case '7':
        stdout.writeln('Obrigado por usar o My Banco App. Até logo!');
        exit(0);
        break;
      default:
        stdout.writeln('Opção inválida');
        break;
    }
  }
}
