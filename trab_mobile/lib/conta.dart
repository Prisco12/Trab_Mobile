import 'cliente.dart';

class Emprestimo {
  final double valor;
  final double taxaJuros;

  Emprestimo(this.valor, this.taxaJuros);
}

class Investimento {
  final double valorInvestido;
  final double taxaRendimento;

  Investimento(this.valorInvestido, this.taxaRendimento);
}

class Conta {
  final int numero;
  double saldo;
  List<Cliente> titulares = [];
  List<Emprestimo> emprestimos = [];
  List<Investimento> investimentos = [];

  Conta(this.numero, this.saldo);

  void adicionarTitular(Cliente titular) {
    if (titulares.length < 2) {
      titulares.add(titular);
    } else {
      print('A conta já atingiu o número máximo de titulares.');
    }
  }

  String extrato() {
    return 'Número da Conta: $numero\nSaldo: R\$ $saldo';
  }

  void solicitarEmprestimo(double valor, double taxaJuros) {
    if (valor > 0) {
      emprestimos.add(Emprestimo(valor, taxaJuros));
      saldo += valor;
      print('Empréstimo de R\$$valor aprovado. Saldo atual: R\$$saldo');
    } else {
      print('Valor de empréstimo inválido.');
    }
  }

  void fazerInvestimento(double valorInvestido, double taxaRendimento) {
    if (valorInvestido > 0) {
      investimentos.add(Investimento(valorInvestido, taxaRendimento));
      saldo += valorInvestido;
      print('Investimento de R\$$valorInvestido realizado. Saldo atual: R\$$saldo');
    } else {
      print('Valor de investimento inválido.');
    }
  }
}

class Poupanca extends Conta {
  Poupanca(int numero, double saldoInicial)
      : assert(saldoInicial >= 50.0, 'Saldo inicial deve ser pelo menos R\$50,00'),
        super(numero, saldoInicial);

  void depositar(double valor) {
    saldo += valor;
  }

  bool sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
      return true;
    }
    return false;
  }
}

class Salario extends Conta {
  Salario(int numero) : super(numero, 0.0);

  void depositar(double valor) {
    print('Não é possível realizar depósitos em conta salário.');
  }

  bool sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
      return true;
    }
    return false;
  }
}

class Corrente extends Conta {
  Corrente(int numero) : super(numero, 0.0);

  void depositar(double valor) {
    saldo += valor;
  }

  bool sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
      return true;
    }
    return false;
  }
}
