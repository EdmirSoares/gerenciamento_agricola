# Gerenciamento Agrícola

[![Flutter](https://img.shields.io/badge/Flutter-3.10.8-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.8-0175C2?logo=dart)](https://dart.dev)
[![Drift](https://img.shields.io/badge/Drift-2.31.0-orange)](https://drift.simonbinder.eu/)
[![License](https://img.shields.io/badge/License-Private-red)]()

> **Sistema completo de gestão agrícola com arquitetura robusta e funcionalidade offline-first**

Um aplicativo móvel desenvolvido em Flutter para gerenciar operações agrícolas de forma eficiente e confiável, mesmo sem conexão com a internet. Nasceu da necessidade real de um produtor rural que precisava de um sistema funcional na palma da mão, mas enfrentava limitações de conectividade 5G/internet na propriedade familiar.

---

## Índice

- [Visão Geral](#visão-geral)
- [Motivação](#motivação)
- [Por Que Flutter?](#por-que-flutter)
- [Arquitetura](#arquitetura)
- [Tecnologias](#tecnologias)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Funcionalidades](#funcionalidades)
- [Instalação](#instalação)
- [Testes](#testes)
- [Roadmap](#roadmap)

---

## Visão Geral

O **Gerenciamento Agrícola** é uma solução mobile completa para produtores rurais que necessitam gerenciar:

- **Controle de Estoque**: produtos, insumos e produção
- **Categorização de Produtos**: sementes, fertilizantes, defensivos, etc.
- **Simulações de Crédito Agrícola**: cálculos de juros compostos
- **Movimentações de Estoque**: entrada/saída, localização, lotes
- **Alertas Inteligentes**: estoque baixo, produtos vencendo

O diferencial está na **arquitetura offline-first**: todos os dados são armazenados localmente com Drift (SQLite), garantindo funcionamento total sem internet e sincronização futura quando houver conectividade.

---

## Motivação

Este projeto surgiu de uma **necessidade real** de um amigo e produtor rural que enfrentava desafios com:

- **Conectividade limitada**: Zona rural com cobertura 5G/4G instável ou inexistente
- **Mobilidade**: Necessidade de acessar informações diretamente no campo
- **Confiabilidade**: Dados críticos que não podem depender de conexão online
- **Simplicidade**: Interface intuitiva para usuários não técnicos

O resultado é um aplicativo **100% funcional offline**, com dados persistentes e interface responsiva.

---

## Por Que Flutter?

A escolha do Flutter foi estratégica, baseada em:

### **Performance**
- Compilação nativa (ARM/x64) com performance próxima ao nativo
- Renderização em 60fps (120fps em dispositivos compatíveis) via Skia Engine
- Garbage Collection otimizado do Dart

### **Confiabilidade**
- Type-safe com Null Safety obrigatório desde Dart 2.12
- Hot Reload para desenvolvimento ágil sem perder estado
- Testes unitários, de widgets e integração nativos

### **Robustez**
- Arquitetura reativa com BLoC/Cubit (gerenciamento de estado previsível)
- ORM type-safe com Drift (queries validadas em compile-time)
- Injeção de dependências com GetIt (testabilidade e desacoplamento)

---

## Arquitetura

O projeto segue **Clean Architecture** com separação clara de responsabilidades em camadas:

```
                    PRESENTATION                         
  (Cubits + States + Pages + Widgets)                    
  ↓ emits states                                         
─────────────────────────────────────────────────────────

                         ↓ calls

─────────────────────────────────────────────────────────
                       DOMAIN                            
  (Entities + UseCases + Repository Interfaces)          
  • Business Logic pura (sem dependências externas)      
  • Entities com validações no construtor               
─────────────────────────────────────────────────────────

                         ↓ implements

─────────────────────────────────────────────────────────
                        DATA                             
  (Repositories Impl + Database + Datasources)           
  • Drift ORM com migrations automáticas                
  • Type-safe queries validadas em compile-time          

```

### **Princípios Aplicados**

- **SOLID**: Cada classe tem responsabilidade única, interfaces bem definidas
- **Dependency Inversion**: Domain não conhece Data/Presentation
- **Separation of Concerns**: UI não contém lógica de negócio
- **Testability**: Repositories mockáveis, UseCases isolados

---

## Estrutura do Projeto

```
lib/
├── core/                        # Camada transversal (compartilhada)
│   ├── constants/               # Strings, cores, dimensões
│   ├── errors/                  # Exceptions e Failures customizados
│   ├── theme/                   # ThemeData (Light/Dark mode)
│   ├── params/                  # DTOs para UseCases
│   ├── utils/                   # Helpers (formatadores, validadores)
│   └── injection/               # GetIt (Dependency Injection)
│       └── service_locator.dart # Registro de Singletons/Factories
│
├── data/                        # Camada de Infraestrutura
│   ├── database/                # Drift ORM
│   │   ├── app_database.dart    # Configuração + Migrations
│   │   └── tables.dart          # Definições das tabelas SQL
│   ├── datasources/             # Fontes de dados (Local/Remote)
│   ├── models/                  # DTOs (JSON ↔ Entity)
│   └── repositories/            # Implementações concretas
│       ├── category_repository_impl.dart
│       ├── products_repository_impl.dart
│       ├── stock_repository_impl.dart
│       └── simulation_repository_impl.dart
│
├── domain/                      # Camada de Negócio (Business Logic)
│   ├── entities/                # Modelos de domínio puros
│   │   ├── category_entity.dart
│   │   ├── products_entity.dart
│   │   ├── stock_entity.dart
│   │   └── simulation_entity.dart
│   ├── repositories/            # Contratos (interfaces)
│   │   ├── category_repository.dart
│   │   ├── products_repository.dart
│   │   └── stock_repository.dart
│   └── usecases/                # Casos de uso (lógica de negócio)
│       ├── category_usecase.dart  # CRUD de categorias
│       ├── products_usecase.dart  # CRUD de produtos
│       ├── stock_usecase.dart     # Gestão de estoque
│       └── calculate_credit_usecase.dart
│
├── presentation/                # Camada de Interface
│   ├── cubits/                  # Gerenciamento de estado
│   │   ├── category_cubit.dart + category_state.dart
│   │   ├── products_cubit.dart + products_state.dart
│   │   ├── stock_cubit.dart + stock_state.dart
│   │   └── simulation_cubit.dart + simulation_state.dart
│   ├── pages/                   # Telas completas
│   │   ├── home_page.dart
│   │   ├── categories/
│   │   ├── products/
│   │   └── stock/
│   └── widgets/                 # Componentes reutilizáveis
│       ├── buttons/
│       ├── cards/
│       └── forms/
│
└── main.dart                    # Entry point + inicialização DI
```

### **Decisões Arquiteturais**

#### **1. Drift ORM (SQLite)**
- Type-safe queries validadas em compile-time
- Migrations automáticas com `MigrationStrategy`
- Suporte a JOINs complexos e CTEs
- Geração de código com `build_runner`

```dart
// Exemplo de query type-safe
Future<List<StockEntity>> getStockExpiringWithin(int days) async {
  final now = DateTime.now();
  final targetDate = now.add(Duration(days: days));
  
  final query = _db.select(_db.farmStock)
    ..where((tbl) => 
      tbl.expirationDate.isNotNull() &
      tbl.expirationDate.isBetweenValues(now, targetDate) &
      tbl.isDeleted.equals(false)
    );
  
  return query.get(); // Retorno tipado automaticamente
}
```

#### **2. BLoC/Cubit Pattern**
- Gerenciamento de estado reativo e previsível
- Separação entre eventos (actions) e estados (UI)
- Testabilidade (pode mockar states)

```dart
// Estado tipado e imutável
abstract class StockState {}
class StockLoading extends StockState {}
class StockLoaded extends StockState {
  final List<StockEntity> stocks;
  StockLoaded(this.stocks);
}
class StockError extends StockState {
  final String message;
  StockError(this.message);
}
```

#### **3. Dependency Injection com GetIt**
- Singletons para Database e Repositories (compartilham instância)
- Factories para Cubits (nova instância a cada chamada)
- Fácil substituição para testes (mocks)

```dart
void setup() {
  // Singleton: única instância do banco
  sl.registerSingleton<AppDatabase>(AppDatabase());
  
  // LazySingleton: criado quando solicitado
  sl.registerLazySingleton<IStockRepository>(
    () => StockRepositoryImpl(sl<AppDatabase>()),
  );
  
  // Factory: nova instância sempre
  sl.registerFactory(() => StockCubit(
    sl(), sl(), sl(), // UseCases injetados
  ));
}
```

---

## Tecnologias

### **Core**
| Tecnologia | Versão | Propósito |
|------------|--------|-----------|
| **Flutter** | 3.10.8 | Framework UI multiplataforma |
| **Dart** | 3.10.8 | Linguagem type-safe com null-safety |

### **State Management**
| Pacote | Versão | Uso |
|--------|--------|-----|
| **flutter_bloc** | ^9.1.1 | Gerenciamento de estado reativo (Cubit/BLoC) |

### **Database & Persistence**
| Pacote | Versão | Uso |
|--------|--------|-----|
| **drift** | ^2.31.0 | ORM type-safe para SQLite |
| **sqlite3_flutter_libs** | ^0.5.41 | Bindings nativos do SQLite3 |
| **path_provider** | ^2.1.5 | Localização de diretórios do sistema |
| **path** | ^1.9.1 | Manipulação de caminhos de arquivo |

### **Dependency Injection**
| Pacote | Versão | Uso |
|--------|--------|-----|
| **get_it** | ^9.2.0 | Service Locator para DI |

### **Utilities**
| Pacote | Versão | Uso |
|--------|--------|-----|
| **decimal** | ^3.2.4 | Cálculos precisos (valores monetários) |
| **intl** | ^0.20.2 | Internacionalização e formatação |

### **Development Tools**
| Pacote | Versão | Uso |
|--------|--------|-----|
| **build_runner** | ^2.11.0 | Geração de código (Drift) |
| **drift_dev** | ^2.31.0 | Gerador de código do Drift |
| **test** | ^1.26.3 | Framework de testes unitários |
| **flutter_lints** | ^6.0.0 | Regras de lint recomendadas |

---

## Funcionalidades

### **Implementadas**

#### **Gestão de Estoque**
- Adicionar/Editar/Excluir itens de estoque
- Controle por lote e localização
- Rastreamento de validade
- Alertas de estoque baixo (propriedade `isLowStock`)
- Busca por nome de produto (INNER JOIN)
- Filtros avançados:
  - Estoque abaixo de quantidade X
  - Produtos vencendo em X dias
  - Produtos vencidos

#### **Categorias**
- CRUD completo
- Relacionamento com produtos (1:N)
- Soft delete (flag `isDeleted`)

#### **Produtos**
- CRUD completo
- Categorização
- Flag de produção própria (`isProduction`)
- Busca por nome
- Filtro por categoria

#### **Simulador de Crédito Agrícola**
- Cálculo de juros compostos
- Histórico de simulações
- Persistência offline

### **Validações Implementadas**

Todas as camadas possuem validações defensivas:

**Entity Level:**
```dart
factory StockEntity.create({...}) {
  if (productId <= 0) {
    throw ArgumentError('ID do produto deve ser maior que zero');
  }
  if (quantity < 0) {
    throw ArgumentError('Quantidade não pode ser negativa');
  }
  if (expirationDate != null && expirationDate.isBefore(DateTime.now())) {
    throw ArgumentError('Data de validade não pode ser no passado');
  }
  // ...
}
```

**UseCase Level:**
```dart
Future<List<StockEntity>> call(double threshold) async {
  if (threshold < 0) {
    throw ArgumentError('Quantidade limite não pode ser negativa');
  }
  return await _repository.getStockBelowQuantity(threshold);
}
```

**Cubit Level:**
```dart
Future<void> addStock(...) async {
  if (productId <= 0) {
    emit(StockError('ID do produto inválido'));
    return;
  }
  if (quantity < 0) {
    emit(StockError('Quantidade não pode ser negativa'));
    return;
  }
  // ...
}
```

---

## Instalação

### **Pré-requisitos**

- Flutter SDK 3.10.8+
- Dart SDK 3.10.8+
- Android Studio / Xcode (para emuladores)
- Git

### **Clone e Configuração**

```bash
# Clone o repositório
git clone https://github.com/EdmirSoares/gerenciamento_agricola.git
cd gerenciamento_agricola

# Instale as dependências
flutter pub get

# Gere os arquivos do Drift
dart run build_runner build --delete-conflicting-outputs

# Execute o app
flutter run
```

### **Estrutura do Banco de Dados**

O Drift gerará automaticamente as tabelas no primeiro run. Schema atual (v3):

```sql
CREATE TABLE farm_stock (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id INTEGER NOT NULL,
  quantity REAL NOT NULL,              -- Migrado de INT para REAL
  minimum_stock REAL,
  location TEXT,
  lot_number TEXT,
  expiration_date INTEGER,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL,
  is_deleted INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (product_id) REFERENCES farm_products(id)
);

CREATE INDEX idx_stock_product ON farm_stock(product_id);
```

---

## Testes

O projeto possui atualmente **25 testes unitários** cobrindo UseCases:

```bash
# Executar todos os testes
flutter test

# Executar teste específico
flutter test test/domain/usecases/category_usecase_test.dart

# Coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

### **Cobertura Atual**

| Módulo | Testes | Status |
|--------|--------|--------|
| Category UseCases | 9 | Passing |
| Products UseCases | 16 | Passing |
| Stock UseCases | 0 | Pendente |

**Exemplo de Teste:**

```dart
test('Should create category with auto timestamps', () async {
  // Arrange
  const name = 'Fertilizantes';
  final beforeCreate = DateTime.now();

  // Act
  await createCategoryUseCase(name);

  // Assert
  verify(mockRepository.saveCategory(any)).called(1);
  
  final capturedCategory = verify(
    mockRepository.saveCategory(capturedThat(isA<CategoryEntity>()))
  ).captured.single as CategoryEntity;
  
  expect(capturedCategory.name, name);
  expect(capturedCategory.createdAt.isAfter(beforeCreate), true);
});
```

---

## Roadmap

### **Fase 1: MVP Offline** (Concluído)
- [x] Estrutura do projeto com Clean Architecture
- [x] Database local com Drift
- [x] CRUD de Categorias
- [x] CRUD de Produtos
- [x] Gestão de Estoque completa
- [x] Simulador de Crédito

### **Fase 2: UX/UI** (Em Progresso)
- [ ] Design System (cores, tipografia, componentes)
- [ ] Telas de Categorias
- [ ] Telas de Produtos
- [ ] Telas de Estoque (lista, detalhes, formulários)
- [ ] Dashboard com gráficos (estoque, vencimentos)
- [ ] Dark Mode

### **Fase 3: Recursos Avançados** (Planejado)
- [ ] Movimentações de estoque (histórico de entrada/saída)
- [ ] Relatórios em PDF
- [ ] Backup local em JSON
- [ ] Áreas de plantio (geolocalização)
- [ ] Controle de fornecedores
- [ ] Gestão de compras

---

## Licença

Este projeto é **privado** e não está disponível para uso comercial ou redistribuição, mas sinta-se livre para usar de inspiração!

---

## Contribuindo

Este é um projeto pessoal, mas sugestões são bem-vindas via Issues.

---

</div>