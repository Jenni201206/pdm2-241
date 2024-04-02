import 'dart:io';
import 'dart:async';
import 'dart:isolate';

void main() async {
  String aluno1 = 'Jennifer Mariano da Silva Alves';
  print('avaliação 03: feita por ' + aluno1);
  
  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation (SendPort sendPort) async {
  final result = await File('./bin/arquivo.txt').readAsString();
  sendPort.send(result);
}