class {{pascalCase name}}Constants {
  static List<{{pascalCase name}}Model> modelList = [
    {{pascalCase name}}Model(id: "example", title: "Example"),
  ];

  static {{pascalCase name}}Model getDefault() {
    return {{pascalCase name}}Model(id: "example", title: "Example");
  }

  static {{pascalCase name}}Model getById(String id) {
    return modelList.firstWhere(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
