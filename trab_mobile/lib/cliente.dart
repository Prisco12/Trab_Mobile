class Cliente {
  final String nome;
  final int id;

  Cliente(this.nome, this.id);
}

class PessoaFisica extends Cliente {
  final String cpf;

  PessoaFisica(String nome, int id, this.cpf) : super(nome, id);
}

class PessoaJuridica extends Cliente {
  final String cnpj;

  PessoaJuridica(String nome, int id, this.cnpj) : super(nome, id);
}
