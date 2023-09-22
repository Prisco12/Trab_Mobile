import 'package:test/test.dart';
import 'package:trab_mobile/cliente.dart';
import 'package:trab_mobile/conta.dart';

void main() {
  group('Conta', () {
    test('Adicionar titulares', () {
      var cliente1 = PessoaFisica('João', 1, '123.456.789-00');
      var cliente2 = PessoaFisica('Maria', 2, '987.654.321-00');
      var cliente3 = PessoaJuridica('Empresa XYZ', 3, '12.345.678/0001-90');

      // Corrigir o saldo inicial para atender ao requisito de R$50,00
      var contaPoupanca = Poupanca(101, 50.0);
      contaPoupanca.adicionarTitular(cliente1);
      contaPoupanca.adicionarTitular(cliente2);
      
      expect(contaPoupanca.titulares, [cliente1, cliente2]);

      contaPoupanca.adicionarTitular(cliente3); // Não deve adicionar mais de 2 titulares
      expect(contaPoupanca.titulares, [cliente1, cliente2]);
    });

    test('Depósito e saque', () {
      // Corrigir o saldo inicial para atender ao requisito de R$50,00
      var contaPoupanca = Poupanca(101, 50.0);

      contaPoupanca.depositar(100.0);
      expect(contaPoupanca.saldo, 150.0);

      var saqueBemSucedido = contaPoupanca.sacar(50.0);
      expect(saqueBemSucedido, true);
      expect(contaPoupanca.saldo, 100.0);

      var saqueMalSucedido = contaPoupanca.sacar(160.0);
      expect(saqueMalSucedido, false);
      expect(contaPoupanca.saldo, 100.0);
    });

    // Outros testes para solicitar empréstimo e fazer investimento podem ser adicionados aqui.
  });

  group('Cliente', () {
    test('Criar clientes', () {
      var cliente1 = PessoaFisica('João', 1, '123.456.789-00');
      var cliente2 = PessoaJuridica('Empresa XYZ', 2, '12.345.678/0001-90');

      expect(cliente1.nome, 'João');
      expect(cliente2.nome, 'Empresa XYZ');
    });
  });
}
