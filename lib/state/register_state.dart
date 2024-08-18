class RegisterState {
  static final RegisterState _instance = RegisterState._internal();
  factory RegisterState() => _instance;

  // Properties
  int _selectedTabIndex = 0;

  // Constructor
  RegisterState._internal() {
    _selectedTabIndex = 3;
  }
  
  // Setter 
  next() => _selectedTabIndex++;
  back() => _selectedTabIndex--;
  
  // Getter
  int get selectedTabIndex => _selectedTabIndex;
}