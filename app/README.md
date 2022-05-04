# myFinance Flutter

## File structure

    core
      data_source
        database
        api
      provider
        feature
        repository
      util
    ui
      app
      common
      view

## Dependencies

    provider - Easy way to handle data for widgets
    graphql_flutter - Client for GraphQL
    moor - ORM for Sqflite
    json_serializable - Serialize / Deserialize objects

## Instructions

### Setup

    - Flutter I18n Json: Update
      Generate I18n
    - flutter packages pub run build_runner build --delete-conflicting-outputs
      Generate .jorm (database) and .g (serializable) files

### Moor ORM

    - Create table
    - Create dao
    - Create declare tables and daos in DatabaseClient
    - Generate .g file

### Json Serializable

    - Create domain
    - Put annotations
    - Generate .g file

### vscode-flutter-i18n-json

    - Usings vscode-flutter-i18n-json plugin
    - Add strings to /i18n/*.json
    - Run command "Flutter I18n Json: Update"
    - Use generated class I18n

### Naming

    Model: Ui related data class
    Entity: Database related data class
    Domain: Api related data class

### Provider Architecture

    Global
      DatabaseClient
      ApiClient

    DataSource
      UserApi
      CategoryApi
      AccountApi
      TransactionApi

    AppState

    Repository
      UserRepository
      CategoryRepository
      AccountRepository
      TransactionRepository

    UI
      CreateAccountViewModel
