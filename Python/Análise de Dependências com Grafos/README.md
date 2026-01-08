# Análise de Dependências com Grafos

Este projeto aplica conceitos de grafos para analisar dependências entre pacotes de software,
modelando o problema como um grafo direcionado.

Cada pacote é representado por um vértice e cada dependência por uma aresta direcionada.
O sistema permite verificar a viabilidade de instalação, detectar ciclos, identificar pacotes críticos
e simular impactos da remoção de pacotes.

## Funcionalidades
- Leitura de dependências a partir de arquivo
- Verificação de ciclos no grafo
- Ordenação topológica para instalação
- Consulta de dependências diretas e indiretas
- Simulação de remoção de pacotes
- Identificação de pacotes críticos

## Tecnologias
- Python
- NetworkX
- Grafos direcionados
